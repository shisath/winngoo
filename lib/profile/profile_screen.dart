import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:winggoo/common_file/getXcontroller.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_box.dart';
import 'package:winggoo/common_file/winngoo_widgets/winngoo_drawer.dart';

import '../common_file/images.dart';
import '../common_file/widgets.dart';
import '../common_file/winngoo_widgets/winngoo_dialogBox.dart';
import '../summary/summary_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await logInController.membersApi();
        await profileController.getProfilePicture();
      });
    }

    return Scaffold(
      endDrawer: const CustomeDrawer(),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            customAppbar(title: "Profile", menu: true),
            Expanded(child: Container()),
            Expanded(
                flex: 4,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: WinngooBox(
                        fillColor: primaryColor,
                        radiusOnly: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              summaryRowModel(
                                  keyText: "User ID",
                                  valueText: logInController.membersApiData
                                          .value.data![0].user_id ??
                                      "",
                                  color: Colors.white),
                              summaryRowModel(
                                  keyText: "Name",
                                  valueText: logInController.membersApiData
                                          .value.data![0].firstName ??
                                      "",
                                  color: Colors.white),
                              summaryRowModel(
                                  keyText: "Country",
                                  valueText: logInController.membersApiData
                                          .value.data![0].country ??
                                      "",
                                  color: Colors.white),
                              summaryRowModel(
                                  keyText: "Phone number",
                                  valueText: logInController.membersApiData
                                          .value.data![0].mobileNumber ??
                                      "",
                                  color: Colors.white),
                              summaryRowModel(
                                  keyText: "Email",
                                  valueText: logInController.membersApiData
                                          .value.data![0].email ??
                                      "",
                                  color: Colors.white),
                              summaryRowModel(
                                  keyText: "Create at",
                                  valueText: logInController.membersApiData
                                          .value.data![0].createdAt
                                          .toString()
                                          .substring(0, 10) ??
                                      "",
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: MediaQuery.sizeOf(context).height * -0.1,
                        width: MediaQuery.sizeOf(context).width,
                        child: Container(
                          width: 150, // Diameter of the circle
                          height: 150, // Diameter of the circle
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black54, // Outline color
                              width: 5, // Outline width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 75,
                            child: ClipOval(
                              child: profileController
                                      .networkImage.value.isNotEmpty
                                  ? Image.network(
                                      profileController.networkImage.value,
                                      fit: BoxFit.cover,
                                      height: 140,
                                      width: 140,
                                    )
                                  : Image.asset(
                                      winngooLogo,
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: 150,
                                    ),
                            ),
                          ),
                        )),
                    Obx(
                      () => Positioned(
                        top: MediaQuery.sizeOf(context).height * 0.04,
                        width: MediaQuery.sizeOf(context).width * 1.3,
                        child: GestureDetector(
                          onTap: () {
                            showDialogBox(type: 'galary');
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: profileController.loader.value
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.red),
                                      strokeWidth: 3.0,
                                    ))
                                : Icon(
                                    // shadows: [Shadow(color: Colors.black)],
                                    weight: 1,
                                    Icons.camera_alt_rounded,
                                    color: Colors.black54,
                                    size: 25,
                                  ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
