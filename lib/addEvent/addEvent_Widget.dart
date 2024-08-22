import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
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
                    addEventController.eventNameController.text = "";
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
                children:
                    List.generate(addEventController.recomeded.length, (index) {
                  final a = addEventController.recomeded[index];

                  return circleAvatarWidget(png: a["image"], index: index);
                }))),
      ],
    ),
  );
}

Widget yourEventWidget() {
  return Obx(
    () => Expanded(
      child: addEventController.eventListApiData.value.data == null
          ? const Center(
              child: WinngooText(
                text: "No Events Available",
                color: Colors.black,
                // weight: FontWeight.w600,
              ),
            )
          : ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                  addEventController.eventListApiData.value.data!.length,
                  (index) {
                // dynamic i =
                //     addEventController.eventListApiData.value.s![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: eventListboxModel(
                      index: index,
                      image: winngooLogo,
                      isPaid: true,
                      title: addEventController
                          .eventListApiData.value.data![index].name
                          .toString(),
                      date: addEventController
                          .eventListApiData.value.data![index].date
                          .toString()),
                );
              })),
    ),
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
        // addEventController.eventListApi();
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
                  Container(
                    // width: 150, // Diameter of the circle
                    // height: 150, // Diameter of the circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: addEventController.isSelectedEvent.value == index
                            ? const Color(0xff5669FF)
                            : Colors.black54,
                        // Outline color
                        width: 2, // Outline width
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Image.asset(
                          addEventController.randomImage.value,
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        ),
                      ),
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
                  IconButton(
                      onPressed: () async {
                        await Share.share('All most done!');
                      },
                      icon: const Icon(Icons.share))
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
          addEventController.eventNameController.text =
              addEventController.recomeded[index]["title"].toString();
          dialogBox(type: "add event");
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: addEventController.isSelected.value == index ? 3 : 1,
                  color: addEventController.isSelected.value == index
                      ? const Color(0xff5669FF)
                      : Colors.grey.withOpacity(0.5)),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: CircleAvatar(
            radius: 30,
            child: ClipOval(
              child: Image.asset(
                png,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
