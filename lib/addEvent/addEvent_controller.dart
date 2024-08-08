import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEventController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  RxInt isSelected = 0.obs;
  final emailFocusNode = FocusNode();
  final linkFocusNode = FocusNode();

  List<Map<String, dynamic>> eventList = [
    {
      "title": "Birthday Party",
      "img": "",
      "date": "01/02/2000",
      "ispaid": true
    },
    {
      "title": "Wedding Party",
      "img": "",
      "date": "01/02/2000",
      "ispaid": false
    },
    {
      "title": "Baby showering",
      "img": "",
      "date": "01/02/2000",
      "ispaid": true
    },
    {
      "title": "Wedding Party",
      "img": "",
      "date": "01/02/2000",
      "ispaid": false
    },
    {
      "title": "Cradel Cermony",
      "img": "",
      "date": "01/02/2000",
      "ispaid": false
    },
    {
      "title": "Launching pary",
      "img": "",
      "date": "01/02/2000",
      "ispaid": true
    },
    {"title": "Baby Party", "img": "", "date": "01/02/2000", "ispaid": false},
    {
      "title": "Corporate Event",
      "img": "",
      "date": "01/02/2000",
      "ispaid": false
    },
    {
      "title": "Corporate Event",
      "img": "",
      "date": "01/02/2000",
      "ispaid": true
    },
    {
      "title": "Corporate Event",
      "img": "",
      "date": "01/02/2000",
      "ispaid": false
    },
    {
      "title": "Corporate Event",
      "img": "",
      "date": "01/02/2000",
      "ispaid": true
    },
    {
      "title": "Corporate Event",
      "img": "",
      "date": "01/02/2000",
      "ispaid": false
    }
  ];
}
