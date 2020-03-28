import 'dart:convert';
import 'dart:io';

import 'package:deebus/Constants/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as Client;
import 'package:logger/logger.dart';

class OTPResendBackend{
  var logger= Logger(
      printer:  PrettyPrinter(
        colors: true,
        printEmojis: true,
        printTime: true,
      )
  );

  Future<void>otpResendFetch(BuildContext context, String email) async {
    final url = http+baseURL+resendVerifyOtpPath;

    logger.i(url);
    logger.i(json.encode({
      "email": email,
    }));

    try {
      final httpConnectionApi = await Client.post(
        url,
        headers: {HttpHeaders.contentTypeHeader:'application/json'},
        body: json.encode({
          "email": email,
        }),
      ).timeout(const Duration( seconds: 60));

      logger.i(httpConnectionApi.statusCode);
      logger.i(httpConnectionApi.body);

    } on Exception catch (e) {
      throw e;
    }
  }

}