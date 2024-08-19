import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'JoinMeeting (enter your code)/join_meeting_screen.dart';
import 'common_file/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const JoinMeetingScreen(),
      getPages: routes,
      initialRoute: '/joinMeeting',
    );
  }
}
