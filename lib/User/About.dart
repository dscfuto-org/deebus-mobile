import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final _contentPadding = EdgeInsets.symmetric(
    horizontal: 25.0,
    vertical: 2.5,
  );

  final _textStyle = TextStyle(
      fontSize: 21.0, fontWeight: FontWeight.w400, fontFamily: "Ubuntu");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About DeeBus"),
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
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Divider(
                          height: 1,
                          thickness: 1.2,
                        ),
                        ListTile(
                          title: Text(
                            "Rate app",
                            style: _textStyle,
                          ),
                          trailing: Text(
                            "CA.5.47",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w200),
                          ),
                          contentPadding: _contentPadding,
                          onTap: () {
                            //
                          },
                        ),
                        Divider(
                          height: 0,
                          indent: 25,
                          thickness: 1,
                        ),
                        ListTile(
                          title: Text(
                            "Facebook",
                            style: _textStyle,
                          ),
                          contentPadding: _contentPadding,
                          onTap: () {
                            //
                          },
                        ),
                        Divider(
                          height: 1,
                          thickness: 1.2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Material(
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Divider(
                            height: 1,
                            thickness: 1.2,
                          ),
                          ListTile(
                            title: Text(
                              "DeeBus for Business",
                              style: _textStyle,
                            ),
                            contentPadding: _contentPadding,
                            onTap: () {
                              //
                            },
                          ),
                          Divider(
                            height: 0,
                            indent: 25,
                            thickness: 1,
                          ),
                          ListTile(
                            title: Text(
                              "DeeBus Careers",
                              style: TextStyle(
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Ubuntu"),
                            ),
                            contentPadding: _contentPadding,
                            onTap: () {
                              //
                            },
                          ),
                          Divider(
                            height: 1,
                            thickness: 1.2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Material(
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Divider(
                            height: 1,
                            thickness: 1.2,
                          ),
                          ListTile(
                            title: Text(
                              "Terms and Conditions",
                              style: _textStyle,
                            ),
                            contentPadding: _contentPadding,
                            onTap: () {
                              //
                            },
                          ),
                          Divider(
                            height: 1,
                            thickness: 1.2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
