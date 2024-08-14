import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_dialogBox.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

class CustomeDrawer extends StatelessWidget {
  const CustomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: 300,
          child: Drawer(
            width: MediaQuery.sizeOf(context).width * 0.66,
            backgroundColor: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                iconButton(
                    onpress: () {
                      Get.back();
                      Get.toNamed("/profile");
                    },
                    icon: Icons.person_outline,
                    title: "profile"),
                iconButton(
                    onpress: () {
                      Get.back();

                      Get.toNamed("/privacy");
                    },
                    icon: Icons.info_outline,
                    title: "About us"),
                iconButton(
                    onpress: () {
                      Get.back();

                      Get.toNamed("/terms&cond");
                    },
                    icon: Icons.article_outlined,
                    title: "Terms and Conditions"),
                iconButton(
                    onpress: () {
                      Get.back();

                      Get.toNamed('/privacyPolicy');
                    },
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy & Policy"),
                iconButton(
                    onpress: () {
                      Get.back();
                      showDialogBox(type: "logout");
                    },
                    icon: Icons.logout,
                    title: "Log out"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget iconButton(
    {required IconData icon,
    required String title,
    required void Function()? onpress}) {
  return IconButton(
    onPressed: onpress,
    icon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          WinngooText(
            text: title,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
