import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:printing/printing.dart';
import 'package:qclean/src/rooms/dorm.dart';
import 'package:qclean/src/rooms/private.dart';

const NONE = 'NONE';

Future<Uint8List> generateDocument(
    List<Dorm> dorms, List<Private> privates) async {
  const format = PdfPageFormat.standard;
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
        textDirection: pw.TextDirection.ltr,
        theme: pw.ThemeData.withFont(
          base: font1,
          bold: font2,
        ),
      ),
      build: (context) {
        return pw.Padding(
            padding: const pw.EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Header(
                      title: 'Good Morning',
                      child: pw.Row(children: [
                        pw.Text(
                          'Good Morning',
                        )
                      ])),
                  pw.Text('Dorms to strip and make: ${bedList(dorms)} ',
                      textAlign: pw.TextAlign.left),
                  pw.Text('Dorms with Check-ins: '),
                  pw.Text('Privates to strip and make: ${_privates(privates)}'),
                  pw.Text('Hoover corridors and clean Bathrooms'),
                  pw.Text('Privates with Check-ins: '),
                  pw.Bullet(
                      text:
                          'CLEAN ALL BATHROOMS 4 bathmats for female showers, 1 for private bathroom'),
                  pw.Bullet(text: 'CLEAN UPSTAIRS AND DOWNSTAIRS TOILETS'),
                  pw.Bullet(
                      text:
                          'Change hand towels – including private toilet and showers'),
                  pw.Bullet(text: 'HOOVER ALL CORRIDORS'),
                  pw.Bullet(text: 'CHECK ALL BINS (CHANGE IF NEEDED)'),
                  pw.Bullet(text: 'REMOVE ALL RUBBISH FROM DORM ROOMS'),
                  pw.Bullet(text: 'REFILL ALL TOILET PAPER (IF NECESSARY)'),
                  pw.Bullet(
                      text:
                          'REFILL ALL HAND-SOAP AND SHAMPOO IN PRIVATE BATHROOM'),
                  pw.Bullet(
                      text: 'MAKE SURE BEDS WITH ARRIVALS ARE CLEAN AND TIDY'),
                  pw.Bullet(
                      text: 'Remove all towels, clothes, etc.  left in rooms.'),
                  pw.Bullet(
                      text:
                          'Check under all beds, and remove any rubbish.  Rooms should be spotless!'),
                  pw.Bullet(
                      text: 'Vacuum Reception – PLEASE HOOVER THE TILES, TOO!'),
                  pw.Bullet(
                      text:
                          'Mop Reception, front and back stairs, and area in front of Staff room.  DRY FLOORS!'),
                  pw.Bullet(text: 'EMPTY THE HAIR TRAPS IN ALL SHOWERS!!'),
                  pw.Bullet(
                      text:
                          'Clean windows around Reception and the common room'),
                  pw.Bullet(text: 'WIPE ALL DOORHANDLES AND HANDRAILS'),
                ]));
      }));
  return doc.save();
}

String bedList(List<Dorm> dorms) {
  if (dorms.isEmpty) {
    return NONE;
  }
  var list = '';
  for (var dorm in dorms) {
    list += dorm.number.toString();
    for (var bed in dorm.beds) {
      list += bed.name;
    }
    list += ' ';
  }
  return list;
}

String _privates(List<Private> privates) {
  if (privates.isEmpty) {
    return NONE;
  }
  var list = '';
  for (var private in privates) {
    list += 'PVT';
    list += private.number.toString();
  }
  return list;
}
