import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';

import '../common_file/getXcontroller.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_box.dart';
import '../common_file/winngoo_widgets/winngoo_dialogBox.dart';
import '../common_file/winngoo_widgets/winngoo_text.dart';

Widget recommendWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
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
                  onPress: () {
                    dialogBox(type: "add event");
                  },
                  text: "Add your event",
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 21,
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 61,
            width: MediaQuery.sizeOf(Get.context!).width,
            child: ListView(
                scrollDirection: Axis.horizontal,
                // Set to horizontal for horizontal scrolling
                children: List.generate(8, (index) {
                  return circleAvatarWidget(png: winngooLogo, index: index);
                }))),
      ],
    ),
  );
}

Widget yourEventWidget() {
  return Expanded(
    child: addEventController.eventList.isEmpty
        ? const Center(
            child: WinngooText(
              text: "No Events Available",
              color: Colors.black,
              // weight: FontWeight.w600,
            ),
          )
        : ListView(
            scrollDirection: Axis.vertical,
            children:
                List.generate(addEventController.eventList.length, (index) {
              final i = addEventController.eventList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: eventListboxModel(
                    index: index,
                    image: winngooLogo,
                    date: i["date"] ?? "",
                    isPaid: i["ispaid"] ?? true,
                    title: i["title"] ?? ""),
              );
            })),
  );
}

Widget eventListboxModel({
  required String image,
  required bool isPaid,
  required String title,
  required String date,
  required int index,
}) {
  return Obx(
    () => GestureDetector(
      onTap: () {
        addEventController.isSelectedEvent.value = index;
        addEventController.isSelected.value = -1;
      },
      child: WinngooBox(
        width: MediaQuery.sizeOf(Get.context!).width,
        borderColor: addEventController.isSelectedEvent.value == index
            ? const Color(0xff5669FF)
            : Colors.grey,
        // height: 65,
        radius: 10,

        borderWidth:
            addEventController.isSelectedEvent.value == index ? 2.0 : 1.0,
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
  required String png,
  required int index,
}) {
  return Obx(
    () => Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          addEventController.isSelected.value = index;
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: addEventController.isSelected.value == index ? 3 : 1,
                  color: addEventController.isSelected.value == index
                      ? const Color(0xff5669FF)
                      : Colors.grey.withOpacity(0.5)),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Image.asset(png),
        ),
      ),
    ),
  );
}
