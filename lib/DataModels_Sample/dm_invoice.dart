import 'package:fluttertemplate/DataModels/dm_invoice_customer.dart';
import 'package:fluttertemplate/DataModels/dm_invoice_items.dart';
import 'package:fluttertemplate/DataModels/dm_invoice_supplier.dart';

class dm_invoice {
  int? invoiceNum;
  List<dynamic>? invoiceItems;
  dynamic invoiceSupp;
  dynamic invoiceCust;
  String? invoiceDate;
  String? invoiceDuedate;
  String? invoiceDescrp;

  dm_invoice(
      {this.invoiceNum,
      this.invoiceItems,
      this.invoiceSupp,
      this.invoiceCust,
      this.invoiceDate,
      this.invoiceDuedate,
      this.invoiceDescrp});

  dm_invoice.fromJson(Map<String, dynamic> json) {
    invoiceNum = json['invoice_num'];
    invoiceItems = json['invoice_items'];
    invoiceSupp = dm_supplier.fromJson(json['invoice_supp']);
    invoiceCust = dm_customer.fromJson(json['invoice_cust']);
    invoiceDate = json['invoice_date'];
    invoiceDuedate = json['invoice_duedate'];
    invoiceDescrp = json['invoice_descrp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_num'] = this.invoiceNum;
    // data['invoice_items'] = this.invoiceItems;
    // data['invoice_supp'] = this.invoiceSupp;
    // data['invoice_cust'] = this.invoiceCust;
    if (invoiceItems != null) {
      data['invoice_items'] = invoiceItems!.toList();
    }
    if (invoiceSupp != null) {
      data['invoice_supp'] = invoiceSupp!.toJson();
    }
    if (invoiceCust != null) {
      data['invoice_cust'] = invoiceCust!.toJson();
    }
    data['invoice_date'] = this.invoiceDate;
    data['invoice_duedate'] = this.invoiceDuedate;
    data['invoice_descrp'] = this.invoiceDescrp;
    return data;
  }
}

dm_invoice Invoice_sample = dm_invoice(
    invoiceDate: "24/07/2023",
    invoiceNum: 23234,
    invoiceItems: <dm_item>[
      dm_item(
          itemDescrp: "Jaba",
          itemName: "Super",
          itemPrice: 23.55,
          itemQty: 45,
          itemVat: 45.6),
      dm_item(
          itemDescrp: "Jaba",
          itemName: "Super",
          itemPrice: 23.55,
          itemQty: 45,
          itemVat: 45.6),
      dm_item(
          itemDescrp: "Jaba",
          itemName: "Super",
          itemPrice: 23.55,
          itemQty: 45,
          itemVat: 45.6),
      dm_item(
          itemDescrp: "Jaba",
          itemName: "Super",
          itemPrice: 23.55,
          itemQty: 45,
          itemVat: 45.6),
      dm_item(
          itemDescrp: "Jaba",
          itemName: "Super",
          itemPrice: 23.55,
          itemQty: 45,
          itemVat: 45.6),
      dm_item(
          itemDescrp: "Jaba",
          itemName: "Super",
          itemPrice: 23.55,
          itemQty: 45,
          itemVat: 45.6),
    ],
    invoiceCust: dm_customer(
        cusAddress: "Super House, 24th Apartment",
        cusMail: "btech2gmail.com",
        cusMob: "+918383833",
        cusName: "Awsome"),
    invoiceDescrp: "Invoice to the customer",
    invoiceDuedate: "24/07/2024",
    invoiceSupp: dm_supplier(
        suppAddress: "Supplier House, 24th Realestate",
        suppMail: "supp@gmail.com",
        suppMob: "+9178999933",
        suppName: "Supplier Name"));
