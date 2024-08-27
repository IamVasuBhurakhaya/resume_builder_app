import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resume_builder_app/utils/globals.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  Future<Uint8List> getPdf() {
    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context cnt) => pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 200,
              color: PdfColors.blueGrey800,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(
                    height: 28,
                  ),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 28,
                      ),
                      pw.ClipRRect(
                        verticalRadius: 64,
                        horizontalRadius: 64,
                        child: pw.Image(
                          pw.MemoryImage(
                            Globals.image!.readAsBytesSync(),
                          ),
                          fit: pw.BoxFit.cover,
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          width: MediaQuery.sizeOf(context).height * 0.15,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 28,
                  ),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 28,
                      ),
                      pw.Text(
                        "Contacts",
                        style: pw.TextStyle(
                          color: PdfColors.white,
                          fontSize: 24,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  pw.Divider(color: PdfColors.white, indent: 30),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 28,
                      ),
                      pw.Text(
                        "+91 ",
                        style: const pw.TextStyle(
                          fontSize: 18,
                          color: PdfColors.grey,
                        ),
                      ),
                      pw.SizedBox(
                        width: 7,
                      ),
                      pw.Text(
                        Globals.contact ?? "Not Added",
                        style: const pw.TextStyle(
                          fontSize: 18,
                          color: PdfColors.grey,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 10,
                  ),
                  pw.Row(
                    children: [
                      pw.SizedBox(
                        width: 28,
                      ),
                      pw.Text(
                        Globals.email ?? "Not Added",
                        style: const pw.TextStyle(
                          fontSize: 18,
                          color: PdfColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            pw.SizedBox(
              width: 20,
            ),
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    Globals.name ?? "Not Added",
                    style: pw.TextStyle(
                        fontSize: 38,
                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  pw.Text(
                    Globals.profession ?? "Not Added",
                    style: const pw.TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Divider(),
                  pw.Text(
                    "Carrier Objective",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    ),
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        Globals.carrier ?? "Not Added",
                      ),
                    ],
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
        pdfFileName: "RESUME_${Globals.name?.toUpperCase()}",
        build: (format) => getPdf(),
      ),
    );
  }
}
