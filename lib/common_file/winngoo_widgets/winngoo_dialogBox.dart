import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../../shedule_date_time/shedule_date_time_widget.dart';
import '../getXcontroller.dart';
import '../widgets.dart';

Future dialogBox() {
  return showModalBottomSheet(
    context: Get.context!,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: WinngooBox(
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                WinngooText(
                  text: "Create Event",
                  weight: FontWeight.w600,
                  fontSize: headingSize,
                ),
                const SizedBox(
                  height: 10,
                ),
                textField(
                    label: "Enter event name",
                    hint: " ",
                    prefixIcon: const Icon(
                      Icons.celebration,
                      color: Colors.grey,
                    ),
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        return null;
                      }
                    },
                    controller: addEventController.eventNameController,
                    focusNode: addEventController.eventNameFocusNode,
                    onFieldSubmited: (val) {
                      FocusScope.of(Get.context!)
                          .requestFocus(addEventController.eventDateFocusNode);
                    }),
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDialog(
                        context: Get.context!,
                        builder: (BuildContext context) {
                          return DatePickerDialog(
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2026),
                            onDatePickerModeChange: (s) {
                              print("sk done ${s}");
                              // Navigator.of(context).pop();
                            },
                          );
                        });

                    DateFormat format = DateFormat("dd/mm/yyyy");
                    DateTime? finalDate = selectedDate?.toLocal();
                    addEventController.eventDateController.text =
                        DateFormat('dd/MM/yyyy').format(finalDate!);
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: textField(
                      controller: addEventController.eventDateController,
                      label: 'Enter event date',
                      validate: (String) {},
                      onFieldSubmited: (String) {},
                      ontab: () {},
                      focusNode: addEventController.eventDateFocusNode,
                      hint: '',
                      prefixIcon: Icon(Icons.date_range_outlined),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    timePicker();
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: textField(
                      controller: addEventController.eventTimeController,
                      label: 'Enter event time',
                      validate: (String) {},
                      onFieldSubmited: (String) {},
                      ontab: () {},
                      focusNode: addEventController.eventTimeFocusNode,
                      hint: '',
                      prefixIcon: const Icon(Icons.access_time),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: AbsorbPointer(
                    absorbing: true,
                    child: textField(
                      controller: addEventController.eventImageController,
                      label: 'Upload Image',
                      validate: (String) {},
                      onFieldSubmited: (String) {},
                      ontab: () {},
                      focusNode: addEventController.eventImageFocusNode,
                      hint: '',
                      prefixIcon: const Icon(Icons.upload_sharp),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: buttonWidget(
                        onPress: () {
                          Navigator.of(context).pop();
                        },
                        text: "Done")),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
