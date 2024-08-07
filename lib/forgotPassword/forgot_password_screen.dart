import 'package:flutter/material.dart';

import '../common_file/functions.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          GestureDetector(
            child: const Icon(Icons.menu),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [Text("FORGOT PASSWORD")],
        ),
      ),
    );
  }
}
