import 'package:flutter/material.dart';

import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_drawer.dart';
import 'Home_widget.dart';

final homeformKey = GlobalKey<FormState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (s) {
        false; // Return false to prevent the pop.
      },
      child: Scaffold(
        appBar: buildAppBar(showLeadingIcon: false),
        endDrawer: const CustomeDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              headingContainer(
                  context: context,
                  widget: Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headingContainer(
                          context: context,
                          widget: Center(child: Image.asset(conferencePng)),
                        ),
                      ],
                    ),
                  )),
              homeWidget()
            ],
          ),
        ),
      ),
    );
  }
}
