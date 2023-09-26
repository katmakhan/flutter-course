import 'package:flutter/material.dart';

class SingleReferal extends StatelessWidget {
  final String linkurl;
  const SingleReferal(this.linkurl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: 140,
        width: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(linkurl), fit: BoxFit.cover)),
      ),
    );
  }
}
