import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SheduleDateTimeController extends GetxController {
  RxInt isSelected = 0.obs;
  RxString date = "".obs;
  RxString hours = "".obs;
  RxString minutes = "".obs;
  RxString day = "".obs;
  List<bool> seleted = [true, true].obs;

  RxBool isDate = false.obs;
  final hoursFocuNode = FocusNode();
  final minuteFocuNode = FocusNode();
}
