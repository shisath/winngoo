import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winggoo/common_file/functions.dart';

import '../common_file/images.dart';
import '../common_file/widgets.dart';
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
      onPopInvoked: (popDisposition) {
        SystemNavigator.pop(); // Exit the app when the back button is pressed
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
        ),
        // appBar: buildAppBar(showLeadingIcon: false),
        // endDrawer: const CustomeDrawer(),
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
