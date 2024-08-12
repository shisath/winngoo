import 'package:flutter/material.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/images.dart';
import 'package:winggoo/common_file/widgets.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';
import 'package:winggoo/payment/payment_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buttonWidget(onPress: () {}, text: "CONTINUE"),
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              WinngooText(
                text: "Payment",
                weight: FontWeight.w600,
              ),
              Center(
                child: Image.asset(
                  paymentPng,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              paymentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
