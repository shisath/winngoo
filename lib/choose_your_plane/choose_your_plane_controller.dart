import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';

import 'model/planeDetails.dart';

class ChooseYourPlaneController extends GetxController {
  RxInt isSelected = 0.obs;
  RxString date = "".obs;
  RxString hours = "".obs;
  RxString minutes = "".obs;
  RxString day = "".obs;
  var planeApiData = PlaneDetails().obs;
  List<bool> seleted = [true, true].obs;
  List<Map<String, dynamic>> planeDetails = [
    {
      "title": "Free",
      "amount": 0,
      "spec": [
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
      ]
    },
    {
      "title": "Premium",
      "amount": 30,
      "spec": [
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
      ]
    },
    {
      "title": "Business",
      "amount": 50,
      "spec": [
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
      ]
    },
    {
      "amount": 18,
      "spec": [
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
        "Voice messages anywhere",
      ]
    },
  ];

  RxBool isDate = false.obs;
  final hoursFocuNode = FocusNode();
  final minuteFocuNode = FocusNode();

  planeApi() async {
    var res = await getMethod(endPoint: "prices");

    if (res.toString().isNotEmpty) {
      planeApiData.value = planeDetailsData(res);
      print('plane details ${planeApiData.value.data![0].minQuantity}');
    }
  }
}
