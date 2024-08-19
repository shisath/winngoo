import 'package:flutter/material.dart';

import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_drawer.dart';
import 'join_meeting_widget.dart';

final joinScreenformKey = GlobalKey<FormState>();

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(showLeadingIcon: true),
      endDrawer: const CustomeDrawer(),
      body: Column(
        children: [
          Expanded(
            child: headingContainer(
                context: context,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          joinMeetingPng,
                          height: 200,
                          width: 300,
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(flex: 2, child: joinMeetingWidget(contex: context))
        ],
      ),
    );
  }
}
