import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  TextEditingController signInMailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  var selectedMedia = Rxn<XFile>();
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null && result.toString().isNotEmpty) {
      selectedMedia.value = result;
    }
  }

  RxBool obsecure = true.obs;

  RxBool rememberMe = false.obs;

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
}
