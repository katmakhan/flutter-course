import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        // ignore: deprecated_member_use
        launch("tel://+91123456789"),
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        padding: const EdgeInsets.all(12),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffeff9ff),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 56,
              width: 56,
              child: SvgPicture.asset("assets/svg/shield.svg"),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Customer Support",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: Text(
                      "Give a call to enquire about templates, flutter courses and all your doubts",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black.withOpacity(0.6)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
