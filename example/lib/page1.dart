import 'dart:io';
import 'dart:ui';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/material.dart';


class Page1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Page1State();
  }

}
class Page1State extends State<Page1>{

  PDFDocument? _scannedDocument;
  File? _scannedDocumentFile;
  File? _scannedImage;

  openPdfScanner(BuildContext context) async {
    var doc = await DocumentScannerFlutter.launchForPdf(
      context,
      labelsConfig: {
        ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Verifier",
        ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_SINGLE: "Only 1 Page",
        ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_MULTIPLE:
        "Only {PAGES_COUNT} Page"
      },
      //source: ScannerFileSource.CAMERA
    );
    if (doc != null) {
      _scannedDocument = null;
      setState(() {});
      await Future.delayed(Duration(milliseconds: 100));
      _scannedDocumentFile = doc;
      _scannedDocument = await PDFDocument.fromFile(doc);
      setState(() {});
    }
  }

  openImageScanner(BuildContext context) async {
    var image = await DocumentScannerFlutter.launch(context,
        //source: ScannerFileSource.CAMERA,
        labelsConfig: {
          ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Verifier",
          ScannerLabelsConfig.ANDROID_OK_LABEL: "OK"
        });
    if (image != null) {
      _scannedImage = image;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ANTI FRAUDE'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_scannedDocument != null || _scannedImage != null) ...[
              if (_scannedImage != null)
                Image.file(_scannedImage!,
                    width: 300, height: 300, fit: BoxFit.contain),
              if (_scannedDocument != null)
                Expanded(
                    child: PDFViewer(
                      document: _scannedDocument!,
                    )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    _scannedDocumentFile?.path ?? _scannedImage?.path ?? ''),
              ),
            ],
            Center(
              child: Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () => openPdfScanner(context),
                    child: Text("Document Scan"));
              }),
            ),
            // Center(
            //   child: Builder(builder: (context) {
            //     return ElevatedButton(
            //         onPressed: () => openImageScanner(context),
            //         child: Text("Image Scan"));
            //   }),
            // )
          ],
        ),
      ),
    );
  }

}