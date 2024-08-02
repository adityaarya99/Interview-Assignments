part of pdf_extractor_cubit;

abstract class PdfExtractorState {}

class PdfExtractionInitial extends PdfExtractorState {}

class PdfExtractionSuccess extends PdfExtractorState {
  final AccountDetailModel accountDetailModel;
  final List<Transaction> transactionModel;
  PdfExtractionSuccess({
    required this.accountDetailModel,
    required this.transactionModel,
  });
}
