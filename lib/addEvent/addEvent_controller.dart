import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';

import '../common_file/getXcontroller.dart';
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
        token: logInController.token.value,
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
    print("api token ${logInController.token.value}");
    var res = await getMethod(endPoint: 'events');
    if (res.toString().isNotEmpty) {
      // print("eventlist Response ${res['data']}");
      eventListApiData.value = eventListData(res);
      print("sk donr ${eventListApiData.value.data}");
    }
  }
}
