import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/images.dart';

import '../common_file/getXcontroller.dart';
import 'model/eventList.dart';

class AddEventController extends GetxController {
  GetStorage localStorage = GetStorage();
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

  cleaner() {
    eventNameController.text = "";
    eventTimeController.text = "";
    eventDateController.text = "";
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
      "title": "Ribbon",
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
    GetStorage localStorage = GetStorage();
    print(
        "user id sk ${logInController.membersApiData.value.data![0].userId.toString()}");
    final String? token = localStorage.read('api_token');
    await postMethod(
        statusCode: 201,
        endPoint: "eventscreate",
        token: token,
        body: {
          "name": eventNameController.text,
          "date": eventDateController.text,
          "time": eventTimeController.text,
          "user_id": logInController.membersApiData.value.data![0].id.toString()
          //
        },
        setLoader: (s) {
          loader.value = s;
        });
    await eventListApi();
  }

  eventListApi() async {
    addEventController.refreshLoader.value = true;
    print("api token ${logInController.token.value}");
    var res = await getMethod(
        endPoint: 'events',
        setLoader: (l) {
          loader.value = l;
        });
    if (res.toString().isNotEmpty) {
      // print("eventlist Response ${res['data']}");
      eventListApiData.value = eventListData(res);
      addEventController.refreshLoader.value = false;

      print("sk donr ${eventListApiData.value.data?[0].name}");
    }
  }
}
