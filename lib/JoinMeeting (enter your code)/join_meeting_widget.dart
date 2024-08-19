import 'package:flutter/material.dart';
import 'package:winggoo/common_file/widgets.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

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
              heading: 'Enter Your Code',
              controller: joinMeetingController.enterCode,
              label: "Enter your code",
              hint: "",
              context: contex,
              validate: (Sg) {}),
          const SizedBox(
            height: 20,
          ),
          const WinngooText(
            text: "OR",
          ),
          textField(
              heading: 'Enter Your Link',
              controller: joinMeetingController.enterCode,
              label: "Enter your Link",
              hint: "",
              context: contex,
              validate: (Stng) {
                return null;
              }),
          const SizedBox(
            height: 30,
          ),
          buttonWidget(
              onPress: () {
                // Get.toNamed("/addEventScreen");
              },
              text: "Join"),
        ],
      ),
    ),
  );
}
