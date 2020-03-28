

import 'dart:convert';
import 'dart:io';

import 'package:deebus/Constants/API.dart';
import 'package:deebus/Data/ResponseData.dart';
import 'package:deebus/Models/DefaultResponse.dart';
import 'package:deebus/Models/SignUpResponse.dart';
import 'package:deebus/StudentOnboarding/UserAuthentication/otpConfirm.dart';
import 'package:deebus/Utils/AlertDialogs.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:http/http.dart' as Client;

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterBackend{
  SharedPreferences sharedPreferences;
  var logger= Logger(
      printer:  PrettyPrinter(
        colors: true,
        printEmojis: true,
        printTime: true,
      )
  );
  
  Future<void> signUpFetch(BuildContext context, String firstName, String secondName, String email, String password) async{
    final url= http+baseURL+signUpPath;

    logger.i(url);
    logger.i(json.encode({
      "firstName": firstName,
      "lastName": secondName,
      "email": email,
      "password": password
    }));

    try {
      final httpConnectionApi = await Client.post(
          url,
        headers: {HttpHeaders.contentTypeHeader:'application/json'},
        body: json.encode({
          "firstName": firstName,
          "lastName": secondName,
          "email": email,
          "password": password
        }),
      
      ).timeout(const Duration( seconds: 60));

      logger.i(httpConnectionApi.statusCode);
      logger.i(httpConnectionApi.body);

      if(httpConnectionApi.statusCode==200){
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
        if(ResponseData.defaultResponse.status==1){
          ResponseData.signUpResponse = SignUpResponse.map(ResponseData.defaultResponse.data);
              navigateReplace(context, OTPScreen(email));
        }else if(ResponseData.defaultResponse.status==0){
          showErrorDialog(context, "An error occured");
        }else showErrorDialog(context, "A network Error Occured");
      }else if (httpConnectionApi.statusCode == 401){
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
        showErrorDialog(context, ResponseData.defaultResponse.message);
      }else if (httpConnectionApi.statusCode == 400){
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
        showErrorDialog(context, ResponseData.defaultResponse.message);
//        logger.i(ResponseData.defaultResponse.message);
//        logger.i(ResponseData.badResponse.msg);
      }

    } on Exception catch (e) {
      showErrorDialog(context, 'An Error Occured');
      throw e;
    }
  }
  saveEmail()async{
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("email", ResponseData.loginResponse.email);
    sharedPreferences.setString("firstName", ResponseData.loginResponse.firstName);
    sharedPreferences.setString("lastName", ResponseData.loginResponse.lastName);
    sharedPreferences.setBool("isLoggedInFirstTime", true);
  }
}