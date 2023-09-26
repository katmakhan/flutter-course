import 'package:flutter/material.dart';
import 'package:fluttertemplate/Helpers/constants.dart';

class IntroPage extends StatefulWidget {
  final String imageloc;
  final String heading;
  const IntroPage({Key? key, required this.heading, required this.imageloc})
      : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.imageloc), fit: BoxFit.cover)),
      child: Container(
          alignment: const Alignment(-0.7, 0.25),
          margin: const EdgeInsets.only(left: 0, right: 24),
          child: Text(
            widget.heading,
            style: Constants.introHeadingTextStyle,
          )),
    );
  }
}
