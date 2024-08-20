import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../../shedule_date_time/shedule_date_time_widget.dart';
import '../functions.dart';
import '../getXcontroller.dart';
import '../images.dart';
import '../widgets.dart';

Future dialogBox({required String type}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: Get.context!,
    builder: (BuildContext context) {
      if (type == "add event") {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          child: WinngooBox(
            // width: MediaQuery.sizeOf(Get.context!).width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WinngooText(
                    text: "Create Event",
                    weight: FontWeight.w600,
                    fontSize: headingSize,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                      context: context,
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
                        // FocusScope.of(Get.context!).requestFocus(
                        //     addEventController.eventDateFocusNode);
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
                                // Navigator.of(context).pop();
                              },
                            );
                          });

                      DateTime? finalDate = selectedDate?.toLocal();
                      addEventController.eventDateController.text =
                          DateFormat('yyyy-MM-dd').format(finalDate!);
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: textField(
                        context: context,
                        controller: addEventController.eventDateController,
                        label: 'Enter event date',
                        validate: (s) {
                          return null;
                        },
                        onFieldSubmited: (g) {},
                        ontab: () {},
                        focusNode: addEventController.eventDateFocusNode,
                        hint: '',
                        prefixIcon: const Icon(Icons.date_range_outlined),
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
                        context: context,
                        controller: addEventController.eventTimeController,
                        label: 'Enter event time',
                        validate: (g) {
                          return null;
                        },
                        onFieldSubmited: (g) {},
                        ontab: () {},
                        focusNode: addEventController.eventTimeFocusNode,
                        hint: '',
                        prefixIcon: const Icon(Icons.access_time),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Center(
                        child: buttonWidget(
                            isLoading: addEventController.loader.value,
                            onPress: () {
                              addEventController.createEventApi();
                            },
                            text: "Submit")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (type == "credit Card") {
        return Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          child: WinngooBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textField(
                      context: context,
                      heading: "Card number",
                      headingSize: contentSize,
                      label: "",
                      hint: " ",
                      suffixIcon: const Icon(
                        Icons.credit_card_sharp,
                        color: Colors.grey,
                      ),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter value";
                        } else {
                          return null;
                        }
                      },
                      controller: paymentController.cdCardNumber,
                      focusNode: paymentController.cdCardNumberfocusNode,
                      onFieldSubmited: (val) {
                        FocusScope.of(Get.context!).requestFocus(
                            paymentController.validityDatefocusNode);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: textField(
                            context: context,
                            heading: "Valid Thru",
                            headingSize: contentSize,
                            label: "MM/YYYY",
                            hint: "",
                            suffixIcon: const Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            ),
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter value";
                              } else {
                                return null;
                              }
                            },
                            controller: paymentController.validityDate,
                            focusNode: paymentController.validityDatefocusNode,
                            onFieldSubmited: (val) {
                              FocusScope.of(Get.context!)
                                  .requestFocus(paymentController.ccvfocusNode);
                            }),
                      ),
                      SizedBox(
                        height: 110,
                        width: 150,
                        child: textField(
                          context: context,
                          heading: "CCV",
                          headingSize: contentSize,
                          label: "235****",
                          hint: "",
                          suffixIcon: const Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          ),
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter value";
                            } else {
                              return null;
                            }
                          },
                          controller: paymentController.ccv,
                          focusNode: paymentController.ccvfocusNode,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: buttonWidget(
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          text: "PAY NOW")),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (type == "net banking") {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
              top: 20,
              left: 10,
              right: 10),
          child: WinngooBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WinngooText(
                    text: "Net banking",
                    weight: FontWeight.w600,
                    fontSize: headingSize,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                      context: context,
                      label: "Account no",
                      hint: " ",
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                      ),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter value";
                        } else {
                          return null;
                        }
                      },
                      controller: paymentController.accountNumber,
                      focusNode: paymentController.accountNumberfocusNode,
                      onFieldSubmited: (val) {
                        FocusScope.of(Get.context!)
                            .requestFocus(paymentController.ifscCodefocusNode);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                      context: context,
                      label: "IFSC Code",
                      hint: " ",
                      prefixIcon: const Icon(
                        Icons.vpn_key,
                        color: Colors.grey,
                      ),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter value";
                        } else {
                          return null;
                        }
                      },
                      controller: paymentController.ifscCode,
                      focusNode: paymentController.ifscCodefocusNode,
                      onFieldSubmited: (val) {
                        FocusScope.of(Get.context!).requestFocus(
                            paymentController.nBCardNumberfocusNode);
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    context: context,
                    label: "Card number",
                    hint: " ",
                    prefixIcon: const Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                    ),
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter value";
                      } else {
                        return null;
                      }
                    },
                    controller: paymentController.nBCardNumber,
                    focusNode: paymentController.nBCardNumberfocusNode,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: buttonWidget(
                          onPress: () {
                            Navigator.of(context).pop();
                          },
                          text: "OK")),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    },
  );
}

void showDialogBox({required String type}) {
  final GetStorage localStorage = GetStorage();
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      if (type == "coupon") {
        return Dialog(
          child: WinngooBox(
            height: 300,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    giftCoupon,
                    height: 150,
                    width: 150,
                  ),
                  WinngooText(text: "Enter Your Coupon Code"),
                  textFieldSmall(
                    onFieldSubmited: (s) {},
                    h: 45,
                    w: 150,
                    ontab: () {},
                    focusNode: paymentController.focusNode,
                    controller: paymentController.couponCode,
                    label: '',
                    validate: (t) {
                      return null;
                    },
                    (p0) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  buttonWidgetSmall(
                      width: 100.00,
                      height: 30.00,
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                      text: "APPLY")
                ],
              ),
            ),
          ),
        );
      } else if (type == "logout") {
        return Dialog(
          child: WinngooBox(
            height: 200,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WinngooText(
                    text: "Logout",
                    fontSize: headingSize,
                    weight: FontWeight.w600,
                  ),
                  WinngooText(text: "Are you sure you want to log out?"),
                  //

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonWidgetSmall(
                            buttonTextSize: contentSize - 2,
                            width: 100.00,
                            height: 30.00,
                            onPress: () {
                              Navigator.of(context).pop();
                            },
                            text: "Cancel"),
                        buttonWidgetSmall(
                            buttonTextSize: contentSize - 2,
                            width: 100.00,
                            height: 30.00,
                            onPress: () {
                              Navigator.of(context).pop();
                              localStorage.remove('api_token');
                              Get.offNamed("/signIn");
                            },
                            text: "Yes, Logout")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } else if (type == "galary") {
        return Dialog(
          child: WinngooBox(
            height: 200,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WinngooText(
                    text: "Choose your image",
                    fontSize: headingSize,
                    weight: FontWeight.w600,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonWidgetSmall(
                            buttonTextSize: contentSize - 2,
                            width: 100.00,
                            height: 30.00,
                            onPress: () async {
                              Navigator.of(context).pop();
                              await profileController.cameraPicker();
                            },
                            text: "Take a photo"),
                        buttonWidgetSmall(
                            buttonTextSize: contentSize - 2,
                            width: 100.00,
                            height: 30.00,
                            onPress: () async {
                              Navigator.of(context).pop();
                              await profileController.galleryPicker();
                            },
                            text: "Gallery")
                      ],
                    ),
                  ),
                  buttonWidgetSmall(
                      buttonTextSize: contentSize - 2,
                      width: 100.00,
                      height: 30.00,
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                      text: "Cancel"),
                ],
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    },
  );
}
