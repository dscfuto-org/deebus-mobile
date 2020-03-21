import 'package:connectivity/connectivity.dart';
import 'package:deebus/Data/DummyData.dart';
import 'package:deebus/StudentOnboarding/noNetwork.dart';
import 'package:deebus/StudentOnboarding/slides.dart';
import 'package:deebus/User/dashboard.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/AppColors.dart';
import '../Constants/AssetsStrings.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences sharedPreferences;
//  static Animation<double> animation;
//  Animation<double> animationTurns = Tween<double>(begin: 0, end: 0.5).animate(animation);
  @override
  void initState() {
    checkNetwork();
    DashboardState().getCurrentLocation();
    super.initState();
  }

  checkUser()async{
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.email = sharedPreferences.getString("email");
  }
  checkNetwork()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      splashTime().then((onValue) => navigateReplace(context, IntroScreen()));
    } else if (connectivityResult == ConnectivityResult.wifi) {
      splashTime().then((onValue) => navigateReplace(context, IntroScreen()));
    } else navigatePush(context, NoNetwork());
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
