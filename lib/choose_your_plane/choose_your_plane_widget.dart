import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../common_file/getXcontroller.dart';

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
  }
}
