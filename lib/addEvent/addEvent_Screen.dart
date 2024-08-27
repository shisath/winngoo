import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../common_file/functions.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_drawer.dart';
import 'addEvent_Widget.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      addEventController.refreshLoader.value = true;
      addEventController.eventListApi();
      addEventController.getRandomImage();
      addEventController.refreshLoader.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //
    //   // addEventController.cleaner();
    //   // addEventController.eventListApi();
    //   // addEventController.getRandomImage();
    //
    // });

    return Obx(
      () => Scaffold(
        floatingActionButton: buttonWidget(
            onPress: () async {
              if (addEventController.selectedId.isNotEmpty &&
                  addEventController.isSelectedEvent.isNotEmpty) {
                await chooseYourPlaneController.planeApi();
              } else {
                snackBar(msg: "Please select an event", isBadReqested: true);
              }
            },
            text: "NEXT",
            isLoading: chooseYourPlaneController.loader.value),
        appBar: buildAppBar(),
        endDrawer: const CustomeDrawer(),
        body: Obx(
          () => addEventController.refreshLoader.value
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingContainer(
                      context: context,
                      widget: Stack(
                        children: [
                          Center(child: Image.asset(celebrationPng)),
                        ],
                      ),
                    ),
                    recommendWidget(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: WinngooText(
                            text: "Your events",
                            fontSize: headingSize,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    yourEventWidget(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  ],
                ),
        ),
      ),
    );
  }
}
