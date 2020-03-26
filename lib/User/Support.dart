import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final _contentPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 2.5,
  );

  final _textStyle = TextStyle(
      fontSize: 21.0, fontWeight: FontWeight.w400, fontFamily: "Ubuntu");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support", style: TextStyle(color: AppColors.color4),),
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
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Support",
                  style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w300,
                      fontFamily: "Ubuntu"),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 2.5,
                ),
                trailing: Icon(
                  Icons.search,
                  size: 26.0,
                ),
                onTap: () {
                  //
                },
              ),
              Material(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 1,
                      thickness: 1.2,
                    ),
                    ListTile(
                      title: Text(
                        "Account",
                        style: _textStyle,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 25.0,
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
                    ListTile(
                      title: Text(
                        "Payments & Pricing",
                        style: _textStyle,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 25.0,
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
                    ListTile(
                      title: Text(
                        "Using DeeBus",
                        style: _textStyle,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 25.0,
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
                    ListTile(
                      title: Text(
                        "DeeBus Scooters",
                        style: _textStyle,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 25.0,
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
              ),
              Container(
//              margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: ListTile(
                  title: Text(
                    "Conversations",
                    style: TextStyle(
                        fontSize: 21.0,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w300,
                        fontFamily: "Ubuntu"),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 2.5,
                  ),
                  onTap: () {
                    //
                  },
                ),
              ),
              Material(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 1,
                      thickness: 1.2,
                    ),
                    ListTile(
                      title: Text(
                        "Your conversations",
                        style: _textStyle,
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 25.0,
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
              )
            ],
          ),
        ],
      )
    );
  }
}
