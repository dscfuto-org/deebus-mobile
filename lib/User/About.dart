import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final _contentPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 2.5,
  );
  _launchURLRateApp() async {
    const url = 'https://codemarka.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLFaceBook() async {
    const url = 'https://codemarka.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLDeeBusBusiness() async {
    const url = 'https://codemarka.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLDeeBusCareers() async {
    const url = 'https://codemarka.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLTermsAndConditions() async {
    const url = 'https://codemarka.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final _textStyle = TextStyle(
      fontSize: 21.0, fontWeight: FontWeight.w400, fontFamily: "Ubuntu");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About DeeBus", style: TextStyle(color: AppColors.color4),),
        backgroundColor: AppColors.color1,
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
      body: ListView(
        children: <Widget>[
          Container(
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
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w200),
                              ),
                              contentPadding: _contentPadding,
                              onTap: _launchURLRateApp,
                            ),
                            Divider(
                              height: 0,
                              indent: 16,
                              thickness: 1,
                            ),
                            ListTile(
                              title: Text(
                                "Facebook",
                                style: _textStyle,
                              ),
                              contentPadding: _contentPadding,
                              onTap: _launchURLFaceBook,
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
                                onTap: _launchURLDeeBusBusiness,
                              ),
                              Divider(
                                height: 0,
                                indent: 16,
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
                                onTap: _launchURLDeeBusCareers,
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
                                onTap: _launchURLTermsAndConditions,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "DeeBus",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 17.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
