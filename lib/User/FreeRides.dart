import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';

class FreeRides extends StatefulWidget {
  @override
  _FreeRidesState createState() => _FreeRidesState();
}

class _FreeRidesState extends State<FreeRides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get a Free ride", style: TextStyle(color: AppColors.color4),),
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
          Container()
        ],
      ),
    );
  }
}
