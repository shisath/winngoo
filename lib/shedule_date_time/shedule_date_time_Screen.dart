import 'package:flutter/material.dart';
import 'package:winggoo/shedule_date_time/shedule_date_time_widget.dart';

import '../common_file/functions.dart';
import '../common_file/widgets.dart';

class SheduleDateAndTimeScreen extends StatefulWidget {
  const SheduleDateAndTimeScreen({super.key});

  @override
  State<SheduleDateAndTimeScreen> createState() =>
      _SheduleDateAndTimeScreenState();
}

class _SheduleDateAndTimeScreenState extends State<SheduleDateAndTimeScreen> {
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
                        "Schedule the Time and Date",
                        style: TextStyle(
                            fontSize: headingSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(child: selector()),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )),
            sheduleDateTimetWidget()
          ],
        ),
      ),
    );
  }
}
