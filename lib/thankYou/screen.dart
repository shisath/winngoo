import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/images.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    return Center(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WinngooText(
              text: "Thank You For Choosing",
              fontSize: headingSize,
              weight: FontWeight.w600,
            ),
            Image.asset(winngooGalaLogo),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                radius: 30,
                child: IconButton(
                    onPressed: () {
                      Get.offAllNamed('/addEventScreen');
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.black54,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
