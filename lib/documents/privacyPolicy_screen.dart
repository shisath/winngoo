import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';
import 'package:winggoo/documents/terms&cond_screen.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({
    super.key,
  });

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  // final String type;
  final policyList =
      docController.content[0]['privacyPolicy'] as List<Map<String, dynamic>>;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

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
                text: "Privacy Policy",
                color: const Color(0xff5669FF),
                weight: FontWeight.w600,
                fontSize: headingSize)),
        body: documentModelCard(
          length: docController.content[0]['privacyPolicy'].length,
          listData: docController.content[0]['privacyPolicy'],
        ));
  }
}
