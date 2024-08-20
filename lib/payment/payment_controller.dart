import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winggoo/common_file/functions.dart';

class PaymentController extends GetxController {
  final GetStorage localStorage = GetStorage();

  TextEditingController couponCode = TextEditingController();
  TextEditingController cdCardNumber = TextEditingController();
  TextEditingController validityDate = TextEditingController();
  TextEditingController ccv = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController nBCardNumber = TextEditingController();

  final FocusNode focusNode = FocusNode();
  final FocusNode cdCardNumberfocusNode = FocusNode();
  final FocusNode validityDatefocusNode = FocusNode();
  final FocusNode ccvfocusNode = FocusNode();
  final FocusNode accountNumberfocusNode = FocusNode();
  final FocusNode ifscCodefocusNode = FocusNode();
  final FocusNode nBCardNumberfocusNode = FocusNode();

  discountApply() async {
    final String? token = localStorage.read('api_token');

    var a = await postMethod(
        endPoint: "apply-discount",
        body: {"discount_id": couponCode.text},
        token: token,
        setLoader: (s) {});
  }
}
