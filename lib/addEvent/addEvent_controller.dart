import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';

import 'model/eventList.dart';

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
  var eventListApiData = EventList().obs;

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

  createEventApi() {
    postMethod(
        statusCode: 201,
        endPoint: "eventscreate",
        token:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Y2FiNTFkNy04MTgwLTQyZDktYTY0Mi0zMGI5NTY0ZjYzNjIiLCJqdGkiOiI1MDU1ZDE1YzZhOWJiMTEzMDVjZjY3NGZhNjJmOTRkMjQ2MjAxNjBmYjM2MGMwNmIxNTg3YWU0NTYwZjZlNWNkNzA4NmJjNmQ0MTY1ZDUzYiIsImlhdCI6MTcyMzk2OTQzNC4yMTU2NDQsIm5iZiI6MTcyMzk2OTQzNC4yMTU2NDYsImV4cCI6MTc1NTUwNTQzNC4yMTE3NTIsInN1YiI6IjIxIiwic2NvcGVzIjpbXX0.nJIiuxpaMEkgg5agkYiMqIJ2E837kTwliSJV3zlgPiKNaXNG61aunZZS_E8Ve1mqqDGRG7g_9SBL5NSYg4BCHkcggZjXaxnXa-Jck31bapaDaMSs8qqE466W9H0E86ueZQnEMNvDAvY8X3Al_VBusmOkZpMSc2b_K_Gb0sHo_8L_-ETb83SO1PUI4UcCXyoo36zau_LwRy_NWjM5i2ot2hRQDX0C1lgdJrt2kuqFUP7ffy-SJ2K4BJLo7ClbML1YycCluS6gxRKP_tnoWq3gXQ-Pa4QPJo2q8i0nJvNUlg-ns_S1TD93gt7tN25z7BdrmVPFTOpPjNZFGLFX6kQmvWb5qxmny-BjP5k4am087AHcknBk9bF1HAJ--2sptyRS2vLbkVnNP9-IQENkMQWeu1n1ytcsuFqqpmg0DTkBq0BL9YlLbACRNJFtjYMF1yqPt9DHmybyCAdCdUzY8zfrYYr6wYUBpp7ih1v3PkQPP6ik_ylgwTfgN2ww2WeiQDFBYcMTKl7MiEIJ3137TfrUTH4zb9kNs7pq5fH6PSIcOVgdUvVFxOTFGX6zx6LuP45REfjPHNkbPchuESNghhds8ai2ne6fP6Gg-y1CFuM3-KsUfAyV-G4fXY97VM3Z_O46vyQM8yt3i8gqzAOElVqT5flfuvZdhfK7o6MMSAAK0To",
        body: {
          "name": eventNameController.text,
          "date": eventDateController.text,
          "time": eventTimeController.text,
          "user_id": "10"
        },
        setLoader: (s) {
          loader.value = s;
        });
  }

  eventListApi() async {
    var res = await getMethod(endPoint: 'events');
    if (res.toString().isNotEmpty) {
      eventListApiData.value = eventListData(res);
      print(eventListApiData.value.data);
    }
  }
}
