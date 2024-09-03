import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                              lastDate: DateTime(2030),
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
                        label: 'Select event date',
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
                        label: 'Select event time',
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
                              addEventController.cleaner();
                              Navigator.of(context).pop();
                            },
                            text: "SUBMIT")),
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
        // final debitCardKey = GlobalKey<FormState>();

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
                      heading: "Card Holder Name",
                      keyboardType: TextInputType.name,
                      headingSize: contentSize,
                      label: " ",
                      hint: " ",
                      suffixIcon: const Icon(
                        Icons.credit_card_sharp,
                        color: Colors.grey,
                      ),
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        } else {
                          return null;
                        }
                      },
                      controller: paymentController.cdCardHolderName,
                      focusNode: paymentController.cdCardHolderfocusNode,
                      onFieldSubmited: (val) {
                        FocusScope.of(Get.context!).requestFocus(
                            paymentController.validityDatefocusNode);
                      }),
                  textField(
                      keyboardType: TextInputType.number,
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
                          return "This field is required";
                        }
                        // else if (value.length <= 12 && value.length >= 19) {
                        //   return "Enter valid number";
                        // }
                        else {
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
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? selectedDate = await showDialog(
                                context: Get.context!,
                                builder: (BuildContext context) {
                                  return DatePickerDialog(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                    onDatePickerModeChange: (s) {
                                      // Navigator.of(context).pop();
                                    },
                                  );
                                });

                            DateTime? finalDate = selectedDate?.toLocal();

                            paymentController.validityDate.text =
                                DateFormat('MM-yyyy').format(finalDate!);
                          },
                          child: AbsorbPointer(
                            absorbing: true,
                            child: textField(
                                keyboardType: TextInputType.number,
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
                                    return "This field is required";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: paymentController.validityDate,
                                focusNode:
                                    paymentController.validityDatefocusNode,
                                onFieldSubmited: (val) {
                                  // FocusScope.of(Get.context!)
                                  //     .requestFocus(paymentController.ccvfocusNode);
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: textField(
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          context: context,
                          heading: "CVV",
                          headingSize: contentSize,
                          label: "235****",
                          hint: "",
                          suffixIcon: const Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          ),
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            } else {
                              return null;
                            }
                          },
                          controller: paymentController.cvv,
                          focusNode: paymentController.ccvfocusNode,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Center(
                        child: buttonWidget(
                            isLoading:
                                paymentController.makePaymentLoader.value,
                            onPress: () {
                              paymentController.validation();

                              // if (debitCardKey.currentState?.validate() == true) {
                              //    paymentController.makePaymentApi();
                              // }
                            },
                            text: "PAY NOW")),
                  ),
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
  final couponKey = GlobalKey<FormState>();

  // final GetStorage localStorage = GetStorage();
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      if (type == "coupon") {
        return Dialog(
          child: WinngooBox(
            height: 350,
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
                  const WinngooText(text: "Enter Your Coupon Code"),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: couponKey,
                    child: textFieldSmall(
                      onFieldSubmited: (s) {},
                      h: 70,
                      w: 150,
                      ontab: () {},
                      focusNode: paymentController.focusNode,
                      controller: paymentController.couponCode,
                      label: '',
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "*This field is required";
                        } else {
                          return null;
                        }
                      },
                      (p0) {},
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  buttonWidgetSmall(
                      width: 100.00,
                      height: 30.00,
                      onPress: () {
                        if (couponKey.currentState?.validate() == true) {
                          paymentController.discountApply();
                          paymentController.couponCode.text = "";
                          Navigator.of(context).pop();
                        }
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
                  const WinngooText(text: "Are you sure you want to log out?"),
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

                              profileController.logOut();
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
                    text: "Choose Your Profile Image Source",
                    fontSize: headingSize,
                    align: TextAlign.center,
                    weight: FontWeight.w600,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // buttonWidgetSmall(
                        //     buttonTextSize: contentSize - 2,
                        //     width: 100.00,
                        //     height: 30.00,
                        //     onPress: () async {
                        //       // profileController.getProfilePicture();
                        //       Navigator.of(context).pop();
                        //       await profileController.cameraPicker();
                        //     },
                        //     text: "Take a photo"),
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

                  ///text field
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
