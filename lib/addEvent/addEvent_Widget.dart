import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';

import '../common_file/getXcontroller.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_box.dart';
import '../common_file/winngoo_widgets/winngoo_text.dart';

Widget recommendWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WinngooText(
              text: "Recommend",
              fontSize: headingSize,
              weight: FontWeight.w500,
            ),
            buttonWidgetSmall(
                width: 150.00,
                height: 30.00,
                onPress: () {},
                text: "Add your event",
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 60,
            width: MediaQuery.sizeOf(Get.context!).width,
            child: ListView(
                scrollDirection: Axis.horizontal,
                // Set to horizontal for horizontal scrolling
                children: List.generate(8, (index) {
                  return circleAvatarWidget(
                      png: Image.asset(googlePng), index: 2);
                }))),
      ],
    ),
  );
}

Widget yourEventWidget() {
  return Expanded(
    child: ListView(scrollDirection: Axis.vertical, children: [
      for (var i in addEventController.eventList) ...[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: eventListbox(
              image: celebrationBg,
              date: i["date"] ?? "",
              isPaid: i["ispaid"] ?? true,
              title: i["title"] ?? ""),
        )
      ]
    ]),
  );
}

Widget eventListbox({
  required String image,
  required bool isPaid,
  required String title,
  required String date,
}) {
  return WinngooBox(
    width: MediaQuery.sizeOf(Get.context!).width,
    borderColor: Colors.grey,
    // height: 65,
    radius: 10,
    borderWidth: 1.0,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WinngooText(
                    text: title,
                  ),
                  WinngooText(
                    text: date,
                    fontSize: contentSize - 3,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: WinngooText(
              text: isPaid ? "Paid" : "UnPaid",
              color: isPaid ? Colors.green : Colors.red,
            ),
          )
        ],
      ),
    ),
  );
}

Widget addEventWidget() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        buttonWidget(
            onPress: () {
              Get.toNamed("/sheduleScreen");
            },
            text: "NEXT")
      ],
    ),
  );
}

circleAvatarWidget({
  required Image png,
  required int index,
}) {
  return Obx(
    () => Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          addEventController.isSelected.value = index;
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 3,
                  color: addEventController.isSelected.value == index
                      ? const Color(0xff5669FF)
                      : Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: CircleAvatar(
            radius: 30,
            child: png,
          ),
        ),
      ),
    ),
  );
}

// LayoutBuilder(
// builder: (context, constraints) {
// return GridView.builder(
// primary: false,
// shrinkWrap: true,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisSpacing: 4, crossAxisCount: 7),
// itemBuilder: (BuildContext context, int index) {
// final list = addEventController.addEvent[index];
//
// return circleAvatarWidget(
// index: index,
// png: Image.asset(
// googlePng,
// ),
// );
// },
// itemCount: addEventController.addEvent.length,
// );
// },
// ),
