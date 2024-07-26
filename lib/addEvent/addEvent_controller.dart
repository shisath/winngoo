import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AddEventController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  RxInt isSelected = 0.obs;
  final emailFocusNode = FocusNode();
  final linkFocusNode = FocusNode();

  List addEvent = [
    {
      "title": "Birthday Party",
      "img": "",
    },
    {
      "title": "Wedding Party",
      "img": "",
    },
    {
      "title": "Cradel Cermony",
      "img": "",
    },
    {
      "title": "Launching pary",
      "img": "",
    },
    {
      "title": "Baby Party",
      "img": "",
    },
    {
      "title": "Corporate Event",
      "img": "",
    }
  ];
}
