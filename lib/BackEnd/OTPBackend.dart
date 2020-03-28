import 'dart:convert';
import 'dart:io';

import 'package:deebus/Constants/API.dart';
import 'package:deebus/Data/ResponseData.dart';
import 'package:deebus/Models/DefaultResponse.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/login.dart';
import 'package:deebus/Utils/AlertDialogs.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Client;
import 'package:logger/logger.dart';

class OTPBackend{
  var logger= Logger(
      printer:  PrettyPrinter(
        colors: true,
        printEmojis: true,
        printTime: true,
      )
  );

  Future<void>otpVerify(BuildContext context, String email,  String otp)async{

    final url= http+baseURL+verifyOtpPath;
    logger.i(url);
    logger.i(json.encode({
      "email": email,
      "otp": otp
    }));

    try{
      final httpConnectionApi = await Client.post(
        url,
        headers: {HttpHeaders.contentTypeHeader:'application/json'},
        body: json.encode({
          "email": email,
          "otp": otp
        }),
      ).timeout(const Duration( seconds: 60));

      logger.i(httpConnectionApi.statusCode);
      logger.i(httpConnectionApi.body);
      if(httpConnectionApi.statusCode==200){
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
        if(ResponseData.defaultResponse.status==1){
          navigateReplace(context, Login());
        }else if(ResponseData.defaultResponse.status ==0){
          showErrorDialog(context, "An error occured");
        }else showErrorDialog(context, "A network Error Occured");
      }else showErrorDialog(context, "Something went wrong");

    }on  Exception catch (e) {
      throw e;
    }


  }
}