import 'package:flutter/material.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../common_file/functions.dart';
import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_drawer.dart';
import 'choose_your_plane_widget.dart';

class ChooseYourPlaneScreen extends StatefulWidget {
  const ChooseYourPlaneScreen({super.key});

  @override
  State<ChooseYourPlaneScreen> createState() => _ChooseYourPlaneScreenState();
}

class _ChooseYourPlaneScreenState extends State<ChooseYourPlaneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      endDrawer: const CustomeDrawer(),
      body: Stack(
        children: [
          Image.asset(
            ballonBg, // Path to your image
            fit: BoxFit.cover, // Adjust this as needed
          ),
          Column(
            children: [
              headingContainer(
                  context: context,
                  height: MediaQuery.sizeOf(context).height * 0.21,
                  widget: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              chooseYourPlanePng,
                              height: 120,
                            ),
                            WinngooText(
                              text: "Choose Your Plane",
                              color: Colors.white,
                              weight: FontWeight.w600,
                              fontSize: contentSize,
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Expanded(child: choosePlaneWidget()),
            ],
          )
        ],
      ),
    );
  }
}
