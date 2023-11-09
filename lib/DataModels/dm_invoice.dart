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
