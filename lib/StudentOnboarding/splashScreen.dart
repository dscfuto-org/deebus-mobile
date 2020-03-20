import 'package:deebus/StudentOnboarding/slides.dart';
import 'package:deebus/User/dashboard.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';

import '../Constants/AppColors.dart';
import '../Constants/AssetsStrings.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//  static Animation<double> animation;
//  Animation<double> animationTurns = Tween<double>(begin: 0, end: 0.5).animate(animation);
  @override
  void initState() {

    splashTime().then((onValue) => navigateReplace(context, IntroScreen()));
    DashboardState().getCurrentLocation();
    super.initState();


  }


  Future splashTime() async{
    await Future.delayed(Duration(seconds: 5));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColors.color4,
        body: Padding(
          padding: EdgeInsets.all(13.4),
          child: Stack(
            children: <Widget>[
              Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    // change image to that of deebus
                    Image.asset(deebusLogoWhite, height: 120, width: 120,),
                  ],

                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.color1,
                      valueColor: new AlwaysStoppedAnimation(Colors.grey),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
