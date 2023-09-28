// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cust_ListView_Slidable extends StatelessWidget {
  final Function() onTap;
  final String custtext;
  const Cust_ListView_Slidable(
      {super.key, required this.custtext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          icon: Icons.phone,
          backgroundColor: Colors.green,
          onPressed: (BuildContext context) {
            print("Pressed");
          },
        ),
        SlidableAction(
          icon: Icons.chat,
          backgroundColor: Colors.blue,
          onPressed: (BuildContext context) {
            print("Pressed");
          },
        )
      ]),
      child: Container(
        color: Colors.grey[100],
        child: const ListTile(
          title: Text("Jibin"),
          subtitle: Text("btechtraders18@gmail.com"),
          leading: Icon(
            Icons.person,
            size: 40,
          ),
        ),
      ),
    );
  }
}
