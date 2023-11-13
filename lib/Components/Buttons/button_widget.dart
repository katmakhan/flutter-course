import 'package:flutter/material.dart';
import 'package:fluttertemplate/Helpers/constants.dart';

class Cust_Button_2 extends StatelessWidget {
  const Cust_Button_2({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: size.height / 12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: const Color(0xFF21899C),
            ),
          ),
          child: Text(text,
              textAlign: TextAlign.center, style: Constants.buttonTextStyle),
        ),
      ),
    );
  }
}
