import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:fluttertemplate/DataModels_Sample/dm_invoice.dart';
import 'package:fluttertemplate/PDFInvoice/pdfComponents.dart';
import 'package:fluttertemplate/PDFInvoice/pdfsaver.dart';
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

    return PdfHelper.saveDocument(name: "invoice.pdf", pdf: pdf);
  }
}
