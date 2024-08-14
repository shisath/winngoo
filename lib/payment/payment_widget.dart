import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../common_file/winngoo_widgets/winngoo_dialogBox.dart';

Widget paymentWidget() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WinngooText(
          text: "Select your payment",
          weight: FontWeight.w600,
          fontSize: contentSize + 2,
        ),
        const SizedBox(
          height: 10,
        ),
        WinngooBox(
            width: MediaQuery.sizeOf(Get.context!).width,
            borderColor: Colors.orange,
            radius: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WinngooText(text: "Amount"),
                  WinngooText(text: "\$50.00"),
                  WinngooBox(
                    fillColor: primaryColor,
                    radius: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: WinngooText(
                        text: "Discount",
                        color: Colors.white,
                        fontSize: 15.00,
                      ),
                    ),
                  ).onTap(
                    () {
                      showDialogBox(type: "coupon");
                    },
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        paymentTypeCard(
            titleText: "UPI",
            subtitleText: "pay by any UPI app",
            color: Colors.grey.withOpacity(0.3),
            ontap: () {}),
        paymentTypeCard(
            titleText: "Credit / Debit / ATM card",
            subtitleText: "Add and secure cards as per RBI guidelines",
            color: Colors.pink.withOpacity(0.2),
            ontap: () {
              dialogBox(type: "credit Card");
            }),
        paymentTypeCard(
            titleText: "Net Banking",
            color: Colors.red.withOpacity(0.3),
            ontap: () {
              dialogBox(type: "net banking");
            }),
        const SizedBox(
          height: 50,
        )
      ],
    ),
  );
}

Widget paymentTypeCard(
    {required String titleText,
    subtitleText,
    required Color color,
    required void Function()? ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: WinngooBox(
          height: subtitleText != null ? null : 65,
          radius: 10,
          fillColor: color,
          width: MediaQuery.sizeOf(Get.context!).width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WinngooText(
                  text: titleText,
                  weight: FontWeight.w600,
                ),
                if (subtitleText != null) ...[
                  WinngooText(
                    text: subtitleText ?? "",
                    fontSize: 15.00,
                  ),
                ]
              ],
            ),
          )),
    ),
  );
}
