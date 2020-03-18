import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/signUp.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:deebus/models/intro-screeen-model.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // To hold the list of IntroScreen Widgets
  List<PageViewModel> _pageViewModelList = List();

  // To hold the list of IntroScreen models
  List<WelcomeScreen> _screens = List();

  PageViewModel _createIntroScreens(WelcomeScreen screen) {
    return PageViewModel(
      title: "", // Don not remove this, else Flutter will squawk!
      bodyWidget: Column(
        children: <Widget>[
          Image.asset(
            screen.image,
            height: screen.imageHeight,
            width: screen.imageWidth,
          ),
          Text(
            screen.title,
            style: textStyleBigBold,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            screen.description,
            style: textStyleBigLight,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _screens.add(WelcomeScreen(
        image: firstVector,
        title: "Connect a Ride",
        description:
            "Check updates of rides around \n your standpoint to connect\n a ride"));
    _screens.add(WelcomeScreen(
        image: secondVector,
        title: "Complete Connect",
        description:
            "Input a complete details of your\njourney and get to join the ride"));
    _screens.add(WelcomeScreen(
        image: thirdVector,
        title: "Get on Board",
        description: "Your ride meets you at the pick up\npoint of choice"));

    // Foreach of the above instances, create an IntroScreen & it to the PageViewModel List
    _screens
        .forEach((elem) => _pageViewModelList.add(_createIntroScreens(elem)));
  }

  void onDonePress() {
    // Do what you want
    navigatePush(context, Signup());
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: _pageViewModelList,
      initialPage: 0,
      showSkipButton: true,
      skip: Text("Skip", style: introBtnsTextStyle),
      showNextButton: true,
      next: Text(
        "Next",
        style: introBtnsTextStyle,
      ),
      done: Text(
        "Done",
        style: introBtnsTextStyle,
      ),
      dotsFlex: 2,
      globalBackgroundColor: AppColors.color1,
      onDone: () => this.onDonePress(),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).accentColor,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
