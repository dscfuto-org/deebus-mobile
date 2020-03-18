import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/User/dashboard.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OTPScreen extends StatefulWidget {
  final String tranType;

  OTPScreen(this.tranType);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController controller = TextEditingController();

  int pinLength = 6;

  bool hasError = false;
  bool isLoading = false;

  String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: AppColors.color4,
        body: Padding(
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
                              if(text.length!=6){
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isLoading
                              ? CircularProgressIndicator(
                            backgroundColor: AppColors.color2,
                            valueColor: new AlwaysStoppedAnimation(AppColors.color1),
                          )
                              :
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                    ),
                                    height: 50,
                                    onPressed: this.map,
//                              async{
//                                if(controller.text.length!=6){
//                                  setState(() {
//                                    hasError = true;
//                                  });
//                                } else if(equalsIgnoreCase(widget.tranType, "Withdrawal")){
//                                  submitWithdrawal();
//                                }
//                              },
                                    color: AppColors.color4,
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                            "E-mail has been sent to your mail. Enter code from e-mail",
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
                                child: Text( "Call me",
                                  style: textStyleBigLightB, )),
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
    );
  }
  void map() {
    // Do what you want
    navigatePush(context, Dashboard());
  }
}
