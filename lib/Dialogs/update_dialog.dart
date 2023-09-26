import 'package:flutter/material.dart';

Container updateRequired(BuildContext context, String heading,
    String description, String iosLink, String androidLink) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Update Required",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              color: const Color(0xff343c47).withOpacity(0.6),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "You need to update the app to the latest version to use all the functionalities",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: const Color(0xff1c1c1c).withOpacity(0.3),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Cancel",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: const Color(0xff1c1c1c).withOpacity(0.3),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.green),
              padding: const EdgeInsets.all(4),
              child: const Text("Update"),
            )
          ],
        )
      ],
    ),
  );
}
