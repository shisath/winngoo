import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import '../common_file/widgets.dart';

Widget selector() {
  return Obx(
    () => Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ToggleButtons(
          isSelected: sheduleDateTimeController.seleted,
          onPressed: (int index) {},
          color: Colors.black,
          fillColor: sheduleButtonColor,
          selectedColor: sheduleButtonColor,
          borderRadius: BorderRadius.circular(30.0),
          borderColor: sheduleButtonColor,
          children: const <Widget>[
            Text(
              "                   DATE                ",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "               TIME                  ",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
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
  final now = DateTime.now();
  final format = DateFormat.jm();

  if (picked != null) {
    final dt =
        DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
    print(" sdsk ${format.format(dt)} ");

    var time = format.format(dt);
    sheduleDateTimeController.hours.value = time.split(":")[0];

    sheduleDateTimeController.minutes.value =
        time.split(":")[1].substring(0, 2);

    sheduleDateTimeController.day.value = time.split(":")[1].substring(2, 5);
    // print("sk$controller1");
  }
}
