import 'dart:io';

import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart' as material;
import 'package:pdf/pdf.dart' as pdf;
import 'package:pdf/widgets.dart' as pdf_widgets;
import 'package:printing/printing.dart' as printing;

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

  pdf.PdfPageFormat get _pageFormat {
    return pdf.PdfPageFormat(
      pdf.PdfPageFormat.a4.width,
      pdf.PdfPageFormat.a4.height,
      marginAll: 1.0 * pdf.PdfPageFormat.cm,
    );
  }

  Future<pdf_widgets.Document> _createDocument() async {
    final document = pdf_widgets.Document();

    final background = await printing.imageFromAssetBundle(
      Assets.certificates.certificateJudge.path,
    );

    // final font = await rootBundle.load(
    //   'assets/fonts/${FontFamily.brightwall}.ttf',
    // );
    // final ttf = Font.ttf(font);

    document.addPage(
      pdf_widgets.Page(
        pageFormat: _pageFormat,
        build: (_) {
          return pdf_widgets.Stack(
            children: <pdf_widgets.Widget>[
              pdf_widgets.Positioned.fill(
                child: pdf_widgets.Image(
                  background,
                  fit: pdf_widgets.BoxFit.fill,
                ),
              ),
              pdf_widgets.Positioned(
                left: 100.0,
                top: 5.0,
                child: pdf_widgets.Text(
                  "HELLO",
                  style: pdf_widgets.TextStyle(
                    fontSize: 15.0,
                    //font: ttf,
                    color: const pdf.PdfColor.fromInt(0xFFF3A9B8),
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
    return printing.PdfPreview(
      build: (format) => document.save(),
      initialPageFormat: _pageFormat,
      canChangePageFormat: false,
      canChangeOrientation: false,
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
    await printing.Printing.sharePdf(
      bytes: await document.save(),
      filename: fileName,
    );
  }

  @override
  Future<void> printWithPreview({required String fileName}) async {
    final document = await _createDocument();
    await printing.Printing.layoutPdf(
      onLayout: (_) async => document.save(),
      name: fileName,
      format: _pageFormat,
      usePrinterSettings: true,
    );
  }

  @override
  Future<void> printWithoutPreview({required String fileName}) async {
    final document = await _createDocument();
    final printers = await printing.Printing.listPrinters();
    await printing.Printing.directPrintPdf(
      printer: printers.first,
      onLayout: (_) async => document.save(),
      name: fileName,
      format: _pageFormat,
      usePrinterSettings: true,
    );
  }
}
