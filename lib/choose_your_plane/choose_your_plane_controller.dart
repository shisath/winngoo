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
  RxBool loader = false.obs;
  RxString selectedPlane = "".obs;
  var planeApiData = PlaneDetails().obs;

  List<bool> seleted = [true, true].obs;

  RxBool isDate = false.obs;
  final hoursFocuNode = FocusNode();
  final minuteFocuNode = FocusNode();

  planeApi() async {
    var res = await getMethod(
        endPoint: "prices",
        setLoader: (s) {
          loader.value = s;
        },
        success: (s) {});

    if (res.toString().isNotEmpty) {
      planeApiData.value = planeDetailsData(res);
      Get.toNamed("/chooseYourPlane");

      print('plane details ${planeApiData.value.data![0].minQuantity}');
    }
  }
}
