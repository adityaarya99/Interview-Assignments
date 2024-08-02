import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_reader/feature/pdf_extractor/controller/pdf_extractor_cubit.dart';
import 'package:pdf_reader/feature/pdf_extractor/widget/app_table_cell.dart';

class PdfExtractorScreen extends StatefulWidget {
  @override
  _PdfExtractorScreenState createState() => _PdfExtractorScreenState();
}

class _PdfExtractorScreenState extends State<PdfExtractorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Extractor'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<PdfExtractorCubit>().pickAndExtractPdf();
                  },
                  child: const Text('Pick and Extract PDF'),
                ),
                const SizedBox(height: 20),
                BlocBuilder<PdfExtractorCubit, PdfExtractorState>(
                  builder: (context, state) {
                    if (state is PdfExtractionSuccess) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account Number: ${state.accountDetailModel.accountNumber}",
                            ),
                            Text(
                              "Statement Period: ${state.accountDetailModel.statementPeriod}",
                            ),
                            Text(
                              "Closing Balance: \$${state.accountDetailModel.closingBalance}",
                            ),

                            Text(
                                "Total Transaction ${state.transactionModel.length}"),

                            const SizedBox(
                              height: 16,
                            ),

                            ///Transaction Data
                            Table(
                              border: TableBorder.all(
                                width: 0.0,
                                color: Colors.black,
                              ),
                              children: [
                                const TableRow(
                                  children: [
                                    AppTableCell(
                                      text: "Date",
                                      isHeading: true,
                                    ),
                                    AppTableCell(
                                      text: "Description",
                                      isHeading: true,
                                    ),
                                    AppTableCell(
                                      text: "Debit",
                                      isHeading: true,
                                    ),
                                    AppTableCell(
                                      text: "Credit",
                                      isHeading: true,
                                    ),
                                    AppTableCell(
                                      text: "Balance",
                                      isHeading: true,
                                    ),
                                  ],
                                ),
                                ...state.transactionModel
                                    .map((transaction) => TableRow(
                                          children: [
                                            AppTableCell(
                                                text: '${transaction.date}'),
                                            AppTableCell(
                                                text:
                                                    '${transaction.description}'),
                                            AppTableCell(
                                                text:
                                                    '${(transaction.debit == 0.00) ? "" : transaction.debit}'),
                                            AppTableCell(
                                                text:
                                                    '${(transaction.credit == 0.00) ? "" : transaction.credit}'),
                                            AppTableCell(
                                                text: '${transaction.balance}'),
                                          ],
                                        ))
                                    .toList(),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                    return const Text(
                      "Waiting for details",
                      style: TextStyle(fontSize: 16),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
