// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Cust_ListView extends StatelessWidget {
  final Function() onTap;
  final String custtext;
  const Cust_ListView({super.key, required this.custtext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: const ListTile(
        title: Text("Jibin"),
        subtitle: Text("btechtraders18@gmail.com"),
        leading: Icon(
          Icons.person,
          size: 40,
        ),
      ),
    );
  }
}
