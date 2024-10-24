import 'package:flutter/material.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      chooseYourPlaneConroller.planeApi();
      // summaryController.priceResponseLoader.value = false;
      // summaryController.eventResponseLoader.value = false;
      chooseYourPlaneConroller.initializeLoaders(
          chooseYourPlaneConroller.planeApiData.value.data?.length ?? 2);
    });
  }

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
                              height: 140,
                              width: 160,
                            ),
                            // WinngooText(
                            //   text: "Choose Your Plane",
                            //   color: Colors.white,
                            //   weight: FontWeight.w600,
                            //   fontSize: contentSize,
                            // ),
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
