
import 'dart:convert';
import 'dart:io';
import 'package:deebus/Constants/API.dart';
import 'package:deebus/Data/DummyData.dart';
import 'package:deebus/Data/ResponseData.dart';
import 'package:deebus/Models/DefaultResponse.dart';
import 'package:deebus/Models/LoginResponse.dart';
import 'package:deebus/User/dashboard.dart';
import 'package:deebus/Utils/AlertDialogs.dart';
import 'package:deebus/Utils/Navigators.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Client;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  LoginBackend{
  SharedPreferences sharedPreferences;
  var logger= Logger(
    printer:  PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
    )
  );

  Future<void> loginFetch(BuildContext context,String email, String password)async{
    
    final url= http+baseURL+loginPath;
    logger.i(url);
    logger.i(json.encode({
      "email": email,
      "password": password
    }));

    try{
      final httpConnectionApi = await Client.post(
        url,
        headers: {HttpHeaders.contentTypeHeader:'application/json'},
        body: json.encode({
          "email": email,
          "password": password
        }),
      ).timeout(const Duration( seconds: 60));

     logger.i(httpConnectionApi.statusCode);
      logger.i(httpConnectionApi.body);
      if(httpConnectionApi.statusCode==200){
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
        if(ResponseData.defaultResponse.status==1) {
        ResponseData.loginResponse = LoginResponse.fromJson(ResponseData.defaultResponse.data);
         navigateReplace(context, Dashboard());
        logger.i(ResponseData.loginResponse.email);
          saveEmail(); getEmail();
          saveFirstName(); getFirstName();
          saveLastName(); getLastName();
        }else if(ResponseData.defaultResponse.status ==0){
          showErrorDialog(context, "An error occured");
        }else showErrorDialog(context, "A network Error Occured");
      } else if (httpConnectionApi.statusCode == 401){
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
        showErrorDialog(context, ResponseData.defaultResponse.message);
      }else if (httpConnectionApi.statusCode == 400){
        showErrorDialog(context, "Email must be a valid email address.");
      }

    }on  Exception catch (e) {
      throw e;
    }


  }
  saveEmail()async{
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Email", ResponseData.loginResponse.email);


  }
  getEmail()async{
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.email = sharedPreferences.getString("Email");
    logger.i(DummyData.email);
  }
  saveFirstName() async{
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("FirstName", ResponseData.loginResponse.firstName);
  }
  getFirstName() async{
    sharedPreferences = await SharedPreferences.getInstance();
   DummyData.firstName = sharedPreferences.getString("FirstName");
    logger.i(DummyData.firstName);
  }
  saveLastName()async{
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LastName", ResponseData.loginResponse.lastName);
  }
  getLastName()async{
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.lastName = sharedPreferences.getString("LastName");
    logger.i(DummyData.lastName);
  }
}