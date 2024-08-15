import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

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
      docController.content[0]['privacyPolicy'] as List<Map<String, String>>;

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
              text: "Privacy Policy",
              color: const Color(0xff5669FF),
              weight: FontWeight.w600,
              fontSize: headingSize)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: policyList.length,
            itemBuilder: (context, index) {
              final item = policyList[index];
              return documentModelCard(
                  title: item["heading"].toString(),
                  content: item["content"].toString());
            }),
      ),
    );
  }
}

// 0xff5669FF
Widget documentModelCard({
  required String title,
  required String content,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        WinngooText(
            text: title,
            color: Colors.black,
            weight: FontWeight.w600,
            fontSize: headingSize - 2),
        const SizedBox(
          height: 10,
        ),
        WinngooText(
            text: content, color: Colors.black, fontSize: contentSize - 2),
      ],
    ),
  );
}
