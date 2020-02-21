 import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/Login%20Page.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          children: <Widget>[
            Image.asset(deebusLogoBlue,),
            Text("Get on Board", style: textStyleBigBold,),
            Text("Sign up with DeeBus", style: textStyleBigLight,),
//            SizedBox(10.0),

          ],
      ),
    );
  }
}

