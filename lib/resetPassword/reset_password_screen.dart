import 'package:flutter/material.dart';
import 'package:winggoo_gala/resetPassword/reset_password_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))],
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            resetPasswordWidget()
          ],
        ),
      ),
    );
  }
}
