import 'package:flutter/material.dart';
import 'package:winggoo/common_file/widgets.dart';

import '../common_file/getXcontroller.dart';

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
              onPress: () async {
                await joinMeetingController.meetingCodeValidation();
              },
              text: "Join"),
        ],
      ),
    ),
  );
}
