import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:winggoo/common_file/widgets.dart';

///Global Colors

Color? primaryColor = const Color(0xff5669FF);
Color? primaryColor2 = const Color(0xff3D50DF);
Color? secondarycolor = const Color(0xff4a5fed);
Color? buttonColor = const Color(0xff5669FF);
Color? sheduleButtonColor = const Color(0xff182490);
Color headingTextColor = Colors.white;
Color circleColor = Colors.indigoAccent;

///Font size
double contentSize = 16;
double headingSize = 20;

///images
var psycoPng = "assets/psyco.png";

///validation
String? validatePhoneNumber(String? value) {
  final phoneRegExp =
      RegExp(r'^\+?[1-9]\d{1,14}$'); // Basic international phone number regex
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  } else if (!phoneRegExp.hasMatch(value) || value.length < 10) {
    return 'Enter a valid phone number';
  }
  return null;
}

String? validateEmail(String? value) {
  final emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

Map<String, dynamic> getInputSettings({required String type}) {
  TextInputType keyboardType;
  int maxLength;
  List<TextInputFormatter>? inputFormatters;

  switch (type) {
    case 'Name':
      keyboardType = TextInputType.name;
      maxLength = 20;
      inputFormatters = null;
      break;
    case 'Age':
      keyboardType = TextInputType.number;
      maxLength = 3;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
      break;

    case 'Mobile No':
      keyboardType = TextInputType.phone;
      maxLength = 10;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
      break;
    case 'Select Your Date':
      keyboardType = TextInputType.number;
      maxLength = 8;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
      break;
    case 'HH':
      keyboardType = TextInputType.number;
      maxLength = 2;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
      break;
    case 'MM':
      keyboardType = TextInputType.number;
      maxLength = 2;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
      break;
    default:
      keyboardType = TextInputType.text;
      maxLength = 50;
      inputFormatters = null;
      break;
  }

  return {
    'keyboardType': keyboardType,
    'maxLength': maxLength,
    'inputFormatters': inputFormatters,
  };
}

Future<String> postMethod({
  required String endPoint,
  required Map<String, dynamic> body,
  String? route,
  int? statusCode,
  bool? isGetOff,
  required String? token,
  required Function(bool) setLoader,
  // required Function(String) apiToken,
}) async {
  try {
    setLoader(true);

    var headers;

    if (token.toString() == "" || token!.isEmpty) {
      print("noauth");
      headers = {
        'Content-Type': 'application/json',
      };
    } else {
      print("auth");
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }

    var request = http.Request(
      'POST',
      Uri.parse('https://winngoogala.winngooconsultancy.in/api/$endPoint'),
    );

    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == (statusCode ?? 200)) {
      Navigator.of(Get.context!).pop();
      print("print 1");
      String responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);
      print("print 2");

      // apiToken(jsonResponse["data"]['token']);
      // solosathish7@gmail.com
      // sk123123
      print("print 3");
      if (jsonResponse.toString().contains("message")) {
        String successMessage = jsonResponse["message"];
        showSnackBarUsingGet(isBadReqested: false, msg: successMessage);
      }
      print("print 4");

      ///Routes
      if (route != null && route.isNotEmpty) {
        switch (isGetOff ?? false) {
          case true:
            Get.offNamed("/$route");
            break;
          case false:
            Get.toNamed("/$route");
            break;
        }
      }
      print("print 5");
      setLoader(false);
      print("print 6");
      return responseBody;
    } else {
      String responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);
      print("bad response1 $jsonResponse");

      // String successMessage = jsonResponse["message"];
      // print("bad response2 $successMessage");

      // showSnackBarUsingGet(
      //   isBadReqested: true,
      //   msg: jsonResponse["errors"]["error"],
      // );

      if (jsonResponse.containsKey('errors')) {
        final errors = jsonResponse['errors'];

        if (errors.containsKey('error')) {
          final emailError =
              errors['error']; // Access the first error message for email
          showSnackBarUsingGet(isBadReqested: true, msg: emailError);
        }

        if (errors.containsKey('email')) {
          final emailError =
              errors['email'][0]; // Access the first error message for email
          showSnackBarUsingGet(isBadReqested: true, msg: emailError);
        }
        if (errors.containsKey('name')) {
          final emailError =
              errors['name'][0]; // Access the first error message for email
          showSnackBarUsingGet(isBadReqested: true, msg: emailError);
        }
        if (errors.containsKey('date')) {
          final emailError =
              errors['date'][0]; // Access the first error message for email
          showSnackBarUsingGet(isBadReqested: true, msg: emailError);
        }
        if (errors.containsKey('time')) {
          final emailError =
              errors['time'][0]; // Access the first error message for email
          showSnackBarUsingGet(isBadReqested: true, msg: emailError);
        }

        if (errors.containsKey('confirm_email')) {
          final confirmEmailError = errors['confirm_email']
              [0]; // Access the first error message for confirm email
          showSnackBarUsingGet(isBadReqested: true, msg: confirmEmailError);
        }
        if (errors.containsKey('token')) {
          final confirmEmailError = errors['token']
              [0]; // Access the first error message for confirm email
          showSnackBarUsingGet(isBadReqested: true, msg: confirmEmailError);
        }
      }
      setLoader(false);

      return responseBody;
    }
  } catch (e) {
    print("Error in POST request: $e");
    rethrow; // Optional: You can rethrow the error or handle it in your calling method
  }
}

Future<dynamic> getMethod({required String endPoint}) async {
  GetStorage localStorage = GetStorage();
  final String? token = localStorage.read('api_token');
  print(" token done $token");
  var headers = {'Authorization': 'Bearer $token'};
  var request = http.Request('GET',
      Uri.parse('https://winngoogala.winngooconsultancy.in/api/$endPoint'));
  request.body = '''''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var responseBody = await response.stream.bytesToString();

    print("${responseBody}");

    return responseBody;
  } else {
    print(response.reasonPhrase);
    return showSnackBarUsingGet(
        isBadReqested: true, msg: "Please Contact Admin");
  }
}
