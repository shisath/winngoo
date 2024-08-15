import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';

otpWidget() {
  return Obx(
    () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Verification",
          style: TextStyle(fontSize: headingSize),
        ),
        Text(
          "We’ve send you the verification code\non +91 770834 49632",
          style: TextStyle(fontSize: contentSize),
        ),
        const SizedBox(
          height: 50,
        ),
        PinCodeTextField(
          onChanged: (a) {},
          appContext: Get.context!,
          animationDuration: const Duration(milliseconds: 300),
          pinTheme: PinTheme(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              shape: PinCodeFieldShape.box,
              fieldHeight: 60,
              fieldWidth: 60,
              disabledColor: Colors.grey,
              selectedColor: primaryColor,
              selectedFillColor: primaryColor?.withOpacity(0.5),
              activeColor: primaryColor,
              activeFillColor: primaryColor!.withOpacity(0.9)),
          length: 4,
        ),
        const SizedBox(
          height: 30,
        ),
        buttonWidget(
            onPress: () {
              Get.toNamed("/enterNewPassword");

              // Get.toNamed('/homeScreen');
            },
            text: "CONTINUE"),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: otpController.countdown.value >= 30
                ? richText(
                        text1: "Don't receive the OTP?",
                        text2: " RESEND",
                        color2: primaryColor)
                    .onTap(() {
                    otpController.startTimer();
                  })
                : richText(
                    text1: 'Re-send code in',
                    text2:
                        " 0:${otpController.countdown.value.length == 1 ? "0${otpController.countdown.value}" : otpController.countdown.value}"))
      ],
    ),
  );
}

Widget richText(
    {required String text1, required String text2, color1, color2}) {
  return RichText(
      text: TextSpan(
    children: [
      TextSpan(
        text: text1,
        style: TextStyle(color: Colors.black, fontSize: contentSize),
      ),
      TextSpan(
        text: text2,
        style: TextStyle(color: primaryColor, fontSize: contentSize),
      ),
    ],
  ));
}

Widget pngButton({
  png,
  required String text,
  required void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        png,
        Text(
          text,
          style: TextStyle(fontSize: contentSize),
        )
      ],
    ),
  );
}
