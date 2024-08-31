import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';

Widget selector() {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      width: MediaQuery.sizeOf(Get.context!).width,
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(Get.context!).width,
            child: Container(
              decoration: BoxDecoration(
                color: sheduleButtonColor,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Date",
                    style:
                        TextStyle(color: Colors.white, fontSize: headingSize),
                  ),
                  Text(
                    "Time",
                    style:
                        TextStyle(color: Colors.white, fontSize: headingSize),
                  ),
                ],
              ),
            ),
          )),
    ),
  );
}

Widget sheduleDateTimetWidget() {
  // final dynamic picker;
  return Obx(
    () => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          headingWidget(title: "Select your date"),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff5669FF), width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2026),
                onDateChanged: (s) {
                  print(s);
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          headingWidget(title: "Select your time"),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallBoxWidget(
                    ontab: () {
                      timePicker();
                    },
                    controller:
                        sheduleDateTimeController.hours.value.toString(),
                    lable: "HH"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ":",
                    style: TextStyle(
                        fontSize: headingSize, fontWeight: FontWeight.w800),
                  ),
                ),
                smallBoxWidget(
                    ontab: () {
                      timePicker();
                    },
                    controller: sheduleDateTimeController.minutes.value,
                    lable: "MM"),
                Center(
                    child: Text(
                  sheduleDateTimeController.day.value,
                  style: TextStyle(fontSize: contentSize),
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          buttonWidget(onPress: () {}, text: "NEXT"),
        ],
      ),
    ),
  );
}

Widget smallBoxWidget({required void Function()? ontab, lable, controller}) {
  return GestureDetector(
    onTap: ontab,
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

timePicker() async {
  final TimeOfDay? picked = await showTimePicker(
    context: Get.context!,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null) {
    final now = DateTime.now();
    final dt =
        DateTime(now.year, now.month, now.day, picked.hour, picked.minute);

    var time = DateFormat('HH:mm');

    var formated = time.format(dt);
    // sheduleDateTimeController.hours.value = time.split(":")[0];

    // sheduleDateTimeController.minutes.value =
    //     time.split(":")[1].substring(0, 2);
    //
    // sheduleDateTimeController.day.value = time.split(":")[1].substring(2, 5);

    addEventController.eventTimeController.text = formated;
    print('event Time ${formated}');
  }
}
