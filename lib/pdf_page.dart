import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:rev_pdf/globals.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Future<Uint8List> getPDF() {
    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Expanded(
                  child: pw.Text("Roll no."),
                ),
                pw.Expanded(
                  flex: 3,
                  child: pw.Text("Name"),
                ),
                pw.Expanded(
                  child: pw.Text("Per"),
                ),
              ],
            ),
            ...Globals.allStudents.map(
              (e) => pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Text("${e['roll_no']}"),
                  ),
                  pw.Expanded(
                    flex: 3,
                    child: pw.Text("${e['name']}"),
                  ),
                  pw.Expanded(
                    child: pw.Text("${e['per']}"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Page"),
      ),
      body: PdfPreview(
        build: (format) => getPDF(),
      ),
    );
  }
}
