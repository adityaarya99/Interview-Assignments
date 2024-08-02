library pdf_extractor_cubit;

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_reader/feature/pdf_extractor/model/account_detail_model.dart';
import 'package:pdf_reader/feature/pdf_extractor/model/transaction_model.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:intl/intl.dart';

part 'pdf_extractor_state.dart';

class PdfExtractorCubit extends Cubit<PdfExtractorState> {
  PdfExtractorCubit() : super(PdfExtractionInitial());

  Future<void> pickAndExtractPdf() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      File file = File(result.files.single.path!);

      _extractDetailsFromPdf(file);
    }
  }

  Future<void> _extractDetailsFromPdf(File file) async {
    final Uint8List bytes = await file.readAsBytes();
    final PdfDocument document = PdfDocument(inputBytes: bytes);
    String extractedText = PdfTextExtractor(document).extractText();

    // Dispose the document.
    document.dispose();

    String normalText =
        extractedText.replaceAll('\r', ' ').replaceAll('\n', ' ').trim();

    AccountDetailModel accountDetailModel = _extractDetails(normalText);
    List<Transaction> transactionModel = extractTransactions(normalText);
    emit(PdfExtractionSuccess(
      accountDetailModel: accountDetailModel,
      transactionModel: transactionModel,
    ));
  }

  List<Transaction> extractTransactions(String data) {
    final transactionLineRegex = RegExp(
        r'(\d{2} [A-Za-z]{3})\s+(.+?)\s*(?:((?:\d{1,3},)?\d{1,3}(?:\.\d{2})?)\s*(?:((?:\d{1,3},)?\d{1,3}(?:\.\d{2})?)\s*(?:((?:\d{1,3},)?\d{1,3}(?:\.\d{2})?))?)?)?\s*(?=\d{2} [A-Za-z]{3}|$)',
        multiLine: true
    );

    List<Transaction> transactions = [];
    List<Map<String,dynamic>> map = [];

    Iterable<RegExpMatch> matches = transactionLineRegex.allMatches(data);
    for (RegExpMatch match in matches) {
      final date = match.group(1)?.trim() ?? '';
      final description = match.group(2)?.trim() ?? '';
      final debit = match.group(3)?.trim() ?? '';
      final credit = match.group(4)?.trim() ?? '';
      final balance = match.group(5)?.trim() ?? '';

      if (date.isNotEmpty && description.isNotEmpty) {

        map.add({
          'Date': date,
          'Description': description,
          'Debit': debit,
          'Credit': credit,
          'Balance': balance,
        });
        transactions.add(
          Transaction(
              date: date,
              description: description,
              debit: debit,
              credit: credit,
              balance: balance),
        );
      }
    }
    return transactions;
  }

  AccountDetailModel _extractDetails(String normalizedText) {
    String accountNumberPattern = r'Account Number\s+(\d{2} \d{4} \d{8})';
    String statementPeriodPattern =
        r'Statement Period\s+(\d{1,2} \w{3} \d{4})\s*-\s*(\d{1,2} \w{3} \d{4})';
    String closingBalancePattern = r'Closing Balance\s*\$?\s*([\d,\.\s]+)CR';

    RegExp accountNumberRegExp = RegExp(accountNumberPattern);
    RegExp statementPeriodRegExp = RegExp(statementPeriodPattern);
    RegExp closingBalanceRegExp = RegExp(closingBalancePattern);

    String accountNumber =
        accountNumberRegExp.firstMatch(normalizedText)?.group(1) ?? 'Not Found';
    Match? statementPeriodMatch =
        statementPeriodRegExp.firstMatch(normalizedText);
    String statementPeriod = statementPeriodMatch != null
        ? '${statementPeriodMatch.group(1)} - ${statementPeriodMatch.group(2)}'
        : 'Not Found';
    String closingBalance =
        closingBalanceRegExp.firstMatch(normalizedText)?.group(1)?.trim().replaceAll(" ", "") ??
            'Not Found';

    Map<String, dynamic> response = {
      'accountNumber': accountNumber,
      'statementPeriod': statementPeriod,
      'closingBalance': closingBalance,
    };

    return AccountDetailModel.fromJson(response);
  }
}
