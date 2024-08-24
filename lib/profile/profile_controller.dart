import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
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
    if (selectedMedia.value != null) {
      await postProfile();
    }
  }

  Future<void> cameraPicker() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.camera);

    if (result != null && result.toString().isNotEmpty) {
      selectedMedia.value = result;
    }
    if (selectedMedia.value != null) {
      await postProfile();
    }
  }

  RxBool obsecure = true.obs;

  RxBool rememberMe = false.obs;

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  logOut() async {
    final String? token = localStorage.read('api_token');

    var a = await postMethod(
      endPoint: "logout",
      token: token,
      setLoader: (s) {},
      body: {},
      success: (s) {
        if (s == true) {
          localStorage.remove('api_token');
          localStorage.remove('selectedEventId');
          localStorage.remove('selectedPlaneId');
          Get.offNamed("/signIn");
          // Get.reload();
        }
      },
    );

    if (a.toString().isNotEmpty) {}
  }

  Future<void> postProfile() async {
    print("Profile API running");

    try {
      final String? token = localStorage.read('api_token');
      final imageFile = File(selectedMedia.value!.path);

      if (token == null || selectedMedia.value == null) {
        print("Token or image is missing");
        return;
      }

      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://winngoogala.winngooconsultancy.in/api/profile-photo'),
      );

      // If you have the mime type of the file, uncomment the content type part.
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        imageFile.path,
        // contentType: MediaType.parse(mimeType),
      ));
      request.headers.addAll(headers);

      // Sending the request
      http.StreamedResponse response = await request.send();

      // Reading the response only once
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        print("API done: $responseBody");
      } else {
        print("Failed with status code: ${response.statusCode}");
        print("Reason: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
