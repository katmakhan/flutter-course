import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluttertemplate/DataModels_Sample/dm_invoice.dart';
import 'package:fluttertemplate/PDFInvoice/pdfComponents.dart';
import 'package:fluttertemplate/PDFInvoice/pdfsaver.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:http/http.dart' as http;

class InvoiceHelper {
  static Future<File> generatePDF(dm_invoice Invoice) async {
    Invoice = Invoice_sample;
    final pdf = Document();

    //Getting data
    ByteData img = await rootBundle.load('assets/avatars/avatar-1.png');
    final imageBytes = img.buffer.asUint8List();

    ByteData svgdata = await rootBundle.load('assets/svg_other/shield.svg');
    String svgData = utf8.decode(svgdata.buffer.asUint8List());

    final response = await http.get(Uri.parse(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1199px-Cat03.jpg'));
    final Uint8List imageData = response.bodyBytes;

    //Building the pdf
    pdf.addPage(MultiPage(
        build: (context) => [
              Center(child: InvoiceComponents.InvoiceBarcode(Invoice)),
              InvoiceComponents.pdfTitle(Invoice),
              InvoiceComponents.InvoiceItemsTable(Invoice),
              Divider(),
              InvoiceComponents.InvoiceTotal(Invoice),
              InvoiceComponents.InvoiceImage(imageBytes),
              Center(child: InvoiceComponents.InvoiceSVG(svgData)),
              InvoiceComponents.InvoiceImage(imageData),
            ],
        footer: (context) => InvoiceComponents.InvoiceFooter()));

    //Another page with table that have images
    final response2 = await http.get(Uri.parse(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1199px-Cat03.jpg'));
    final Uint8List imageData2 = response2.bodyBytes;

    List<Uint8List> imagedata = [
      imageData2,
      imageData2,
      imageData2,
      imageData2,
      imageData2
    ];
    pdf.addPage(MultiPage(
        build: (context) => [
              for (var i = 0; i < imagedata.length; i++)
                Table(
                  border: TableBorder.all(
                    color: PdfColors.black,
                    style: BorderStyle.solid,
                    width: 0.5,
                  ),
                  children: [
                    TableRow(children: [
                      Image(
                        height: 50,
                        width: 50,
                        MemoryImage(imagedata[i]),
                      ),
                      Text("Name",
                          textAlign: TextAlign.center, textScaleFactor: 2),
                      Text("Something", textAlign: TextAlign.center),
                    ]),
                  ],
                ),
            ]));

    return PdfHelper.saveDocument(name: "invoice.pdf", pdf: pdf);
  }
}
