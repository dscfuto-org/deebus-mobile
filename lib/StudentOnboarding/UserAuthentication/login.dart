import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/signUp.dart';
import 'package:deebus/Constants/AppColors.dart' as prefix0;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  OutlineInputBorder focusedBorder() {
    OutlineInputBorder outlineInputBorder = new OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: new BorderSide(color: prefix0.AppColors.color4));
    return outlineInputBorder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    deebusLogoBlue,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              Text(
                "Sign In",
                style: textStyleBigBold,
              ),
              Text(
                "Continue with DeeBus",
                style: textStyleBigLight,
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      new BorderSide(color: prefix0.AppColors.color4)),
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      new BorderSide(color: prefix0.AppColors.color4)),
                  focusedBorder: focusedBorder(),
                  hintText: 'Email Address',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      new BorderSide(color: prefix0.AppColors.color4)),
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      new BorderSide(color: prefix0.AppColors.color4)),
                  focusedBorder: focusedBorder(),
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                padding: EdgeInsets.all(5.0),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(14.0),
                ),
                onPressed: () => {navigatePush(context, widget)},
                color: prefix0.AppColors.color4,
                textColor: Colors.white,
                child: Text(
                  "Sign in",
                  style: textStyleBigLight,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "New to DeeBus?",
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w300),
                  ),
                  FlatButton(
                    child: new Text(
                      "Sign Up",
                      style: new TextStyle(
                          color: prefix0.AppColors.color4,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () => {navigateReplace(context, Signup())},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}