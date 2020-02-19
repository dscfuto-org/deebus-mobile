
import 'package:deebus/Constants/Strings.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:deebus/login.dart';
import 'package:flutter/material.dart';

import 'Constants/AppColors.dart';
import 'Constants/AssetsStrings.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//  static Animation<double> animation;
//  Animation<double> animationTurns = Tween<double>(begin: 0, end: 0.5).animate(animation);
  @override
  void initState() {
    splashTime().then((onValue) => navigateReplace(context, Login()));
    super.initState();
  }

  Future splashTime() async{
    await Future.delayed(Duration(seconds: 5));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.color1,
        body: Center(

          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(callkitlogo, height: 120, width: 120,),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text(appName, style: textStyleBigBold,)),
              ),

            ],

          ),
        )

    );
  }
}

