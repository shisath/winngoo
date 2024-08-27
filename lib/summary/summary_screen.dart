import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/getXcontroller.dart%20';
import 'package:winggoo/common_file/widgets.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';
import 'package:winggoo/summary/summary_widget.dart';

import '../common_file/winngoo_widgets/winngoo_drawer.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      summaryController.eventApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buttonWidget(
          onPress: () {
            Get.toNamed("/payment");
          },
          text: "CONTINUE"),
      appBar: buildAppBar(),
      endDrawer: const CustomeDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              const WinngooText(
                text: "SUMMARY",
                weight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              summaryWidget(),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              planeSummaryWidget()
            ],
          ),
        ),
      ),
    );
  }
}
