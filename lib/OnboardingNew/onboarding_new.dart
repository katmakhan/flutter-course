import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/Colors/colors.dart';
import 'package:fluttertemplate/Components/components.dart';
import 'package:fluttertemplate/DataModels_Sample/items_model.dart';
import 'package:fluttertemplate/Helpers/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNew extends StatefulWidget {
  const OnBoardingNew({Key? key}) : super(key: key);

  @override
  State<OnBoardingNew> createState() => _OnBoardingNewState();
}

class _OnBoardingNewState extends State<OnBoardingNew> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Anime
  Widget animationDo(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: pageController,
              itemCount: listOfItems_sample.length,
              onPageChanged: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: [
                      /// IMG
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                        width: size.width,
                        height: size.height / 2.5,
                        child: animationDo(
                          index,
                          100,
                          Image.asset(listOfItems_sample[index].img),
                        ),
                      ),

                      /// TITLE TEXT
                      Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: animationDo(
                            index,
                            300,
                            Text(
                              listOfItems_sample[index].title,
                              textAlign: TextAlign.center,
                              style: Constants.headingTextStyle,
                            ),
                          )),

                      /// SUBTITLE TEXT
                      animationDo(
                        index,
                        500,
                        Text(
                          listOfItems_sample[index].subTitle,
                          textAlign: TextAlign.center,
                          style: Constants.headingTextStyle,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          /// ---------------------------
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// PAGE INDICATOR
                SmoothPageIndicator(
                  controller: pageController,
                  count: listOfItems_sample.length,
                  effect: const ExpandingDotsEffect(
                    spacing: 6.0,
                    radius: 10.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    expansionFactor: 3.8,
                    dotColor: Colors.grey,
                    activeDotColor: AppColors.btnColor,
                  ),
                  onDotClicked: (newIndex) {
                    setState(() {
                      currentIndex = newIndex;
                      pageController.animateToPage(newIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    });
                  },
                ),
                currentIndex == 2

                    /// GET STARTED BTN
                    ? GetStartBtn(size: size, textTheme: textTheme)

                    /// SKIP BTN
                    : SkipBtn(
                        size: size,
                        textTheme: textTheme,
                        onTap: () {
                          setState(() {
                            pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastOutSlowIn);
                          });
                        },
                      )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
