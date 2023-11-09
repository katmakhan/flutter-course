import 'dart:io';
import 'package:fluttertemplate/DataModels/dm_invoice.dart';
import 'package:fluttertemplate/PDFInvoice/pdfsaver.dart';
import 'package:pdf/widgets.dart';

class InvoiceHelper {
  static Future<File> generatePDF(dm_invoice Invoice) {
    final pdf = Document();

    //Building the pdf
    pdf.addPage(MultiPage(build: (context) => [pdfTitle(Invoice)]));

    return PdfHelper.saveDocument(name: "invoice.pdf", pdf: pdf);
  }

  static Widget pdfTitle(dm_invoice invoice) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("invoice"),
      SizedBox(height: 0.8),
      Text(invoice.invoiceDescrp.toString())
    ]);
  }
}
