import 'package:flutter/material.dart';
import 'package:winggoo/common_file/functions.dart';

import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';

Widget forgotPasswordWidget({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FORGOT PASSWORD",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: headingSize),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Enter you email ID to associated with your account",
          style: TextStyle(fontSize: contentSize),
        ),
        const SizedBox(
          height: 10,
        ),
        textField(
            context: context,
            label: "Enter your email id",
            hint: "",
            prefixIcon: const Icon(
              Icons.mail,
              color: Colors.grey,
            ),
            validate: (value) {
              if (value == null || value.isEmpty) {
                return "*This field is required";
              } else {
                return null;
              }
            },
            controller: forgotPasswordController.mailController,
            focusNode: forgotPasswordController.emailFocusNode,
            onFieldSubmited: (val) {}),
        const SizedBox(
          height: 90,
        ),
      ],
    ),
  );
}
