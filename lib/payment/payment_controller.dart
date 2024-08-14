import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
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
}
