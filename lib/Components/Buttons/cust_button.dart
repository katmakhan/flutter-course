import 'package:flutter/material.dart';
import 'package:fluttertemplate/Colors/colors.dart';

class Cust_Button extends StatelessWidget {
  final Function() onTap;
  final String custtext;
  const Cust_Button({super.key, required this.custtext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 58,
        margin: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            custtext,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xffffffff),
              fontSize: 16,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
