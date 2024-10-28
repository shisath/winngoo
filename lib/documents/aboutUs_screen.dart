import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';
import 'package:winggoo/documents/terms&cond_screen.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({
    super.key,
  });

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  // final String type;
  final aboutUsList =
      docController.content[0]['aboutUs'] as List<Map<String, dynamic>>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: primaryColor,
              ),
            ),
            title: WinngooText(
                text: "About us",
                color: const Color(0xff5669FF),
                weight: FontWeight.w600,
                fontSize: headingSize)),
        body: documentModelCard(
          length: docController.content[0]['aboutUs'].length,
          listData: docController.content[0]['aboutUs'],
        ));
  }
}
