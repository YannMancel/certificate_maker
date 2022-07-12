import 'dart:io';

import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart' as material;
import 'package:pdf/pdf.dart' as pdf;
import 'package:pdf/widgets.dart' as pdf_widgets;
import 'package:printing/printing.dart' as printing;

abstract class PrintingLogicInterface {
  static const kName = 'PrintingLogicInterface';
  Future<material.Widget> createPreview(Certificate certificate);
  Future<void> savePdf(
    Certificate certificate, {
    DirectoryName directoryName = DirectoryName.temporary,
  });
  Future<void> sharePdf(Certificate certificate);
  Future<void> printWithPreview(Certificate certificate);
  Future<void> printWithoutPreview(Certificate certificate);
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

  Future<pdf_widgets.Document> _createDocument(Certificate certificate) async {
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
                left: 0.0,
                right: 0.0,
                top: 245.0,
                child: pdf_widgets.Text(
                  'CERTIFIES',
                  textAlign: pdf_widgets.TextAlign.center,
                  style: pdf_widgets.TextStyle(
                    fontSize: 18.0,
                    fontWeight: pdf_widgets.FontWeight.bold,
                    color: const pdf.PdfColor.fromInt(0xFF000000),
                  ),
                ),
              ),
              pdf_widgets.Positioned(
                left: 0.0,
                right: 0.0,
                top: 300.0,
                child: pdf_widgets.Text(
                  certificate.firstNameAndLastName,
                  textAlign: pdf_widgets.TextAlign.center,
                  style: pdf_widgets.TextStyle(
                    fontSize: 32.0,
                    //font: ttf,
                    fontWeight: pdf_widgets.FontWeight.bold,
                    decoration: pdf_widgets.TextDecoration.underline,
                    color: const pdf.PdfColor.fromInt(0xFF893C38),
                  ),
                ),
              ),
              pdf_widgets.Positioned(
                left: 0.0,
                right: 0.0,
                top: 375.0,
                child: pdf_widgets.Text(
                  'ACHIEVED THE TEST OF',
                  textAlign: pdf_widgets.TextAlign.center,
                  style: pdf_widgets.TextStyle(
                    fontSize: 20.0,
                    fontWeight: pdf_widgets.FontWeight.bold,
                    color: const pdf.PdfColor.fromInt(0xFF000000),
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
  Future<material.Widget> createPreview(Certificate certificate) async {
    final document = await _createDocument(certificate);
    return printing.PdfPreview(
      build: (_) => document.save(),
      initialPageFormat: _pageFormat,
      canChangePageFormat: false,
      canChangeOrientation: false,
    );
  }

  @override
  Future<void> savePdf(
    Certificate certificate, {
    DirectoryName directoryName = DirectoryName.temporary,
  }) async {
    final document = await _createDocument(certificate);
    final output = await directoryName.asyncDirectory;
    final file = File('${output.path}/${certificate.fileName}.pdf');
    await file.writeAsBytes(await document.save());
  }

  @override
  Future<void> sharePdf(Certificate certificate) async {
    final document = await _createDocument(certificate);
    await printing.Printing.sharePdf(
      bytes: await document.save(),
      filename: certificate.fileName,
    );
  }

  @override
  Future<void> printWithPreview(Certificate certificate) async {
    final document = await _createDocument(certificate);
    await printing.Printing.layoutPdf(
      onLayout: (_) async => document.save(),
      name: certificate.fileName,
      format: _pageFormat,
      usePrinterSettings: true,
    );
  }

  @override
  Future<void> printWithoutPreview(Certificate certificate) async {
    final document = await _createDocument(certificate);
    final printers = await printing.Printing.listPrinters();
    await printing.Printing.directPrintPdf(
      printer: printers.first,
      onLayout: (_) async => document.save(),
      name: certificate.fileName,
      format: _pageFormat,
      usePrinterSettings: true,
    );
  }
}
