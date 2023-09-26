import 'package:flutter/material.dart';
import 'package:fluttertemplate/Helpers/constants.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  // Dialog that can also pop when sucess
  // Dialog with 2 Buttons
  static void showCustomDialog(
      BuildContext context,
      String title,
      String description,
      String okBtnText,
      String cancelBtnText,
      Function okBtnFunction,
      bool pop) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(description),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () => {
                          okBtnFunction.call(),
                          if (pop) {Navigator.pop(context)}
                        },
                    child: Text(okBtnText)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
                child: InkWell(
                    onTap: () => {Navigator.pop(context)},
                    child: Text(cancelBtnText)),
              )
            ],
          );
        });
  }

  // Dialog with 3 Buttons
  static void showCustomDialog_3Buttons(
      BuildContext context,
      String title,
      String description,
      String btn1txt,
      String btn2txt,
      String btn3txt,
      Function btn1Function,
      Function btn2Function,
      Function btn3Function) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(description),
            actions: <Widget>[
              InkWell(
                  onTap: () => {btn1Function.call()},
                  child: Constants.alertButtonContainer(btn1txt)),
              InkWell(
                onTap: () => {btn2Function.call()},
                child: Constants.alertButtonContainer(btn2txt),
              ),
              InkWell(
                onTap: () => {btn3Function.call()},
                child: Constants.alertButtonContainer(btn3txt),
              )
            ],
          );
        });
  }

  void showCustomDialogAnimated(
      BuildContext context,
      String title,
      String descrip,
      String okBtnText,
      String cancelBtnText,
      Function okBtnFunction,
      Function cancelBtnFunction) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 180,
            width: 400,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SizedBox.expand(
                child: dialogContent(title, descrip, okBtnText, context,
                    cancelBtnText, okBtnFunction, cancelBtnFunction, false)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  // Dialog for update
  void showCustomDialogUpdate(
      BuildContext context,
      String title,
      String descrip,
      String okBtnText,
      String cancelBtnText,
      Function okBtnFunction,
      Function cancelBtnFunction,
      bool compulsory) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: compulsory,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(compulsory);
          },
          child: Center(
            child: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              // child: UpdateRequiredBox(),
              child: SizedBox.expand(
                  child: dialogContent(
                      title,
                      descrip,
                      okBtnText,
                      context,
                      cancelBtnText,
                      okBtnFunction,
                      cancelBtnFunction,
                      compulsory)),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  static Container dialogContent(
      String title,
      String description,
      String okBtnText,
      BuildContext context,
      String cancelBtnText,
      Function acceptFunction,
      Function declineFunction,
      bool compulsory) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16),
            child: Text(title,
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    color: Color(0xFF363e44),
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 16),
            child: Text(description,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    color: const Color(0xFF45413C).withOpacity(0.8),
                    fontWeight: FontWeight.w400)),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: !compulsory,
                  child: GestureDetector(
                    onTap: () => {declineFunction.call()},
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: Text(
                        cancelBtnText,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            color: Color(0xFFE61E26),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {acceptFunction.call()},
                  child: Container(
                    height: 28,
                    width: 86,
                    decoration: const BoxDecoration(
                      color: Color(0xff9E00FF),
                    ),
                    child: Center(
                      child: Text(
                        okBtnText,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
