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
  Future<Uint8List> getPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) => pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Profile Section
            pw.Container(
              width: 250,
              color: PdfColors.blueGrey800,
              padding: const pw.EdgeInsets.all(20),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  if (Globals.image != null)
                    pw.ClipRRect(
                      // borderRadius: pw.BorderRadius.circular(100),
                      child: pw.Image(
                        pw.MemoryImage(
                          Globals.image!.readAsBytesSync(),
                        ),
                        fit: pw.BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  pw.SizedBox(height: 20),
                  // Name and Profession
                  pw.Text(
                    Globals.name ?? "Not Added",
                    style: pw.TextStyle(
                      fontSize: 30,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.Text(
                    Globals.profession ?? "Not Added",
                    style: const pw.TextStyle(
                      fontSize: 18,
                      color: PdfColors.grey300,
                    ),
                  ),
                  pw.SizedBox(height: 30),
                  // Contact Information
                  pw.Text(
                    "Contact Info",
                    style: pw.TextStyle(
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                    ),
                  ),
              
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "+91 ${Globals.contact ?? "Not Added"}",
                    style: const pw.TextStyle(
                      fontSize: 16,
                      color: PdfColors.grey300,
                    ),
                  ),
                  pw.Text(
                    "${Globals.email ?? "Not Added"}",
                    style: const pw.TextStyle(
                      fontSize: 16,
                      color: PdfColors.grey300,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(width: 20),
            // Main Content
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Career Objective
                  _buildSectionTitle("Career Objective"),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    Globals.carrier ?? "Not Added",
                    style: const pw.TextStyle(
                      fontSize: 16,
                      lineSpacing: 5,
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // Professional Experience
                  _buildSectionTitle("Professional Experience"),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "${Globals.position ?? "Not Added"} at ${Globals.company ?? "Not Added"}",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    "${Globals.joinedDate ?? "Not Added"} - ${Globals.leavingDate ?? "Not Added"}",
                    style: const pw.TextStyle(
                      fontSize: 16,
                      color: PdfColors.grey600,
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // Education
                  _buildSectionTitle("Education"),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "${Globals.course ?? "Not Added"} at ${Globals.institute ?? "Not Added"}",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    "Percentage: ${Globals.percentage ?? "Not Added"}%",
                    style: const pw.TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  pw.Text(
                    "Passing Year: ${Globals.passyear ?? "Not Added"}",
                    style: const pw.TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // Projects
                  _buildSectionTitle("Projects"),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    Globals.projectTitle ?? "Not Added",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    Globals.projectRoles ?? "Not Added",
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontStyle: pw.FontStyle.italic,
                    ),
                  ),
                  pw.Text(
                    Globals.projectDescription ?? "Not Added",
                    style: const pw.TextStyle(
                      fontSize: 16,
                      lineSpacing: 5,
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // References
                  _buildSectionTitle("References"),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "${Globals.refName ?? "Not Added"}, ${Globals.refDesignation ?? "Not Added"} at ${Globals.refOrganization ?? "Not Added"}",
                    style: const pw.TextStyle(
                      fontSize: 16,
                    ),
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

  pw.Widget _buildSectionTitle(String title) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(vertical: 10),
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: PdfColors.blueGrey300, width: 1),
        ),
      ),
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: 20,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Page"),
      ),
      body: PdfPreview(
        pdfFileName: "RESUME_${Globals.name?.toUpperCase() ?? 'DEFAULT'}",
        build: (format) => getPdf(),
      ),
    );
  }
}
