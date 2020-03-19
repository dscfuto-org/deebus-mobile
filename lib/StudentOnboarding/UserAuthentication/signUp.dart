import 'package:deebus/BackEnd/SignUpBackEnd.dart';
import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/AssetsStrings.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/login.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formKey = new GlobalKey();
  String firstName;
  String secondName;
  String email;
  String password;

  bool isLoading = false;

  OutlineInputBorder focusedBorder() {
    OutlineInputBorder outlineInputBorder = new OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: new BorderSide(color: AppColors.color4));
    return outlineInputBorder;
  }

  submitRegistration() async{
    if(!formKey.currentState.validate()){

    }else{
      formKey.currentState.save();
      setState(() {
        isLoading= true;
      });

      await RegisterBackend().signUpFetch(context, firstName, secondName, email, password);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Form(
            key: formKey,
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
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty)
                      return "Field required";
                  },

                  onSaved: (value){
                    firstName =value;
                  },
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
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty)
                      return "Field required";
                  },

                  onSaved: (value){
                    secondName =value;
                  },
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
                    hintText: 'Last Name',
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  // ignore: missing_return
                  validator: (value){
                    if(!value.contains("@"))
                      return "Invalid Email";
                  },

                  onSaved: (value){
                    email =value;
                  },
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
                  // ignore: missing_return
                  validator: (value){
                    if(value.isEmpty)
                      return "Field required";
                  },

                  onSaved: (value){
                    password =value;
                  },
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
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 25.0),
                Center(
                  child: isLoading
                  ?
                  CircularProgressIndicator(
                      backgroundColor: AppColors.color1,
                      valueColor: new AlwaysStoppedAnimation(Colors.grey),
                    )

                  :
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    height: 50,
                    minWidth: deviceW,
                    onPressed: () => {
                      submitRegistration()
                     // navigatePush(context, OTPScreen("hhsh"))
                    },
//
                    color: AppColors.color4,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white, fontSize: 16.0),
                    ),
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
      ),
    );
  }
}
