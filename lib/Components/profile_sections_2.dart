import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertemplate/Helpers/constants.dart';

class ProfileSections2 extends StatelessWidget {
  final String sectiontext;
  final String svgimageurl;
  final IconData sideicon;
  final Function() onTap;
  const ProfileSections2(
      {super.key,
      required this.sectiontext,
      required this.sideicon,
      required this.svgimageurl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {onTap},
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(svgimageurl),
                const SizedBox(
                  width: 16,
                ),
                Text(sectiontext, style: Constants.buttonTextStyle),
              ],
            ),
            Icon(
              sideicon,
              color: const Color(0xff696969),
            )
          ],
        ),
      ),
    );
  }
}
