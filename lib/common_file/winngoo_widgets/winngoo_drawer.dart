import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_dialogBox.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

class CustomeDrawer extends StatefulWidget {
  const CustomeDrawer({super.key});

  @override
  State<CustomeDrawer> createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<CustomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SizedBox(
          height: 400,
          child: Drawer(
            width: MediaQuery.sizeOf(context).width * 0.66,
            backgroundColor: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                iconButton(
                    onpress: () async {
                      await addEventController.eventListApi();
                      await futureDelay(Duration(milliseconds: 500));

                      Navigator.of(context).pop();
                      Get.offAllNamed("/addEventScreen");
                    },
                    icon: Icons.home,
                    title: "Home"),
                iconButton(
                    onpress: () async {
                      await futureDelay(Duration(milliseconds: 500));
                      Navigator.of(context).pop();

                      Get.offAllNamed("/homeScreen");
                    },
                    icon: Icons.celebration,
                    title: "Join Celebration"),
                iconButton(
                    onpress: () async {
                      await futureDelay(Duration(milliseconds: 500));
                      Navigator.of(context).pop();
                      Get.toNamed("/profile");
                    },
                    icon: Icons.person_outline,
                    title: "Profile"),
                iconButton(
                    onpress: () async {
                      await futureDelay(Duration(milliseconds: 500));

                      Navigator.of(context).pop();
                      Get.toNamed("/privacy");
                    },
                    icon: Icons.info_outline,
                    title: "About us"),
                iconButton(
                    onpress: () async {
                      await futureDelay(Duration(milliseconds: 500));

                      Navigator.of(context).pop();
                      Get.toNamed("/terms&cond");
                    },
                    icon: Icons.article_outlined,
                    title: "Terms and Conditions"),
                iconButton(
                    onpress: () async {
                      await futureDelay(Duration(milliseconds: 500));

                      Navigator.of(context).pop();
                      Get.toNamed('/privacyPolicy');
                    },
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy & Policy"),
                iconButton(
                    onpress: () async {
                      await futureDelay(Duration(milliseconds: 500));

                      // Navigator.of(context).pop();
                      showDialogBox(type: "logout");
                    },
                    icon: Icons.logout,
                    color: Colors.white,
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
    required void Function()? onpress,
    color}) {
  return IconButton(
    onPressed: onpress,
    icon: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          WinngooText(
            text: title,
            color: color ?? Colors.white,
          ),
        ],
      ),
    ),
  );
}
