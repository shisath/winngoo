import 'package:flutter/material.dart';

import 'functions.dart';
import 'images.dart';

class WinngooSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => ()),
      // );
      // Get.offNamed('/homeScreen');

      initialRoute();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          winngooSplashPng,
        ),
      ),
    );
  }
}
