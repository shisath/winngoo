import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

Widget summaryWidget() {
  return Obx(
    () => WinngooBox(
      width: MediaQuery.sizeOf(Get.context!).width * 10,
      borderColor: Colors.grey,
      radius: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            summaryRowModel(
                keyText: "Event name",
                valueText:
                    summaryController.eventApiData.value.data?.name ?? ""),
            summaryRowModel(
                keyText: "Date",
                valueText:
                    summaryController.eventApiData.value.data?.date ?? ""),
            summaryRowModel(
                keyText: "Time",
                valueText:
                    summaryController.eventApiData.value.data?.time ?? ""),
          ],
        ),
      ),
    ),
  );
}

Widget planeSummaryWidget() {
  return Obx(
    () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WinngooText(
          text: "Plane Details",
          weight: FontWeight.w600,
        ),
        const SizedBox(
          height: 10,
        ),
        summaryRowModel(keyText: "Plane name", valueText: "PREMIUM"),
        summaryRowModel(
            keyText: "No of person",
            valueText:
                "${summaryController.priceApiData.value.data?.minQuantity ?? ""} - ${summaryController.priceApiData.value.data!.maxQuantity ?? ""} "),
        summaryRowModel(
            keyText: "Amount",
            valueText:
                "\$ ${summaryController.priceApiData.value.data?.price ?? " "}"),
        summaryRowModel(
            keyText: "VAT",
            valueText:
                "\$ ${summaryController.priceApiData.value.data?.vat ?? " "}"),
        const Divider(),
        summaryRowModel(
            keyText: "TOTAL AMOUNT",
            valueText:
                "\$ ${summaryController.priceApiData.value.data?.priceWithVat ?? ""}",
            weight: true,
            valColor: Colors.blueAccent,
            keyColor: Colors.blueAccent),
      ],
    ),
  );
}

///common widget
Widget summaryRowModel({
  required String keyText,
  required String valueText,
  weight = false,
  keyColor,
  valColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WinngooText(
          text: keyText,
          color: keyColor ?? Colors.black,
          weight: weight ? FontWeight.bold : FontWeight.w500,
        ).w(130),
        SizedBox(
          width: MediaQuery.sizeOf(Get.context!).width * 0.1,
        ),
        Flexible(
            child: WinngooText(
          text: valueText,
          color: valColor ?? Colors.black,
          weight: weight ? FontWeight.bold : FontWeight.w500,
        )),
      ],
    ),
  );
}
