import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winggoo/common_file/widgets.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_text.dart';

import '../addEvent/addEvent_controller.dart';
import '../common_file/functions.dart';

final addEventController = Get.put(AddEventController());

Widget homeWidget() {
  return Center(
    child: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        WinngooBox(
            radius: 10,
            height: MediaQuery.sizeOf(Get.context!).height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const WinngooText(
                  text: "Let’s connect with winngoo gala",
                ),
                buttonWidget(
                    onPress: () async {
                      await futureDelay(Duration(milliseconds: 300));
                      Get.toNamed("/joinMeeting");
                    },
                    text: "JOIN CELEBRATION"),
                const WinngooText(
                  text: "OR",
                ),
                Obx(
                  () => buttonWidget(
                      isLoading: addEventController.refreshLoader.value,
                      onPress: () async {
                        await futureDelay(Duration(milliseconds: 300));
                        Get.toNamed("/addEventScreen");
                      },
                      text: "CREATE EVENT"),
                ),
                const WinngooText(
                  align: TextAlign.center,
                  text: "Bringing Conversations Closer, One Call at a Time.",
                ),
              ],
            ))
      ],
    ),
  );
}

//
// homeWidget() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const SizedBox(
//           height: 80,
//         ),
//         textField(
//             label: "Email",
//             hint: "Eg.sk@gmail.com",
//             prefixIcon: const Icon(
//               Icons.mail,
//               color: Colors.grey,
//             ),
//             validate: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'This field cannot be empty';
//               } else {
//                 return null;
//               }
//             },
//             controller: homeController.emailController,
//             focusNode: homeController.emailFocusNode,
//             onFieldSubmited: (val) {
//               FocusScope.of(Get.context!)
//                   .requestFocus(signUpController.fullnameFocusNode);
//             }),
//         const SizedBox(
//           height: 20,
//         ),
//         Text(
//           "OR",
//           style: TextStyle(fontSize: contentSize),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         textField(
//             label: "Link",
//             hint: "Eg.http//link.com",
//             prefixIcon: const Icon(
//               Icons.link_rounded,
//               color: Colors.grey,
//             ),
//             validate: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'This field cannot be empty';
//               } else {
//                 return null;
//               }
//             },
//             controller: signUpController.emailController,
//             focusNode: signUpController.emailFocusNode,
//             onFieldSubmited: (val) {
//               FocusScope.of(Get.context!)
//                   .requestFocus(signUpController.fullnameFocusNode);
//             }),
//         const SizedBox(
//           height: 80,
//         ),
//         buttonWidget(
//             onPress: () {
//               Get.toNamed("/addEventScreen");
//             },
//             text: "CREATE ROOM"),
//         const SizedBox(
//           height: 20,
//         ),
//       ],
//     ),
//   );
// }

Widget pngButton({
  png,
  required String text,
  required void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        png,
        Text(
          text,
          style: TextStyle(fontSize: contentSize),
        )
      ],
    ),
  );
}
