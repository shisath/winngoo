import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';

Widget addEventWidget() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              primary: false,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 2),
              itemBuilder: (BuildContext context, int index) {
                final list = addEventController.addEvent[index];

                return circleAvatarWidget(
                  index: index,
                  text: list["title"],
                  png: Image.asset(googlePng),
                );
              },
              itemCount: addEventController.addEvent.length,
            );
          },
        ),
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
  required String text,
  required Image png,
  required int index,
}) {
  return Obx(
    () => GestureDetector(
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
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                child: png,
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
