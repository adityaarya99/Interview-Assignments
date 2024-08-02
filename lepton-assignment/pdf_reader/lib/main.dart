import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_reader/feature/pdf_extractor/controller/pdf_extractor_cubit.dart';
import 'package:pdf_reader/feature/pdf_extractor/screen/pdf_extractor_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PdfExtractorCubit>(
          create: (BuildContext context) => PdfExtractorCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PDF Extractor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PdfExtractorScreen(),
      ),
    );
  }
}
