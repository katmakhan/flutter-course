// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:flutter_svg/svg.dart';
import 'package:fluttertemplate/DataModels_Sample/dm_invoice.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class InvoiceComponents {
  static Widget pdfTitle(dm_invoice invoice) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("INVOICE", style: const TextStyle(fontSize: 24)),
      SizedBox(height: 20),
      Text(invoice.invoiceDescrp.toString()),
      SizedBox(height: 5),
    ]);
  }

  // Table of the contents of items
  static Widget InvoiceItemsTable(dm_invoice invoice) {
    final headers = ['Item Name', 'Price', 'Qty', 'Total'];
    var tabledata = <List<dynamic>>[]; //Checking null
    if (invoice.invoiceItems != null) {
      tabledata = invoice.invoiceItems!.map((item) {
        // final ItemObj = dm_item.fromJson(item);
        final ItemObj = item;
        final total = ItemObj.itemQty! * ItemObj.itemPrice!;
        return [
          '${ItemObj.itemName}',
          '\$ ${ItemObj.itemPrice}',
          '${ItemObj.itemQty}',
          '\$ $total'
        ];
      }).toList();
    }

    return TableHelper.fromTextArray(
        border: null,
        data: tabledata,
        headers: headers,
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.centerLeft,
          1: Alignment.centerRight,
          2: Alignment.center,
          3: Alignment.centerRight
        },
        headerStyle: TextStyle(fontWeight: FontWeight.bold),
        headerDecoration: BoxDecoration(color: PdfColor.fromHex("#808080")));
  }

  // To show Invoice Total and Tax
  static Widget InvoiceTotal(dm_invoice invoice) {
    return Container(
        alignment: Alignment.centerRight,
        child: Row(children: [
          Spacer(flex: 6),
          Expanded(
              flex: 4,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(child: Text("Total")),
                      Text("223.4")
                    ]),
                    Row(children: [Expanded(child: Text("Tax")), Text("23.4")]),
                    Divider(),
                    Container(height: 3, color: PdfColor.fromHex("#808080"))
                  ]))
        ]));
  }

  // TO show Barcode
  static Widget InvoiceBarcode(dm_invoice invoice) {
    return Container(
        height: 50,
        width: 50,
        child: BarcodeWidget(
            barcode: Barcode.qrCode(), data: invoice.invoiceNum.toString()));
  }

  // TO show Footer
  static Widget InvoiceFooter() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Divider(), Text("Powered By BtechTraders")]);
  }

  //To show Image
  static Widget InvoiceImage(Uint8List imagebytes) {
    return Image(MemoryImage(imagebytes));
  }

  //To show SVG
  static Widget InvoiceSVG(String svglocation) {
    return SvgImage(svg: svglocation);
  }
}
