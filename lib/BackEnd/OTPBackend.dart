import 'dart:convert';
import 'dart:io';

import 'package:deebus/Constants/API.dart';
import 'package:deebus/Data/ResponseData.dart';
import 'package:deebus/Models/DefaultResponse.dart';
import 'package:deebus/User/dashboard.dart';
import 'package:deebus/Utils/AlertDialogs.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Client;

class OTPBackend{


  Future<void>otpVerify(BuildContext context, String email,  String otp)async{

    final url= http+baseURL+verifyOtpPath;
    print(url);
    print(json.encode({
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
      );

      print(httpConnectionApi.statusCode);
      print(httpConnectionApi.body);
      if(httpConnectionApi.statusCode==200){
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
        if(ResponseData.defaultResponse.status==1){
          navigateReplace(context, Dashboard());
        }else if(ResponseData.defaultResponse.status ==0){
          showErrorDialog(context, "An error occured");
        }else showErrorDialog(context, "A network Error Occured");
      }else showErrorDialog(context, "Something went wrong");

    }on  Exception catch (e) {
      throw e;
    }


  }
}