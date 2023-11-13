// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertemplate/Colors/colors.dart';

class Cust_Form_field extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function()? validator;
  final Function()? onSaved;
  final String cus_label;
  final String hintText;

  const Cust_Form_field(
      {super.key,
      required this.cus_label,
      this.controller,
      this.validator,
      this.onSaved,
      this.keyboardType,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      // margin: EdgeInsets.fromLTRB(4, 12, 16, 0),
      height: 48,
      decoration: ShapeDecoration(
        color: const Color(0x331BD592),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: TextFormField(
          maxLines: 1,
          // autofillHints: [AutofillHints.birthday],
          style: const TextStyle(
              fontFamily: "Kanit",
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.darkGreen),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            hintText: hintText,
            labelStyle: TextStyle(
                fontFamily: "Kanit",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: const Color(0xFF0c0c0c).withOpacity(0.4)),
            labelText: cus_label,
            // prefixIcon: Icon(Icons.email),
          ),
          keyboardType: keyboardType,
          controller: controller,
          onSaved: (value) {
            // addprofiledetailContoller.addressController.text = value!;
          },
          validator: (value) {
            return "true";
            // return addprofiledetailContoller.validateName(value!);
          },
        ),
      ),
    );
  }
}
