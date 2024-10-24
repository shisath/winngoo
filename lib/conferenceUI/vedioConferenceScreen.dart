import 'package:flutter/material.dart';
import 'package:winggoo/common_file/functions.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

import '../common_file/winngoo_widgets/floatingBubbleButton.dart';

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;
  final String userName;
  final String userId;

  const VideoConferencePage(
      {super.key,
      required this.conferenceID,
      required this.userName,
      required this.userId});

  @override
  State<VideoConferencePage> createState() => _VideoConferencePageState();
}

class _VideoConferencePageState extends State<VideoConferencePage> {
  // Offset _position = Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: buildAppBar(),
      body: SafeArea(
        // maintainBottomViewPadding: true,
        minimum: EdgeInsets.only(top: 30, right: 5, left: 5, bottom: 5),
        child: Stack(
          children: [
            ZegoUIKitPrebuiltVideoConference(
              appID: 1510024281,
              // Fill in the appID that you get from ZEGOCLOUD Admin Console.
              appSign:
                  '8c3d731b4a393bdfa2f522a74ff0373822e958bfb4fc09f56286be477038952c',
              // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
              userID: widget.userId,
              userName: widget.userName,
              conferenceID: widget.conferenceID,
              config: ZegoUIKitPrebuiltVideoConferenceConfig(
                  bottomMenuBarConfig: ZegoBottomMenuBarConfig(buttons: [
                    ZegoMenuBarButtonName.toggleCameraButton,
                    ZegoMenuBarButtonName.toggleMicrophoneButton,
                    ZegoMenuBarButtonName.leaveButton,
                    ZegoMenuBarButtonName.switchAudioOutputButton,
                    ZegoMenuBarButtonName.chatButton,
                  ]),
                  leaveConfirmDialogInfo: ZegoLeaveConfirmDialogInfo(
                      title: "Leave",
                      cancelButtonName: "Cancel",
                      confirmButtonName: "Confirm",
                      message: "Are you sure to leave the meeting ?"),
                  // avatarBuilder: (BuildContext context, Size size,
                  //     ZegoUIKitUser? user, Map<String, dynamic> extraInfo) {
                  //   return CircleAvatar(
                  //     backgroundColor: Colors.blueAccent,
                  //     child: Text(
                  //       user!.name.isNotEmpty
                  //           ? user.name[0]
                  //           : '?', // Display first letter of the user's name
                  //       style: TextStyle(fontSize: 20, color: Colors.white),
                  //     ),
                  //   );
                  // },
                  memberListConfig: ZegoMemberListConfig(
                    showCameraState: true,
                    showMicrophoneState: true,
                  )),
            ),
            // Positioned(
            //   left: _position.dx,
            //   top: _position.dy,
            //   child: Draggable(
            //     feedback: _buildDraggableButton(), // The actual button
            //     childWhenDragging: Container(), // What is shown when dragging
            //     onDragUpdate: (details) {
            //       setState(() {
            //         _position = details.globalPosition;
            //       });
            //     }, // What is shown while dragging
            //     child: _buildDraggableButton(),
            //   ),
            // ),

            DraggableBubbleScreen()
          ],
        ),
      ),
    );
  }
}
