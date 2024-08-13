import 'package:flutter/material.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/images.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';

import '../summary/summary_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: Container()),
          Expanded(
              flex: 3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: WinngooBox(
                      fillColor: primaryColor,
                      radiusOnly: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            summaryRowModel(
                                keyText: "Member ID", valueText: "sash123"),
                            summaryRowModel(
                                keyText: "Name", valueText: "Sathish"),
                            summaryRowModel(
                                keyText: "Country", valueText: "India"),
                            summaryRowModel(
                                keyText: "Phone number",
                                valueText: "7010996304"),
                            summaryRowModel(
                                keyText: "Email", valueText: "Sk@gmail.com"),
                            summaryRowModel(
                                keyText: "Create Dater",
                                valueText: "01/02/2024"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.sizeOf(context).height * -0.1,
                      width: MediaQuery.sizeOf(context).width,
                      child: CircleAvatar(
                        radius: 75,
                        child: Image.asset(winngooLogo),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
