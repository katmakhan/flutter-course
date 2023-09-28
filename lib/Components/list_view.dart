// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Cust_ListView extends StatelessWidget {
  final Function() onTap;
  final String custtext;
  final String custsubtext;
  const Cust_ListView(
      {super.key,
      required this.custtext,
      required this.custsubtext,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.grey[100],
        child: ListTile(
          title: Text(custtext),
          subtitle: Text(custsubtext),
          leading: const Icon(
            Icons.person,
            size: 40,
          ),
        ),
      ),
    );
  }
}
