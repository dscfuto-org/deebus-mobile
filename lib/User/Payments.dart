import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:deebus/Utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _titleTextStyle = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 17, fontFamily: "Ubuntu");
  final _tileTextStyle = TextStyle(
      fontSize: 21.0, fontWeight: FontWeight.w400, fontFamily: "Ubuntu");
  final _padding = EdgeInsets.only(left: 13.0, right: 13.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Payments"),
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
              Padding(
                padding: _padding,
                child: Text(
                  "Payments methods",
                  style: _titleTextStyle,
                ),
              ),
              ListView(
                padding: _padding,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Visibility(
                    visible: true,
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          title: Text(
                            "Cash",
                            style: _tileTextStyle,
                          ),
                          leading: Icon(
                            MyFlutterApp.money_1,
                            size: 25,
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 25,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          onTap: () {
                            //
                          },
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          title: Text(
                            "Debit Card",
                            style: _tileTextStyle,
                          ),
                          leading: Icon(
                            MyFlutterApp.cc_mastercard,
                            size: 25,
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 25,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 2.0,
                          ),
                          onTap: () {
                            //
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text(
                          "Add payment card",
                          style: _tileTextStyle,
                        ),
                        leading: Icon(
                          Icons.add,
                          size: 25,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.0,
                        ),
                        onTap: () {
                          //
                        },
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 6.0,
              ),
              ListView(
                padding: _padding,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Create your Business Profile",
                      style: _tileTextStyle,
                    ),
                    leading: Icon(MyFlutterApp.briefcase),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 28,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 2.0,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                ],
              ),
              Divider(
                thickness: 6.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: Text(
                  "Promotions",
                  style: _titleTextStyle,
                ),
              ),
              ListView(
                padding: _padding,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text(
                          "Enter promo code",
                          style: _tileTextStyle,
                        ),
                        leading: Icon(
                          Icons.card_giftcard,
                          size: 25,
                        ),
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.0,
                        ),
                        onTap: () {
                          //
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
