import 'package:flutter/material.dart';
import 'package:winggoo/LogIn/login_widget.dart';
import 'package:winggoo/common_file/functions.dart';

import '../common_file/images.dart';
import '../common_file/widgets.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headingContainer(context: context, widget: Image.asset(loginPng)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: logInWidget(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
