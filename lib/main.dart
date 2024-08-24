import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/logIn/login_screen.dart';

import 'LogIn/login_controller.dart';
import 'common_file/getXcontroller.dart';
import 'common_file/router.dart';

void main() async {
  await GetStorage.init();

  Get.put(LogInController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LogInScreen(),
      initialBinding: HomeBinding(),
      getPages: routes,
      initialRoute: initialRoute(),
    );
  }
}

String initialRoute() {
  final token = localStorage.read('api_token'); // Read token from storage

  if (token != null) {
    return '/addEventScreen'; // Navigate to Home if token exists
  } else {
    return '/signIn'; // Navigate to Login if no token
  }
}
