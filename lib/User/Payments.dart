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
  final _padding = EdgeInsets.only(left: 13.0, right: 13.0, bottom: 8.0);
  final _contentPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments", style: TextStyle(color: AppColors.color4),),
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
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Visibility(
                    visible: true,
                    child: Column(
                      children: <Widget>[
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
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
                          contentPadding: _contentPadding,
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
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
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
                          contentPadding: _contentPadding,
                          onTap: () {
                            //
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      ListTile(
                        title: Text(
                          "Add payment card",
                          style: _tileTextStyle,
                        ),
                        leading: Icon(
                          Icons.add,
                          size: 25,
                        ),
                        contentPadding: _contentPadding,
                        onTap: () {
                          //
                        },
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 27.0),
                child: Column(
                  children: <Widget>[
                    Divider(
                      thickness: 4.0,
                      height: 0.0,
                    ),
                    ListView(
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
                          contentPadding: _contentPadding,
                          onTap: () {
                            //
                          },
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 4.0,
                      height: 0.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: _padding,
                child: Text(
                  "Promotions",
                  style: _titleTextStyle,
                ),
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Divider(
                        height: 0.0,
                        thickness: 1,
                      ),
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
                        contentPadding: _contentPadding,
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
