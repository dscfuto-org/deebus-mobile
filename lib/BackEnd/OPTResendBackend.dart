import 'dart:convert';
import 'dart:io';

import 'package:deebus/Constants/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as Client;

class OTPResendBackend{

  Future<void>otpResendFetch(BuildContext context, String email) async {
    final url = http+baseURL+resendVerifyOtpPath;

    print(url);
    print(json.encode({
      "email": email,
    }));

    try {
      final httpConnectionApi = await Client.post(
        url,
        headers: {HttpHeaders.contentTypeHeader:'application/json'},
        body: json.encode({
          "email": email,
        }),
      );

      print(httpConnectionApi.statusCode);
      print(httpConnectionApi.body);

    } on Exception catch (e) {
      throw e;
    }
  }

}