import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/widgets.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../common_file/getXcontroller.dart';
import '../conferenceUI/vedioConferenceScreen.dart';

Widget joinMeetingWidget({required BuildContext contex}) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.00),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 40,
          ),
          textField(
              heading: 'Enter your meeting code',
              controller: joinMeetingController.enterCode,
              label: "Enter your code",
              hint: "",
              context: contex,
              validate: (s) {
                return null;
              }),
          const SizedBox(
            height: 30,
          ),
          buttonWidget(
              onPress: () {
                Get.to(
                  VideoConferencePage(
                    conferenceID: joinMeetingController.enterCode.text,
                    userId: "sathish",
                    userName: "kumar",
                  ),
                );
              },
              text: "Join"),
        ],
      ),
    ),
  );
}
