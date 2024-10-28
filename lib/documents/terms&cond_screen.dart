import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

class TermsAndConditionScreen extends StatelessWidget {
  // final String type;
  final termsCondList =
      docController.content[0]['terms&condition'] as List<Map<String, String>>;

  TermsAndConditionScreen({
    super.key,
  });

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
              text: "Terms & Conditions",
              color: const Color(0xff5669FF),
              weight: FontWeight.w600,
              fontSize: headingSize)),
      body: documentModelCard(
          length: docController.content[0]['terms&condition'].length,
          listData: docController.content[0]['terms&condition']),
    );
  }
}

Padding documentModelCard({
  required int length,
  required dynamic listData,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    child: ListView.builder(
      itemCount: length,
      itemBuilder: (context, index) {
        var item = listData[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WinngooText(
                  text: item["heading"],
                  color: Colors.black,
                  weight: FontWeight.w600,
                  fontSize: headingSize - 2),
              SizedBox(height: 3),
              if (item["content"] is String)
                WinngooText(
                    align: TextAlign.justify,
                    text: item["content"],
                    color: Colors.black,
                    fontSize: contentSize - 2)

              // / Display simple string content
              else if (item["content"] is List) ...[
                for (var feature in item["content"])
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0, right: 5),
                          child: Icon(
                            Icons.star,
                            size: contentSize - 1,
                          ),
                        ),
                        Flexible(
                          child: WinngooText(
                              align: TextAlign.justify,
                              text: feature["content"],
                              color: Colors.black,
                              fontSize: contentSize - 2),
                        ),
                      ],
                    ),
                  )
              ],
              SizedBox(height: 16),
            ],
          ),
        );
      },
    ),
  );
}
