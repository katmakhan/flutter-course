// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cust_ListView_Slidable_Stock extends StatelessWidget {
  final Function() onTap;
  final String stocknameval;
  final double? ltpval;
  final double? prevval;
  const Cust_ListView_Slidable_Stock(
      {super.key,
      required this.stocknameval,
      required this.ltpval,
      required this.prevval,
      required this.onTap});

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
        // color: Colors.grey[100],
        color: (prevval ?? 0.0) > (ltpval ?? 0.0)
            ? Colors.red
            : (prevval ?? 0.0) < (ltpval ?? 0.0)
                ? Colors.green
                : null,
        child: ListTile(
          title: Text(stocknameval.toString()),
          subtitle: Text("$ltpval $prevval"),
          leading: const Icon(
            Icons.person,
            size: 40,
          ),
        ),
      ),
    );
  }
}
