import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/profile_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _contentPadding = EdgeInsets.symmetric(
    horizontal: 24.0,
    vertical: 2.0,
  );

  final _textStyle = TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: "Ubuntu");

  String _firstName,
      _lastName,
      _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(color: AppColors.color4),
        ),
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
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            color: Colors.white10,
            child: Text(
              "LOG OUT",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.0),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 23.7,
                      ),
                      Text(
                        "CONNECT TO FACEBOOK",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.5,
                            fontFamily: 'Ubuntu'),
                      )
                    ],
                  ),
                  highlightElevation: 0.0,
                  color: AppColors().hexToColor("#3B5998"),
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side:
                      BorderSide(color: AppColors().hexToColor("#3B5998"))),
                  onPressed: () {},
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1.2,
                  ),
                  ListTile(
                    title: Text(
                      "+2348100395180",
                      style: _textStyle,
                    ),
                    contentPadding: _contentPadding,
                  ),
                  Divider(
                    height: 0,
                    indent: 21,
                    thickness: 1,
                  ),
                  IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              padding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                              child: ProfileInput(
                                hint: "First Name",
                              ),
                            ),
                            flex: 12,
                          ),
                          Flexible(
                            child: VerticalDivider(
                              width: 0.0,
                              thickness: 1.0,
                              indent: 10.0,
                              endIndent: 10.0,
                            ),
                            fit: FlexFit.tight,
                          ),
                          Flexible(
                            flex: 12,
                            child:
                            Container(child: ProfileInput(hint: "Last Name")),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
