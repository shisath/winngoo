import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common_file/functions.dart';
import '../common_file/widgets.dart';
import 'addEvent_Widget.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "ADD EVENT",
                        style: TextStyle(
                            fontSize: headingSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Explore Categories",
                          style: TextStyle(
                            fontSize: headingSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )),
            addEventWidget()
          ],
        ),
      ),
    );
  }
}
