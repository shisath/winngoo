import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../signIn/signIn_screen.dart';
import 'functions.dart';

Widget titleBoxCard(
    {required String text, required IconData icon, required ontab}) {
  return GestureDetector(
    onTap: ontab,
    child: Container(
      height: 210,
      width: MediaQuery.sizeOf(Get.context!).width * 0.7,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 8,
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget doctorListCard(
    {required String text, required IconData icon, required ontab}) {
  return GestureDetector(
    onTap: ontab,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 300,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 8,
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.indigo[600],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
              child: Text(
                textAlign: TextAlign.center,
                text,
                style: TextStyle(
                    fontSize: contentSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.black.withOpacity(0.8)),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

AppBar appbar({screens}) {
  return AppBar(
    backgroundColor: primaryColor,
    leading: handleGestureAction(screens: screens),
    centerTitle: true,
    title: Text(
      screens,
      style: TextStyle(
          fontSize: headingSize,
          color: Colors.white,
          fontWeight: FontWeight.w500),
    ),
    actions: const [
      Icon(
        Icons.notification_add,
        color: Colors.white,
        size: 30,
      ),
      SizedBox(
        width: 10,
      )
    ],
  );
}

/// Appbar leading button
handleGestureAction({screens}) {
  switch (screens) {
    case 'Dashboard':
      return GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      );

    default:
      return GestureDetector(
        onTap: () {
          // patientDetailsController.onClose();

          Get.back();
        },
        child: const Icon(
          Icons.navigate_before_outlined,
          color: Colors.white,
          size: 30,
        ),
      );
  }
}

Widget buttonWidget(
    {required void Function() onPress, required String text, buttonTextSize}) {
  return Center(
    child: SizedBox(
      width: 300,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(16), // Rectangular border radius
            ),
            backgroundColor: primaryColor),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: contentSize),
            ),
            CircleAvatar(
              backgroundColor: secondarycolor,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

/// commonText field
Widget textField(
    {required TextEditingController controller,
    required String label,
    required String hint,
    required Widget prefixIcon,
    required String? Function(String?) validate,
    focusNode,
    suffixIcon,
    obscureText,
    void Function()? ontab,
    required void Function(String) onFieldSubmited,
    key}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: TextFormField(
      obscureText: obscureText ?? false,
      onTap: ontab,
      focusNode: focusNode,
      maxLength: getInputSettings(type: label)["maxLength"],
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          hintText: hint,
          errorBorder: outlineInputBorder(color: Colors.red),
          focusedErrorBorder: outlineInputBorder(color: Colors.red),
          enabledBorder: outlineInputBorder(color: Colors.grey),
          focusedBorder: outlineInputBorder(color: Color(0xff5669FF)),
          counterText: "",
          prefix: label == "Phone Number" ? const Text("91+ ") : null),
      validator: validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: getInputSettings(type: label)["keyboardType"],
      inputFormatters: getInputSettings(type: label)["inputFormatters"],
      onFieldSubmitted: onFieldSubmited,
    ),
  );
}

Widget textFieldSmall(
  Function(String) onChange, {
  required TextEditingController controller,
  required String label,
  required double h,
  required double w,
  required String? Function(String?) validate,
  required void Function(String) onFieldSubmited,
  required void Function() ontab,
  required FocusNode focusNode,
}) {
  return SizedBox(
    height: h,
    width: w,
    child: TextFormField(
      style: TextStyle(fontSize: contentSize),
      focusNode: focusNode,
      textAlign: TextAlign.center,
      maxLength: getInputSettings(type: label)["maxLength"],
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        errorBorder: outlineInputBorder(color: Colors.red),
        focusedErrorBorder: outlineInputBorder(color: Colors.red),
        enabledBorder: outlineInputBorder(color: Colors.blue),
        focusedBorder: outlineInputBorder(color: Colors.green),
        counterText: "",
      ),
      validator: validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChange,
      keyboardType: getInputSettings(type: label)["keyboardType"],
      inputFormatters: getInputSettings(type: label)["inputFormatters"],
      onFieldSubmitted: onFieldSubmited,
      onTap: ontab,
    ),
  );
}

OutlineInputBorder outlineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 2.0),
    borderRadius: BorderRadius.circular(10.0),
  );
}

Widget togleButton({
  required dynamic controller,
  required String headingText,
  required void Function(bool) onchanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Transform.scale(
        alignment: Alignment.centerLeft,
        scale: 0.8,
        child: Switch(
          value: controller,
          onChanged: onchanged,
        ),
      ),
      Text(
        headingText,
        style: TextStyle(fontSize: contentSize - 3),
      ),
    ],
  );
}

Widget headingContainer({
  required Widget widget,
  height,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(60),
        bottomLeft: Radius.circular(60),
      ),
      color: primaryColor,
    ),
    height: height ?? MediaQuery.sizeOf(Get.context!).height * 0.3,
    width: MediaQuery.sizeOf(Get.context!).width,
    child: widget,
  );
}

Widget headingWidget({required String title, align, color}) {
  return Align(
    alignment: align ?? Alignment.centerLeft,
    child: Text(
      title,
      style: TextStyle(
          color: color ?? primaryColor,
          fontSize: headingSize - 3,
          fontWeight: FontWeight.w700),
    ),
  );
}

Widget smallBoxWidget({required void Function()? ontap, lable, controller}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
          child: Text(
        controller.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: contentSize),
      )),
    ),
  );
}
