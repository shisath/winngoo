import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;
  final String userName;
  final String userId;

  const VideoConferencePage(
      {super.key,
      required this.conferenceID,
      required this.userName,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ZegoUIKitPrebuiltVideoConference(
            appID: 1517700734,
            // Fill in the appID that you get from ZEGOCLOUD Admin Console.
            appSign:
                "fae3dc443e57f3fac65a25002565475620ecc17cbca729f278940c388f763668",
            // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
            userID: userId,
            userName: userName,
            conferenceID: conferenceID,
            config: ZegoUIKitPrebuiltVideoConferenceConfig(
                // bottomMenuBarConfig: ZegoBottomMenuBarConfig(buttons: [
                //   ZegoMenuBarButtonName.toggleMicrophoneButton,
                // ]),
                memberListConfig: ZegoMemberListConfig(
              showMicrophoneState: true,
            )),
          ),
        ],
      ),
    );
  }
}
