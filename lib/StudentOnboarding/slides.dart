import 'package:deebus/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  @override
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
        title: "Connect a ride",
        description: "Check updates of rides around your standpoint to connect a ride ",
        pathImage: "images/photo_eraser.png",
        backgroundColor: AppColors.color1,
      ),
    );
    slides.add(
      new Slide(
        title: "PENCIL",
        description: "Input a complete detail of your journey and get to join the ride",
        pathImage: "images/photo_pencil.png",
        backgroundColor: AppColors.color1,
      ),
    );
    slides.add(
      new Slide(
        title: "RULER",
        description:"Your ride meets you at the pick up point of choice",
        pathImage: "images/photo_ruler.png",
        backgroundColor: AppColors.color1,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}