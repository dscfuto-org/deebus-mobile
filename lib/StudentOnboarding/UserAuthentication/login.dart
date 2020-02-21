import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30.0),
            Image.asset(deebusLogoBlue, height: 100, width: 100,),
            Text("Get on Board", style: textStyleBigBold,),
            Text("Sign up with DeeBus", style: textStyleBigLight,),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Username"
              ),
            )

          ],
        ),
      ),
    );
  }
}