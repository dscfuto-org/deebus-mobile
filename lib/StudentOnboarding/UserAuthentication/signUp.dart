import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/login.dart';
//import 'package:deebus/StudentOnboarding/UserAuthentication/login.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/otpConfirm.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  OutlineInputBorder focusedBorder() {
    OutlineInputBorder outlineInputBorder = new OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: new BorderSide(color: AppColors.color4));
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
                "Get Started",
                style: textStyleBigBold,
              ),
              Text(
                "Sign up with DeeBus",
                style: textStyleBigLight,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(color: AppColors.color4)),
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(color: AppColors.color4)),
                  focusedBorder: focusedBorder(),
                  hintText: 'Full Name',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(color: AppColors.color4)),
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(color: AppColors.color4)),
                  focusedBorder: focusedBorder(),
                  hintText: 'Email Address',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(color:AppColors.color4)),
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          new BorderSide(color: AppColors.color4)),
                  focusedBorder: focusedBorder(),
                  hintText: 'Phone number',
                ),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                padding: EdgeInsets.all(5.0),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(14.0),
                ),
                onPressed: () => {
                navigatePush(context, OTPScreen("hhsh"))
                },
                color: AppColors.color4,
                textColor: Colors.white,
                child: Text(
                  "Continue",
                  style: textStyleBigLight,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w300),
                  ),
                  FlatButton(
                    child: new Text(
                      "Sign In",
                      style: new TextStyle(
                          color: AppColors.color4,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () => {navigatePush(context, Login())},
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
