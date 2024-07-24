import 'package:flutter/material.dart';
import 'package:winggoo_gala/common_file/functions.dart';
import 'package:winggoo_gala/shedule_date_time/shedule_date_time_widget.dart';
import '../common_file/widgets.dart';

class ChooseYourPlaneScreen extends StatefulWidget {
  const ChooseYourPlaneScreen({super.key});

  @override
  State<ChooseYourPlaneScreen> createState() => _ChooseYourPlaneScreenState();
}

class _ChooseYourPlaneScreenState extends State<ChooseYourPlaneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          GestureDetector(
            child: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headingContainer(
                height: MediaQuery.sizeOf(context).height * 0.21,
                widget: Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Your Plane",
                        style: TextStyle(
                            fontSize: headingSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )),
           ],
        ),
      ),
    );
  }
}
