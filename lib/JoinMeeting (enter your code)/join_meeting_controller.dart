import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';

import '../common_file/getXcontroller.dart ';
import '../conferenceUI/vedioConferenceScreen.dart';

class JoinMeetingController extends GetxController {
  TextEditingController enterCode = TextEditingController();
  TextEditingController enterLink = TextEditingController();
  RxBool loader = false.obs;
  final emailFocusNode = FocusNode();
  final linkFocusNode = FocusNode();

  meetingCodeValidation() async {
    final String? token = localStorage.read('api_token');

    var res = postMethod(
        statusCode: 201,
        endPoint: "invitations/use",
        body: {"invite_code": "FJA58U5349"},
        token: token,
        setLoader: (s) {
          loader.value = s;
        },
        success: (s) {
          if (s == true) {
            Get.to(
              VideoConferencePage(
                conferenceID: joinMeetingController.enterCode.text,
                userId: "sathish",
                userName: "kumar",
              ),
            );
          }
        });
  }
}
