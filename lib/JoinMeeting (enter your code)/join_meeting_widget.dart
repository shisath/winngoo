import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/widgets.dart';
import '../common_file/getXcontroller.dart';
import '../conferenceUI/vedioConferenceScreen.dart';

Widget joinMeetingWidget({required BuildContext contex}) {
  final GlobalKey<FormState> codeKey = GlobalKey<FormState>();
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.00),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 40,
          ),
          Form(
            key: codeKey,
            child: textField(
                heading: 'Enter your meeting code',
                controller: joinMeetingController.enterCode,
                label: "Enter your code",
                hint: "",
                context: contex,
                validate: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => buttonWidget(
                isLoading: joinMeetingController.loader.value,
                onPress: () async {
                  // Get.to(
                  //   VideoConferencePage(
                  //     conferenceID: joinMeetingController.enterCode.text,
                  //     userId: "sathish",
                  //     userName: "kumar",
                  //   ),
                  // );

                  if (codeKey.currentState?.validate() == true) {
                    joinMeetingController.meetingCodeValidation();
                  }
                },
                text: "Join"),
          ),
        ],
      ),
    ),
  );
}
