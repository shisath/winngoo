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
    final String? userId = localStorage.read('userId');
    final String? token = localStorage.read('api_token');
    final String? userName = localStorage.read('userName');

    await postMethod(
        statusCode: 201,
        endPoint: "invitations/use",
        body: {
          "invite_code": enterCode.text,
        },
        token: token,
        setLoader: (s) {
          loader.value = s;
        },
        success: (s) async {
          if (s == true) {
            await conferenceController.videoGetMethod();
            Get.to(
              VideoConferencePage(
                conferenceID: joinMeetingController.enterCode.text,
                userId: userId.toString(),
                userName: userName.toString(),
              ),
            );
          }
        });
  }
}
