
import 'package:deebus/Constants/AppColors.dart';
import 'package:deebus/Constants/Strings.dart';
import 'package:deebus/Utils/Styles.dart';
import 'package:flutter/material.dart';

import 'Navigators.dart';


/// this method pops up an alert dialog
void showErrorDialog(BuildContext context, String message, ) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Notification'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              navigateBack(context);
//              navigateReplace(context, Login());

            },
          )
        ],
      ));
}

/// this method collects a customized ui and pops it as an alert dialog
openDialog(Widget widget, BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return widget;
      }
  );
}



loadingDialog(BuildContext context){
  showDialog(
    barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return Center(
          child: Dialog(
            child: Container(
              height: 100,
              child: Center(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(pleaseWaitText, style: textStyleBigLightB,),
                    SizedBox(width: 10,),
                    CircularProgressIndicator(
                      backgroundColor: AppColors.color1,
                      valueColor: new AlwaysStoppedAnimation(AppColors.color4),
                    ),
                  ],
                )
              ),
            ),
          ),
        );
      }
  );
}


void showAlertDialog(BuildContext context, String message, ) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Notification'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              navigateBack(context);

            },
          )
        ],
      ));
}



void successAlertDialog(BuildContext context, String message, ) {
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Notification'),
        content: Text(message),

      ));
}



//
//showImageDialog(BuildContext context, String image) {
//  showDialog(
//    context: context,
//    barrierDismissible: false,
//    builder: (_) => Center(
//      child: Dialog(
//        elevation: 0,
//        child: Container(
//          height: 375,
//          width: 100,
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.all(Radius.circular(40)),
//          ),
//          child: PhotoView(
//            imageProvider: NetworkImage(image),
//            backgroundDecoration: BoxDecoration(
//              color: Colors.transparent,
//            ),
//
//          )
//        ),
//      ),
//    ),
//  );
//}



//Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//IconButton(
//color: Colors.white,
//icon: Icon(Icons.close),
//onPressed: () => Navigator.pop(context),
//),
//const SizedBox(width: 10.0),
//IconButton(
//color: Colors.white,
//icon: Icon(Icons.share),
//onPressed: () {},
//),
//],
//),