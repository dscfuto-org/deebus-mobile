

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

class RegisterBackend{
  
  Future<void> signUpFetch(BuildContext context, String firstName, String secondName, String email, String password) async{
    final url= http+baseURL+signUpPath;

    print(url);
    print(json.encode({
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
      
      );

      print(httpConnectionApi.statusCode);
      print(httpConnectionApi.body);

      if(httpConnectionApi.statusCode==200){
        var resBody = jsonDecode(httpConnectionApi.body.toString());
        ResponseData.defaultResponse = DefaultResponseModel.fromJson(resBody);
        if(ResponseData.defaultResponse.status==1){
          ResponseData.signUpResponse = SignUpResponse.map(ResponseData.defaultResponse.data);
              navigatePush(context, OTPScreen());
        }else if(ResponseData.defaultResponse.status ==0){
          showErrorDialog(context, "An error occured");
        }else showErrorDialog(context, "A network Error Occured");
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}