import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/widgets.dart';

import 'model/getImageModel.dart';

class ProfileController extends GetxController {
  GetStorage localStorage = GetStorage();
  TextEditingController signInMailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  RxString networkImage = "".obs;
  var getImageData = GetImageModel().obs;
  var selectedMedia = Rxn<XFile>();
  RxBool loader = false.obs;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> galleryPicker() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null && result.toString().isNotEmpty) {
      selectedMedia.value = result;
    }
    if (selectedMedia.value != null) {
      await uploadProfilePicture();
    }
  }

  Future<void> cameraPicker() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.camera);

    if (result != null && result.toString().isNotEmpty) {
      selectedMedia.value = result;
    }
    if (selectedMedia.value != null) {
      await uploadProfilePicture();
    }
  }

  RxBool obsecure = true.obs;

  RxBool rememberMe = false.obs;

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  logOut() async {
    final String? token = localStorage.read('api_token');
    print("logout token ${token}");
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
          Get.offAllNamed("/signIn");
          // Get.reload();
        }
      },
    );

    if (a.toString().isNotEmpty) {}
  }

  Future<void> uploadProfilePicture() async {
    print("Profile API running");

    try {
      loader.value = true;

      final String? token = localStorage.read('api_token');
      final imageFile = File(selectedMedia.value!.path);
      String fileName = path.basename(imageFile.path);

      if (token == null || selectedMedia.value == null) {
        print("Token or image is missing");
        return;
      }

      print('image path sk ${imageFile.path}');
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://winngoogala.winngooconsultancy.in/api/profile-photo'),
      );
      print('final name $fileName');
      // If you have the mime type of the file, uncomment the content type part.
      request.files.add(await http.MultipartFile.fromPath(
        'photo',

        // "/data/user/0/com.example.winngoo/cache/7817122b-8be5-4ebc-bd9b-2bca8c7a5738/IMG-20240820-WA0008.jpg"

        imageFile.path,
        // contentType: MediaType.parse(mimeType),
      ));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        loader.value = false;
        var jsonResponse = jsonDecode(responseBody);
        await getProfilePicture();
        snackBar(msg: jsonResponse['message'], isBadReqested: false);
      } else {
        loader.value = false;
        print("Failed with status code: ${response.statusCode}");
        print("Failed upload profile pic: ${response.stream.bytesToString()}");
        print("Reason: ${response.reasonPhrase}");
      }
    } catch (e) {
      loader.value = false;

      print("Error: $e");
    }
  }

  getProfilePicture() async {
    final String? token = localStorage.read('api_token');

    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET',
        Uri.parse('https://winngoogala.winngooconsultancy.in/api/profile-get'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();

      getImageData.value = getImageModel(responseBody);
      // String localFilePath = getImageData.value.photoUrl.toString();

      networkImage.value = getImageData.value.photoUrl.toString();
      // Check if the file exists at the path

      // // Assign the path to the XFile object
      //
      // selectedMedia.value = XFile(localFilePath);
      // print('Profile picture stored: ${selectedMedia.value!.path}');
      //
      // print('Profile picture stored: ${selectedMedia.value!.path}');
    } else {
      print('bad responde get image ${response.reasonPhrase}');
    }
  }
}
