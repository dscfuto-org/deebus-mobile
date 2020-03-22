import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/StudentOnboarding/splashScreen.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';

class NoNetwork extends StatefulWidget {
  @override
  _NoNetworkState createState() => _NoNetworkState();
}

class _NoNetworkState extends State<NoNetwork> {

  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
        body:  Stack(
              children: <Widget>[

                Center(child:  Text("Oops No Internet Connection",
                      style: textStyleBigLight,
                      textAlign: TextAlign.center,)),

           Positioned(
             bottom: 20,
             left: 20,
             right: 20,
             child: MaterialButton(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(40.0)),
                         ),
                          minWidth: deviceW,
                         height: 50,
                         onPressed: ()=> navigatePush(context, SplashScreen()),
                         color: AppColors.color4,
                         child: Text(
                           "Try Again",
                           style: TextStyle(
                               color: Colors.white, fontSize: 16.0),
                         ),
                       ),
           ),


              ],
            ),

    );
  }
}
