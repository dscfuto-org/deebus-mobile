import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
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
      body: Container(),
    );
  }
}
