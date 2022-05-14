import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'dart:typed_data';

import 'package:printing/printing.dart';

Future<Uint8List> generateDocument(PdfPageFormat format) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);
  final font1 = await PdfGoogleFonts.openSansRegular();
  final font2 = await PdfGoogleFonts.openSansBold();

  doc.addPage(pw.Page(
      pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 0,
            marginLeft: 0,
            marginRight: 0,
            marginTop: 0,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          )),
      build: (context) {
        return pw.Padding(
            padding: const pw.EdgeInsets.only(
              left: 60,
              right: 60,
              bottom: 30,
            ),
            child: pw.Column(children: [
              pw.Spacer(),
              pw.Header(title: 'Good Morning'),
              pw.Spacer(),
              pw.Paragraph(text: 'Dorms with Checkouts: ')
            ]));
      }));
  return doc.save();
}
