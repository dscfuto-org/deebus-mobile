import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/StudentOnboarding/splashScreen.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';

class NoNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text("No Internet Connection"),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            height: 50,
            minWidth: deviceW,
            onPressed: () => {
              navigateReplace(context, SplashScreen())
            },
            color: AppColors.color4,
            child: Text(
              "Continue",
              style: TextStyle(
                  color: Colors.white, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
