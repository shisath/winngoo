import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:winggoo_gala/common_file/functions.dart';
import 'package:winggoo_gala/signup/signup_widget.dart';

import '../common_file/widgets.dart';
import 'Home_widget.dart';

final homeformKey = GlobalKey<FormState>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            headingContainer(
                widget: Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to\nWinngoo Gala",
                    style:
                        TextStyle(fontSize: headingSize, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "This is the platform of online events",
                    style: TextStyle(
                        fontSize: contentSize + 3, color: Colors.white),
                  )
                ],
              ),
            )),
            homeWidget()
          ],
        ),
      ),
    );
  }
}
