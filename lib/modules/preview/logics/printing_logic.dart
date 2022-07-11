import 'dart:io';

import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart' as material;
import 'package:pdf/pdf.dart' show PdfColor, PdfPageFormat;
import 'package:pdf/widgets.dart'
    show
        Document,
        Font,
        Image,
        Page,
        Positioned,
        Stack,
        StackFit,
        Text,
        TextStyle,
        Widget;
import 'package:printing/printing.dart'
    show PdfPreview, Printing, imageFromAssetBundle;

abstract class PrintingLogicInterface {
  static const kName = 'PrintingLogicInterface';
  Future<material.Widget> createPreview();
  Future<void> savePdf({
    required String fileName,
    DirectoryName directoryName = DirectoryName.temporary,
  });
  Future<void> sharePdf({required String fileName});
  Future<void> printWithPreview({required String fileName});
  Future<void> printWithoutPreview({required String fileName});
}

class PrintingLogic implements PrintingLogicInterface {
  const PrintingLogic();

  Future<Document> _createDocument() async {
    final document = Document();

    final background = await imageFromAssetBundle(Assets.images.ikmfLogo.path);

    // final font = await rootBundle.load(
    //   'assets/fonts/${FontFamily.brightwall}.ttf',
    // );
    // final ttf = Font.ttf(font);

    document.addPage(
      Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                left: 0.0,
                top: 0.0,
                child: Image(
                  background,
                  width: 50.0,
                  height: 50.0,
                ),
              ),
              Positioned(
                left: 100.0,
                top: 5.0,
                child: Text(
                  "HELLO",
                  style: TextStyle(
                    fontSize: 15.0,
                    //font: ttf,
                    color: const PdfColor.fromInt(0xFFF3A9B8),
                  ),
                ),
              ),
            ],
          ); // Center
        },
      ),
    );

    return document;
  }

  @override
  Future<material.Widget> createPreview() async {
    final document = await _createDocument();

    return PdfPreview(
      build: (format) => document.save(),
    );
  }

  @override
  Future<void> savePdf({
    required String fileName,
    DirectoryName directoryName = DirectoryName.temporary,
  }) async {
    final document = await _createDocument();

    final output = await directoryName.asyncDirectory;
    final finaleName = '$fileName.pdf';
    final file = File('${output.path}/$finaleName');
    await file.writeAsBytes(await document.save());
  }

  @override
  Future<void> sharePdf({required String fileName}) async {
    final document = await _createDocument();

    await Printing.sharePdf(
      bytes: await document.save(),
      filename: fileName,
    );
  }

  @override
  Future<void> printWithPreview({required String fileName}) async {
    final document = await _createDocument();

    await Printing.layoutPdf(
      onLayout: (_) async => document.save(),
      name: fileName,
      usePrinterSettings: true,
    );
  }

  @override
  Future<void> printWithoutPreview({required String fileName}) async {
    final document = await _createDocument();
    final printers = await Printing.listPrinters();

    await Printing.directPrintPdf(
      printer: printers.first,
      onLayout: (_) async => document.save(),
      name: fileName,
      usePrinterSettings: true,
    );
  }
}
