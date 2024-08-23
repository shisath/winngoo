import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winggoo/common_file/functions.dart';

class ProfileController extends GetxController {
  GetStorage localStorage = GetStorage();
  TextEditingController signInMailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  var selectedMedia = Rxn<XFile>();
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> galleryPicker() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null && result.toString().isNotEmpty) {
      selectedMedia.value = result;
    }
  }

  Future<void> cameraPicker() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.camera);

    if (result != null && result.toString().isNotEmpty) {
      selectedMedia.value = result;
    }
  }

  RxBool obsecure = true.obs;

  RxBool rememberMe = false.obs;

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  logOut() async {
    final String? token = localStorage.read('api_token');

    var a = await postMethod(
        success: (s) {},
        endPoint: "logout",
        token: token,
        setLoader: (s) {},
        body: {});

    if (a.toString().isNotEmpty) {
      localStorage.remove('api_token');
      Get.offNamed("/signIn");
    }
  }
}
