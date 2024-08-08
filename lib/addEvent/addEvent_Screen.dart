import 'package:flutter/material.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../common_file/functions.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';
import 'addEvent_Widget.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buttonWidget(onPress: () {}, text: "Next"),
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          GestureDetector(
            child: const Icon(Icons.menu),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingContainer(
              widget: Stack(children: [
            Center(child: Image.asset(celebrationPng)),
          ])),
          recommendWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: WinngooText(
              text: "Your events",
              fontSize: headingSize,
              weight: FontWeight.w500,
            ),
          ),
          yourEventWidget(),
          const SizedBox(
            height: 68,
          ),
        ],
      ),
    );
  }
}
