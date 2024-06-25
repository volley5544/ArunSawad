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

import '../../flutter_flow/upload_data.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'dart:async';

class CameraRecord extends StatefulWidget {
  const CameraRecord({
    Key? key,
    this.width,
    this.height,
    this.contNo,
    this.checkApp,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? contNo;
  final String? checkApp;

  @override
  _CameraRecordState createState() => _CameraRecordState();
}

class _CameraRecordState extends State<CameraRecord> {
  bool _isLoading = true;
  late CameraController _cameraController;
  bool _isRecording = false;
  bool _isPaused = false;
  bool _isFrontCamera = false;
  final stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final back = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(back, ResolutionPreset.medium);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _recordVideo() async {
    print('_isRecording : ${_isRecording}');
    print('_isPaused : ${_isPaused}');
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      stopwatch.stop();
      stopwatch.reset();
      setState(() {
        _isRecording = false;
        _isPaused = false;
        FFAppState().videoRecordFilePath = file.path;
      });

      // Ensure file is ready before navigation
      await _ensureFileIsReady(file);

      context.pushNamed(
        'RecordVideoCustomer3',
        queryParameters: {
          'contNo': serializeParam(
            '${widget.contNo!}',
            ParamType.String,
          ),
          'checkType': serializeParam(
            '${widget.checkApp!}',
            ParamType.String,
          ),
        }.withoutNulls,
      );
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
      stopwatch.start();
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!stopwatch.isRunning) {
          timer.cancel();
        }
        setState(() {}); // to update the timer on-screen
      });
      setState(() => _isRecording = true);
    }
  }

  Future<void> _ensureFileIsReady(XFile file) async {
    try {
      //await Future.delayed(Duration(milliseconds: 500));
      final fileSize = await File(file.path).length();
      if (fileSize > 0) {
        print('File is ready with size: $fileSize bytes');
      } else {
        print('File is not ready or empty');
      }
    } catch (e) {
      print('Error processing file: $e');
    }
  }

  _pauseVideo() async {
    if (_isRecording && !_isPaused) {
      await _cameraController.pauseVideoRecording();
      stopwatch.stop();
      setState(() {
        _isPaused = true;
      });
    } else {
      await _cameraController.resumeVideoRecording();
      stopwatch.start();
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!stopwatch.isRunning) {
          timer.cancel();
        }
        setState(() {}); // to update the timer on-screen
      });
      setState(() {
        _isPaused = false;
      });
    }
    print('_isRecording2 : ${_isRecording}');
    print('_isPaused2 : ${_isPaused}');
  }

  _switchCameraDirection() async {
    final cameras = await availableCameras();
    if (_isFrontCamera) {
      final back = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back);
      _cameraController = CameraController(back, ResolutionPreset.medium);
      await _cameraController.initialize();
      setState(() {
        _isLoading = false;
        _isFrontCamera = false;
      });
    } else {
      final front = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);
      _cameraController = CameraController(
        front,
        ResolutionPreset.medium,
      );
      await _cameraController.initialize();
      setState(() {
        _isLoading = false;
        _isFrontCamera = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (!_isLoading) CameraPreview(_cameraController),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(width: 10),
                Text(
                  '${stopwatch.elapsed.toString().split('.').first.split(':')[1]}:${stopwatch.elapsed.toString().split('.').first.split(':')[2]}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                FloatingActionButton(
                    backgroundColor: Colors.red,
                    child: Icon(_isRecording
                        ? Icons.stop
                        : Icons.fiber_manual_record_sharp),
                    onPressed: () async {
                      await _recordVideo();
                    }),
                if (_isRecording)
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Icon(_isPaused ? Icons.play_arrow : Icons.pause),
                    onPressed: () => _pauseVideo(),
                  ),
                if (!_isRecording)
                  Visibility(
                    visible: !_isRecording,
                    child: FloatingActionButton(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.switch_camera),
                      onPressed: () => _switchCameraDirection(),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
              top: 12,
              right: 12,
              child: Visibility(
                visible: _isRecording,
                child: Image(
                  image: AssetImage('assets/images/icons8-recording2.gif'),
                  height: 60,
                  fit: BoxFit.fitHeight,
                ),
              )
              //icons8-recording
              ),
        ],
      ),
    ]);
  }
}
