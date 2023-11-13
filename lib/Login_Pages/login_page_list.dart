// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertemplate/AddActivities/add_act_user_doc.dart';
import 'package:fluttertemplate/AddActivities/add_act_user_image.dart';
import 'package:fluttertemplate/Components/SingleItems/list_view.dart';
import 'package:fluttertemplate/DataModels_Sample/dm_invoice.dart';
import 'package:fluttertemplate/Dropdown/single_dropdown.dart';
import 'package:fluttertemplate/GoogleMaps/OrderTracking.dart';
import 'package:fluttertemplate/Login_Pages/sign_in_1.dart';
import 'package:fluttertemplate/Login_Pages/sign_in_2.dart';
import 'package:fluttertemplate/PDFInvoice/pdfinvoice.dart';
import 'package:fluttertemplate/PDFInvoice/pdfsaver.dart';

class login_listView extends StatefulWidget {
  const login_listView({super.key});

  @override
  State<login_listView> createState() => _login_listViewState();
}

class _login_listViewState extends State<login_listView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Cust_ListView(
              custtext: "LoginPage", custsubtext: "Basic Login", onTap: onTap),
          Cust_ListView(
              custtext: "LoginPage2",
              custsubtext: "Basic Login 2",
              onTap: onTap2),
          Cust_ListView(
              custtext: "Dropdown",
              custsubtext: "Drop down functionality",
              onTap: onTap3),
          Cust_ListView(
              custtext: "UploadImages",
              custsubtext: "Adding user profile",
              onTap: onTap4),
          Cust_ListView(
              custtext: "UploadDocuments",
              custsubtext: "Adding user documents",
              onTap: onTap5),
          Cust_ListView(
              custtext: "Invoice",
              custsubtext: "Generating Invoices",
              onTap: onTap6),
          Cust_ListView(
              custtext: "Google Maps",
              custsubtext: "Tracking orders",
              onTap: onTap7)
        ]),
      ),
    );
  }

  onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInOne()),
    );
  }

  onTap2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInTwo()),
    );
  }

  onTap3() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SingleDropdown()),
    );
  }

  onTap4() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ActAddUserImage(false, null)),
    );
  }

  onTap5() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ActAddUserDocuments(false, null)),
    );
  }

  onTap6() async {
    dm_invoice Invoice = dm_invoice();

    final pdffile = await InvoiceHelper.generatePDF(Invoice);

    PdfHelper.openPdf(pdffile);
  }

  onTap7() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const orderTrackingMaps()),
    // );
  }
}
