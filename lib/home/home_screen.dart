import 'package:flutter/material.dart';

import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_drawer.dart';
import 'Home_widget.dart';

final homeformKey = GlobalKey<FormState>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      endDrawer: const CustomeDrawer(),
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
                  headingContainer(
                    widget: Center(child: Image.asset(conferencePng)),
                  ),
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
