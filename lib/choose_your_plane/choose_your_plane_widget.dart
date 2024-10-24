import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/choose_your_plane/choose_your_plane_controller.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';

import '../common_file/getXcontroller.dart ';
import '../common_file/winngoo_widgets/winngoo_text.dart';

final chooseYourPlaneConroller = Get.find<ChooseYourPlaneController>();

Widget choosePlaneWidget() {
  return SingleChildScrollView(
    child: Obx(
      () => chooseYourPlaneConroller.planeApiData.value.data == null
          ? const Align(
              alignment: Alignment.center,
              child: WinngooText(
                text: "No plane Available",
                color: Colors.black,
                // weight: FontWeight.w600,
              ),
            )
          : SizedBox(
              height: MediaQuery.sizeOf(Get.context!).height * 0.7,
              width: MediaQuery.sizeOf(Get.context!).width * 0.9,
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                      chooseYourPlaneConroller.planeApiData.value.data!.length,
                      (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: planeCard(
                        index: index,
                        widget: Column(
                          children: [
                            iconTextModel(content: "HD Vedio Call"),
                            iconTextModel(
                              content: "Screen Sharing",
                            ),
                            iconTextModel(
                              content: "Unlimited chatting",
                            ),
                            iconTextModel(content: "Infinite Messaging"),
                            iconTextModel(
                              content:
                                  "Up to ${chooseYourPlaneConroller.planeApiData.value.data![index].maxQuantity.toString()} Participants",
                            ),
                            iconTextModel(
                              content: "Unlimited call durations",
                            ),
                          ],
                        ),
                        amount: chooseYourPlaneConroller
                            .planeApiData.value.data![index].price
                            .toString(),
                        onPressed: () {
                          chooseYourPlaneConroller.selectedPlane.value =
                              chooseYourPlaneConroller
                                  .planeApiData.value.data![index].id
                                  .toString();
                          localStorage.write('selectedPlaneId',
                              chooseYourPlaneConroller.selectedPlane.value);

                          summaryController.eventApi();
                          chooseYourPlaneConroller.toggleLoader(
                              index, summaryController.loader.value);
                        },
                      ),
                    );
                  })),
            ),
    ),
  );
}

Widget planeCard(
    {required dynamic amount,
    required void Function()? onPressed,
    required Widget widget,
    required int index

    // required String title,
    }) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: WinngooBox(
        width: MediaQuery.sizeOf(Get.context!).width * 0.7,
        // height: MediaQuery.sizeOf(Get.context!).height,
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WinngooText(
                      text: " Premium",
                      weight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: headingSize,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    WinngooText(
                      text: " \$$amount/Yr",
                      weight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    widget
                  ],
                ),
              ),
              Obx(
                () => Center(
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
                          child: (chooseYourPlaneConroller.loaders.isNotEmpty &&
                                  index <
                                      chooseYourPlaneConroller.loaders.length)
                              ? chooseYourPlaneConroller.loaders[index]
                                  ? SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                        strokeWidth: 3.0,
                                        // color: Colors.red,
                                      ))
                                  : WinngooText(
                                      text: "BUY NOW",
                                      color: Colors.white,
                                    )
                              : WinngooText(
                                  text: "BUY NOW",
                                  color: Colors.white,
                                ),
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
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: WinngooText(
            text: content,
            align: TextAlign.start,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
