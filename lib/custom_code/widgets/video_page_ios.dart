// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:native_video_player/native_video_player.dart';
import 'dart:io';

class VideoPageIos extends StatefulWidget {
  final double? width;
  final double? height;
  final String? filePath;

  const VideoPageIos(
      {Key? key, this.width, this.height, required this.filePath})
      : super(key: key);

  @override
  _VideoPageIosState createState() => _VideoPageIosState();
}

class _VideoPageIosState extends State<VideoPageIos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NativeVideoPlayerView(
      onViewReady: (controller) async {
        final videoSource = await VideoSource.init(
          path: '${widget.filePath}',
          type: VideoSourceType.file,
        );
        controller.onPlaybackReady.addListener(() {
          controller.play();
        });
        controller.onPlaybackEnded.addListener(() {
          controller.play();
        });
        controller.onPlaybackStatusChanged.addListener(() {
          final playbackStatus = controller.playbackInfo!.status;
          // playbackStatus can be playing, paused, or stopped.
        });
        controller.onPlaybackPositionChanged.addListener(() {
          final playbackPosition = controller.playbackInfo!.position;
        });

        await controller.loadVideoSource(videoSource);
      },
    );
  }
}
