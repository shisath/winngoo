import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../common_file/functions.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_drawer.dart';
import 'addEvent_Widget.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buttonWidget(
        onPress: () {
          Get.toNamed("/chooseYourPlane");
        },
        text: "Next",
      ),
      appBar: buildAppBar(),
      endDrawer: const CustomeDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingContainer(
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
                  weight: FontWeight.w500,
                ),
              ),
            ],
          ),
          yourEventWidget(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        ],
      ),
    );
  }
}
