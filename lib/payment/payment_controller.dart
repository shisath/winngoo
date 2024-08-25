import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:winggoo/common_file/functions.dart';

import '../common_file/getXcontroller.dart ';
import '../documents/model/privacyModel.dart';
import 'model/discountApply.dart';

class PaymentController extends GetxController {
  final GetStorage localStorage = GetStorage();
  var discountApplyApi = DiscountApplyModel().obs;
  RxString totalAmount = "0.0".obs;
  RxBool loader = false.obs;

  TextEditingController couponCode = TextEditingController();
  TextEditingController cdCardHolderName = TextEditingController();
  TextEditingController cdCardNumber = TextEditingController();
  TextEditingController validityDate = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController nBCardNumber = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final FocusNode cdCardHolderfocusNode = FocusNode();
  final FocusNode cdCardNumberfocusNode = FocusNode();
  final FocusNode validityDatefocusNode = FocusNode();
  final FocusNode ccvfocusNode = FocusNode();
  final FocusNode accountNumberfocusNode = FocusNode();
  final FocusNode ifscCodefocusNode = FocusNode();
  final FocusNode nBCardNumberfocusNode = FocusNode();

  cleaner() {
    cdCardHolderName.text = "";
    cdCardNumber.text = "";
    validityDate.text = "";
    cvv.text = "";
    accountNumber.text = "";
    ifscCode.text = "";
    nBCardNumber.text = "";
  }

  discountApply() async {
    final String? token = localStorage.read('api_token');

    var res = await postMethod(
        success: (s) {},
        endPoint: "apply-discount",
        body: {"discount_id": couponCode.text},
        token: token,
        setLoader: (s) {
          loader.value = s;
        });
    if (res.isNotEmpty) {
      discountApplyApi.value = discountApplyModel(res);
      if (discountApplyApi.value.discount!.value != null) {
        print(
            "amountsk ${discountApplyApi.value.discount!.value.toString().split(".")[0]}");
        print("move 0");
        double percentage = double.parse(discountApplyApi.value.discount!.value
            .toString()
            .split(".")[0]
            .toString());
        double amount = double.parse(totalAmount.value.toString());

        print("move 1");
        if (discountApplyApi.value.discount!.type!
            .toString()
            .lowerCamelCase
            .contains("fixed")) {
          print("move 2");
          totalAmount.value = (amount - percentage).toString();
        } else if (discountApplyApi.value.discount!.type!
            .toString()
            .lowerCamelCase
            .contains("percentage")) {
          print("move 3");
          totalAmount.value =
              (amount - (amount * (percentage / 100))).toString();
        }
      }
    }
  }

  makePaymentApi() async {
    final String? token = localStorage.read('api_token');
    print("date   ${validityDate.text.split("-")[0].toString()}");
    print("date   ${validityDate.text.split("-")[1].toString()}");
    var res = await postMethod(
        endPoint: "make-payment",
        body: {
          "amount": totalAmount.value,
          "currency": "usd",
          "card_name": cdCardHolderName.text,
          "card_number": cdCardNumber.text,
          "cvv": cvv.text,
          "expiry_month": validityDate.text.split("-")[0].toString(),
          "expiry_year": validityDate.text.split("-")[1].toString(),
          "token": "tok_visa",
          "user_id":
              logInController.membersApiData.value.data![0].user_id.toString(),
          "event_id": addEventController.selectedId.value
        },
        token: token,
        setLoader: (s) {},
        success: (s) {
          // if (s == true) {}
        });

    if (res.toString().isNotEmpty) {
      Navigator.of(Get.context!).pop();

      cleaner();
    }
  }
}
