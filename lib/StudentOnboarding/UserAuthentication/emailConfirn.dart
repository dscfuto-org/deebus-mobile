import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';
import 'package:deebus/Constants/AppColors.dart' as prefix0;

class EmailConfirm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new EmailConfirmState();
  }
}

class EmailConfirmState extends State<EmailConfirm> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Confirm Email"),
        backgroundColor: Colors.white10,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: prefix0.AppColors.color4,
            size: 35.0,
          ),
          onPressed: () => navigateBack(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Confirm Your email",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(14.0),
                ),
                textColor: Colors.white,
                color: prefix0.AppColors.color4,
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Go to email",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
