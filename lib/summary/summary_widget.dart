import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

Widget summaryWidget() {
  return WinngooBox(
    width: MediaQuery.sizeOf(Get.context!).width * 10,
    borderColor: Colors.grey,
    radius: 10,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          summaryRowModel(keyText: "Event name", valueText: "Birthday event"),
          summaryRowModel(keyText: "Date", valueText: "02/02/2024"),
          summaryRowModel(keyText: "Time", valueText: "7.00 AM"),
          summaryRowModel(keyText: "No. of people", valueText: "5"),
        ],
      ),
    ),
  );
}

Widget planeSummaryWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      WinngooText(
        text: "Plane Details",
        weight: FontWeight.w600,
      ),
      const SizedBox(
        height: 10,
      ),
      summaryRowModel(keyText: "Plane name", valueText: "Birthday event"),
      summaryRowModel(keyText: "Date", valueText: "02/02/2024"),
      summaryRowModel(keyText: "Time", valueText: "7.00 AM"),
      summaryRowModel(keyText: "No. of people", valueText: "05"),
    ],
  );
}

///common widget
Widget summaryRowModel({
  required String keyText,
  required String valueText,
  color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WinngooText(
          text: keyText,
          color: color ?? Colors.black,
        ).w(130),
        SizedBox(
          width: MediaQuery.sizeOf(Get.context!).width * 0.1,
        ),
        Flexible(
            child: WinngooText(
          text: valueText,
          color: color ?? Colors.black,
        )),
      ],
    ),
  );
}
