import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/login.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';

class EmailConfirm extends StatefulWidget {
  @override
  _EmailConfirmState createState() => _EmailConfirmState();
}

class _EmailConfirmState extends State<EmailConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  const EdgeInsets.all(30.0),
        child: Stack(
          children: <Widget>[
            Center(

              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // change image to that of deebus
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: CircularProgressIndicator(
                          backgroundColor: AppColors.color1,
                          valueColor: new AlwaysStoppedAnimation(AppColors.color4),
                        ),
                      ),
                      SizedBox(height: 20,),
                      RaisedButton(
                        padding: EdgeInsets.all(5.0),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(14.0),
                        ),
                        onPressed: () => {navigatePush(context, Login())},
                        color: AppColors.color4,
                        textColor: Colors.white,
                        child: Text(
                          "Sign in",
                          style: textStyleBigLight,
                        ),
                      )
                    ],
                  )
                ],

              ),
            ),
//            Column(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Center(
//                  child: CircularProgressIndicator(
//                    backgroundColor: AppColors.color1,
//                    valueColor: new AlwaysStoppedAnimation(Colors.grey),
//                  ),
//                ),
//              ],
//            )
          ],
        ),
      ),

    );
  }
}
