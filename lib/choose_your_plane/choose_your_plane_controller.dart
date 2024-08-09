import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChooseYourPlaneController extends GetxController {
  RxInt isSelected = 0.obs;
  RxString date = "".obs;
  RxString hours = "".obs;
  RxString minutes = "".obs;
  RxString day = "".obs;
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
}
