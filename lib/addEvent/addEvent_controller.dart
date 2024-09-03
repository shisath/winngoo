import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/images.dart';

import '../common_file/getXcontroller.dart';
import 'model/eventList.dart';

class AddEventController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();
  RxString date = "".obs;
  RxString time = "".obs;
  RxBool loader = false.obs;
  RxBool refreshLoader = false.obs;
  final RxString randomImage = "".obs;
  RxString selectedId = "".obs;

  // TextEditingController evnetImageController = TextEditingController();
  var eventListApiData = EventList().obs;

  RxInt isRecomeded = 0.obs;
  RxString isSelectedEvent = "".obs;
  final emailFocusNode = FocusNode();
  final linkFocusNode = FocusNode();
  final eventNameFocusNode = FocusNode();
  final eventDateFocusNode = FocusNode();
  final eventTimeFocusNode = FocusNode();
  final eventImageFocusNode = FocusNode();

  cleaner() {
    eventNameController.clear();
    eventTimeController.clear();
    eventDateController.clear();
    isSelectedEvent.value = "";
    selectedId.value = "";
  }

  List recomeded = [
    {
      "title": "Birthday Celebration",
      "image": cakePng,
    },
    {
      "title": "Wedding Celebration",
      "image": weddingPng,
    },
    {
      "title": "Baby Shower",
      "image": babyPng,
    },
    {
      "title": "Shop Inauguration",
      "image": ribbonPng,
    },
  ].obs;

  final RxList<String> images = [
    celeb1,
    celeb2,
    celeb3,
    celeb4,
    celeb5,
  ].obs;
  final random = Random();

  void getRandomImage() {
    final random = Random();
    randomImage.value = images[random.nextInt(images.length)];
  }

  createEventApi() async {
    print("Event create api");
    final String? token = localStorage.read('api_token');
    final String? memberId = localStorage.read('member_id').toString();

    print('name ${eventNameController.text}');
    print('date ${eventDateController.text}');
    print('time ${eventTimeController.text}');
    print('userId ${memberId}');
    postMethod(
        success: (s) async {
          if (s == true) {
            await eventListApi();
          }
        },
        statusCode: 201,
        endPoint: "eventscreate",
        token: token,
        body: {
          "name": eventNameController.text,
          "date": eventDateController.text,
          "time": eventTimeController.text,
          "user_id": int.parse(memberId!)
        },
        setLoader: (s) {
          loader.value = s;
        });
  }

  eventListApi() async {
    print("Event list api");
    addEventController.refreshLoader.value = true;
    print("api token ${logInController.token.value}");
    var res = await getMethod(
        endPoint: 'events',
        setLoader: (l) {
          loader.value = l;
        },
        success: (s) {});
    if (res.toString().isNotEmpty) {
      // print("eventlist Response ${res['data']}");
      eventListApiData.value = eventListData(res);
      addEventController.refreshLoader.value = false;

      // print("sk donr ${eventListApiData.value.data?[0].name}");
    }
  }
}
