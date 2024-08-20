import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/choose_your_plane/choose_your_plane_controller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';

import '../common_file/winngoo_widgets/winngoo_text.dart';

final chooseYourPlaneConroller = Get.find<ChooseYourPlaneController>();

Widget choosePlaneWidget() {
  return SingleChildScrollView(
    child: Obx(
      () => chooseYourPlaneConroller.planeApiData.value.data == null
          ? const Center(
              child: WinngooText(
                text: "No plane Available",
                color: Colors.black,
                // weight: FontWeight.w600,
              ),
            )
          : SizedBox(
              height: MediaQuery.sizeOf(Get.context!).height,
              width: MediaQuery.sizeOf(Get.context!).width * 0.8,
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                      chooseYourPlaneConroller.planeApiData.value.data!.length,
                      (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: planeCard(
                        widget: Column(
                          children: [
                            iconTextModel(
                              content:
                                  "No. of persons  ${chooseYourPlaneConroller.planeApiData.value.data![index].minQuantity.toString()} - ${chooseYourPlaneConroller.planeApiData.value.data![index].maxQuantity.toString()} ",
                            ),
                            iconTextModel(
                              content: "Unlimited chatting",
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
                          Get.toNamed("/summary");
                        },
                      ),
                    );
                  })),
            ),
    ),
  );
}

// Widget choosePlaneWidgets() {
//   return SingleChildScrollView(
//     child: Obx(
//       () => Column(
//         children: [
//           for (var i
//               in chooseYourPlaneConroller.planeApiData.value.data ?? []) ...[
//             planeCard(widget:  iconTextModel(content: "" ),
//                amount: i["amount"],
//               onPressed: () {
//                 Get.toNamed("/summary");
//               },
//             )
//           ]
//         ],
//       ),
//     ),
//   );
// }

Widget planeCard(
    {required dynamic amount,
    required void Function()? onPressed,
    required Widget widget
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
                    const WinngooText(
                      text: "Premium",
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    WinngooText(
                      text: "\$$amount/Yr",
                      weight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    widget
                  ],
                ),
              ),

              // Expanded(
              //     flex: 3,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         for (var i in spec) ...[
              //           iconTextModel(content: i),
              //         ]
              //       ],
              //     )),
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
                        child: const WinngooText(
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
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
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
    ),
  );
}
