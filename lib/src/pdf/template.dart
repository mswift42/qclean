import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:printing/printing.dart';
import 'package:qclean/src/rooms/dorm.dart';
import 'package:qclean/src/rooms/private.dart';

const none = 'NONE';

Future<Uint8List> generateDocument(
    List<Dorm> dormcheckouts,
    List<Private> privatecheckouts,
    List<Dorm> dormcheckins,
    List<Private> privatecheckins) async {
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
                        _regText(
                          'Good Morning',
                        )
                      ])),
                  _regText(
                      'Dorms to strip and make: ${bedList(dormcheckouts)}'),
                  _regText('Dorms with Check-ins: ${bedList(dormcheckins)}'),
                  _regText(
                      'Privates to strip and make: ${_privates(privatecheckouts)}'),
                  _regText('Hoover corridors and clean Bathrooms'),
                  _regText(
                      'Privates with Check-ins: ${_privates(privatecheckins)}'),
                  _bulletText(
                      'CLEAN ALL BATHROOMS 4 bathmats for female showers, 1 for private bathroom'),
                  _bulletText('CLEAN UPSTAIRS AND DOWNSTAIRS TOILETS'),
                  _bulletText(
                      'Change hand towels – including private toilet and showers'),
                  _bulletText('HOOVER ALL CORRIDORS'),
                  _bulletText('CHECK ALL BINS (CHANGE IF NEEDED)'),
                  _bulletText('REMOVE ALL RUBBISH FROM DORM ROOMS'),
                  _bulletText('REFILL ALL TOILET PAPER (IF NECESSARY)'),
                  _bulletText(
                      'REFILL ALL HAND-SOAP AND SHAMPOO IN PRIVATE BATHROOM'),
                  _bulletText(
                      'MAKE SURE BEDS WITH ARRIVALS ARE CLEAN AND TIDY'),
                  _bulletText(
                      'Remove all towels, clothes, etc.  left in rooms.'),
                  _bulletText(
                      'Check under all beds, and remove any rubbish.  Rooms should be spotless!'),
                  _bulletText(
                      'Vacuum Reception – PLEASE HOOVER THE TILES, TOO!'),
                  _bulletText(
                      'Mop Reception, front and back stairs, and area in front of Staff room.  DRY FLOORS!'),
                  _bulletText('EMPTY THE HAIR TRAPS IN ALL SHOWERS!!'),
                  _bulletText(
                      'Clean windows around Reception and the common room'),
                  _bulletText('WIPE ALL DOORHANDLES AND HANDRAILS'),
                ]));
      }));
  return doc.save();
}

pw.Text _regText(String text) {
  return pw.Text(text, textScaleFactor: 0.8);
}

pw.Bullet _bulletText(String text) {
  return pw.Bullet(text: text, style: const pw.TextStyle(fontSize: 10));
}

String bedList(List<Dorm> dorms) {
  if (dorms.isEmpty) {
    return none;
  }
  var list = '';
  for (var dorm in dorms) {
    list += dorm.number.toString();
    for (var bed in dorm.beds) {
      list += bed.name;
    }
    list += ', ';
  }
  return list;
}

String _privates(List<Private> privates) {
  if (privates.isEmpty) {
    return none;
  }
  var list = '';
  for (var private in privates) {
    list += 'PVT';
    list += '${private.number.toString()}, ';
  }
  return list;
}
