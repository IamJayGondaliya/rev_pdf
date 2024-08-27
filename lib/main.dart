import 'package:flutter/material.dart';
import 'package:rev_pdf/add_student_page.dart';
import 'package:rev_pdf/home_page.dart';
import 'package:rev_pdf/pdf_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const HomePage(),
        'add_student_page': (_) => const AddStudentPage(),
        'pdf_page': (_) => const PdfPage(),
      },
    );
  }
}
