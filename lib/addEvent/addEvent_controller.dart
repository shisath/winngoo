import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:winggoo/common_file/functions.dart';

class AddEventController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();
  TextEditingController eventImageController = TextEditingController();
  RxString date = "".obs;
  RxString time = "".obs;
  RxBool loader = false.obs;
  // TextEditingController evnetImageController = TextEditingController();

  RxInt isSelected = 0.obs;
  RxInt isSelectedEvent = 0.obs;
  final emailFocusNode = FocusNode();
  final linkFocusNode = FocusNode();
  final eventNameFocusNode = FocusNode();
  final eventDateFocusNode = FocusNode();
  final eventTimeFocusNode = FocusNode();
  final eventImageFocusNode = FocusNode();

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

  createEvent() {
    postMethod(
        endPoint: "eventscreate",
        body: {
          "name": eventNameController.text,
          "date": "2024-08-02",
          "time": "13:00",
          "user_id": "13"
        },
        setLoader: (bool) {
          loader.value = bool;
        });
  }
}
