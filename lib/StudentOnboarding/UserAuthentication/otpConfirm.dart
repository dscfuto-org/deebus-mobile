import 'package:deebus/BackEnd/OTPBackend.dart';
import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/AppColors.dart' as prefix0;
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OTPScreen extends StatefulWidget {
  final String email;

  OTPScreen(this.email);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController controller = TextEditingController();

  int pinLength = 4;
  bool hasError = false;
  bool isLoadingOTP = false;
  String errorMessage;
  String otp;


  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: new AppBar(
        title: Text("Confirm Email"),
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.color4,
            size: 35.0,
          ),
          onPressed: () => navigateBack(context),
        ),
      ),
//        backgroundColor: AppColors.color4,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(13.4),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Enter Code",
                              style: textStyleBigBold,
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child:
                              PinCodeTextField(
                                pinBoxHeight: 50,
                                pinBoxWidth: 50,
                                autofocus: false,
                                controller: controller,
                                hideCharacter: true,
                                highlight: true,
                                highlightColor: AppColors.color4,
                                pinBoxRadius: 10,
                                pinBoxColor: Colors.white,
                                defaultBorderColor: AppColors.color4,
                                hasTextBorderColor: Colors.green,
                                maxLength: pinLength,
                                hasError: hasError,
                                maskCharacter: "*",

                                onTextChanged: (text) {
                                  setState(() {
                                    hasError = false;
                                  });
                                },
                                onDone: (text){
                                  otp=text;
                                  if(text.length!=4){
                                    setState(() {
                                      hasError = true;
                                    });
                                  }

                                },
//pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                                wrapAlignment: WrapAlignment.center,
                                pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                                pinTextStyle: TextStyle(fontSize: 30.0),
                                pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                              ),
                            ),
                            Visibility(
                              child: Text(
                                "Wrong PIN!",
                                style: TextStyle(color: Colors.red),
                              ),
                              visible: hasError,
                            ),
                            Center(
                              child: isLoadingOTP
                                  ?
                              CircularProgressIndicator(
                                backgroundColor: AppColors.color1,
                                valueColor: new AlwaysStoppedAnimation(prefix0.AppColors.color4),
                              )

                                  :
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                ),
                                height: 50,
                                minWidth: deviceW,
                                onPressed: () => {
                                  verifyOTP()
                                },
                                color: AppColors.color4,
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "OTP has been sent to your mailbox.",
                              style: textStyleBigLight,
                            ),
                            Text(
                              "Enter code from e-mail",
                              style: textStyleBigLight,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Didn't get the code?",
                              style: textStyleBigLight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FlatButton(onPressed: null,
                                    child: Text( "Resend", style: textStyleBigLightB,))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }


  verifyOTP() async {
    if(otp.length ==4){
      await OTPBackend().otpVerify(context, widget.email, otp);
    }
  }
}
