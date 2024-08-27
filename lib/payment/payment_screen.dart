import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/images.dart';
import 'package:winggoo/common_file/widgets.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_drawer.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';
import 'package:winggoo/payment/payment_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      paymentController.cleaner();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: buttonWidget(
      //     onPress: () {
      //       Get.offAllNamed("/signIn");
      //     },
      //     text: "CONTINUE"),

      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(),
      endDrawer: const CustomeDrawer(),
      body: Obx(
        () => paymentController.loader.value
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ))
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
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
                        fontSize: headingSize,
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
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
