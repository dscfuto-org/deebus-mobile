import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/login.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
//  @override
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        centerWidget: Column(
          children: <Widget>[
            Image.asset(firstVector, height: 300, width: 300,),
            Text("Connect a Ride", style: textStyleBigBold,),
            SizedBox(height: 20.0,),
            Text(
              "Check updates of rides around \n your standpoint to connect\n a ride",
              style: textStyleBigLight, textAlign: TextAlign.center,)
          ],
        ),
          backgroundColor: AppColors.color1
      ),
    );
    slides.add(
      new Slide(
        centerWidget: Column(
          children: <Widget>[
            Image.asset(secondVector, height: 300, width: 300,),
            Text("Complete Connect", style: textStyleBigBold,),
            SizedBox(height: 20.0,),
            Text(
              "Input a complete details of your\njourney and get to join the ride",
              style: textStyleBigLight, textAlign: TextAlign.center)
          ],
        ),
          backgroundColor: AppColors.color1
      ),
    );
    slides.add(
      new Slide(
        centerWidget: Column(
          children: <Widget>[
            Image.asset(thirdVector, height: 300, width: 300,),
            Text("Get on Board", style: textStyleBigBold,),
            SizedBox(height: 20.0,),
            Text("Your ride meets you at the pick up\npoint of choice",
              style: textStyleBigLight, textAlign: TextAlign.center)
          ],
        ),
      backgroundColor: AppColors.color1
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    navigateReplace(context, Login());
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      colorActiveDot: AppColors.color4,
      onDonePress: this.onDonePress,
      backgroundColorAllSlides: AppColors.color1,
      sizeDot: 10.0,
      nameDoneBtn: "Got it",
      styleNameDoneBtn: TextStyle(
        color: AppColors.color4,
        fontSize: 15.0,
          fontWeight: FontWeight.bold
      ),
      nameNextBtn: "Next",
      nameSkipBtn: "Skip",
      onSkipPress: this.onDonePress,
      styleNameSkipBtn: TextStyle(
        color: AppColors.color4,
        fontSize: 15.0,
        fontWeight: FontWeight.bold
      ),
      isShowSkipBtn: true,


    );
  }
}