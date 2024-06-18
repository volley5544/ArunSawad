// Automatic FlutterFlow imports
import 'dart:io';

import 'package:video_player/video_player.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class VideoPage extends StatefulWidget {
  final double? width;
  final double? height;
  final String filePath;

  const VideoPage({Key? key, this.width, this.height, required this.filePath}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    print('widget.filePath : ${widget.filePath}');
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    _initializeVideoPlayerFuture = _videoPlayerController.initialize().then((_) {
      setState(() {});
      _videoPlayerController.setLooping(true);
      _videoPlayerController.play();
    });
  }
  Future<void> _uploadFile() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('YOUR_API_ENDPOINT_HERE'));
      request.files.add(await http.MultipartFile.fromPath('file', widget.filePath));

      var response = await request.send();

      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('Failed to upload file');
      }
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        elevation: 0,
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              await _uploadFile();
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (_videoPlayerController.value.isInitialized) {
              return Center(
                child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
              );
            } else {
              return const Center(child: Text('Error initializing video'));
            }
          } else {
            return const Center(child: Text('Error loading video'));
          }
        },
      ),
    );
  }
}
