import 'package:deebus/Constants/AppColors.dart' as prefix0;
import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                  Image.asset(deebusLogoBlue, height: 100, width: 100,),
                ],
              ),
              Text("Get Started", style: textStyleBigBold,),
              Text("Sign up with DeeBus", style: textStyleBigLight,),
              SizedBox(height: 20.0),
              TextField(
                decoration: new InputDecoration(
                  border:  new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: new BorderSide(
                      color: prefix0.AppColors.color4
                    )
                  ),
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                            color: prefix0.AppColors.color4
                        )
                    ),
                    hintText: 'Tell us about yourself',
              ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: new InputDecoration(
                  border:  new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                          color: prefix0.AppColors.color4
                      )
                  ),
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                          color: prefix0.AppColors.color4
                      )
                  ),
                  hintText: 'Tell us about yourself',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: new InputDecoration(
                  border:  new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                          color: prefix0.AppColors.color4
                      )
                  ),
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: new BorderSide(
                          color: prefix0.AppColors.color4
                      )
                  ),
                  hintText: 'Tell us about yourself',
                ),
              ),
              SizedBox(height: 10.0),
              FlatButton(
                shape: new RoundedRectangleBorder(
                ),
                  onPressed: null,
                color: prefix0.AppColors.color4,
                textColor: Colors.white,
                child: Text("Continue", style: textStyleBigLight,),
              )

            ],
          ),
        ),
      ),
    );
  }
}
