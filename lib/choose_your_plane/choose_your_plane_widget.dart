import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';

import '../common_file/winngoo_widgets/winngoo_text.dart';

Widget choosePlaneWidget() {
  return SingleChildScrollView(
    child: Column(
      children: [
        for (var i in chooseYourPlaneConroller.planeDetails) ...[
          planeCard(
            spec: i["spec"],
            amount: i["amount"],
            onPressed: () {
              Get.toNamed("/summary");
            },
          )
        ]
      ],
    ),
  );
}

Widget planeCard({
  required dynamic amount,
  required void Function()? onPressed,
  required List spec,
  // required String title,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: WinngooBox(
        width: MediaQuery.sizeOf(Get.context!).width * 0.7,
        height: MediaQuery.sizeOf(Get.context!).height * 0.6,
        radius: 20,
        fillColor: CupertinoColors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WinngooText(
                      text: "Free",
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    WinngooText(
                      text: "\$${amount}/Mo",
                      weight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ],
                ),
              )),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var i in spec) ...[
                        iconTextModel(content: i),
                      ]
                    ],
                  )),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    width: MediaQuery.sizeOf(Get.context!).width * 0.5,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Rectangular border radius
                            ),
                            backgroundColor: Colors.grey),
                        onPressed: onPressed,
                        child: WinngooText(
                          text: "BUY NOW",
                          color: Colors.white,
                        )),
                  ),
                ),
              )
            ],
          ),
        )),
  );
}

Widget iconTextModel({required String content}) {
  return Row(
    children: [
      const Icon(
        Icons.check_circle,
        color: Colors.white,
        size: 20,
      ),
      const SizedBox(
        width: 5,
      ),
      WinngooText(
        text: content,
        color: Colors.white,
      )
    ],
  );
}
