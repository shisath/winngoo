import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Global Colors

Color? primaryColor = const Color(0xff5669FF);
Color? secondarycolor = const Color(0xff4a5fed);
Color? buttonColor = const Color(0xff5669FF);
Color? sheduleButtonColor = const Color(0xff182490);
Color headingTextColor = Colors.white;
Color circleColor = Colors.indigoAccent;

///Font size
double contentSize = 18;
double headingSize = 25;

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

// String? validateEmail(String? value) {
//   final emailRegExp =
//       RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
//   if (value == null || value.isEmpty) {
//     return 'This field cannot be empty';
//   } else if (!emailRegExp.hasMatch(value)) {
//     return 'Enter a valid email address';
//   }
//   return null;
//

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
    case 'Address':
      keyboardType = TextInputType.streetAddress;
      maxLength = 60;
      inputFormatters = null;
      break;
    case 'Phone Number':
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
