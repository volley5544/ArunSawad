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
    _cameraController = CameraController(back, ResolutionPreset.high);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _recordVideo() async {
    if (_isRecording) {
      if (_isPaused) {
        await _cameraController.resumeVideoRecording();
        setState(() => _isPaused = false);
      } else {
        final file = await _cameraController.stopVideoRecording();
        setState(() {
          _isRecording = false;
          FFAppState().videoRecordFilePath = file.path;
        });

        Uint8List bytes = await file.readAsBytes();

        FFUploadedFile ffBytesFile = new FFUploadedFile(
          name: '${widget.contNo!}',
          bytes: bytes,
        );

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
            'fileVideo': serializeParam(
              ffBytesFile,
              ParamType.FFUploadedFile,
            ),
          }.withoutNulls,
        );
      }
    } else {
      await _cameraController.prepareForVideoRecording();
      await _cameraController.startVideoRecording();
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
      setState(() => _isPaused = true);
    }
  }

  _switchCameraDirection() async {
    final cameras = await availableCameras();
    if (_isFrontCamera) {
      final back = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back);
      _cameraController = CameraController(back, ResolutionPreset.high);
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
        ResolutionPreset.high,
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
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (!_isLoading) CameraPreview(_cameraController),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isRecording)
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.pause),
                    onPressed: () => _pauseVideo(),
                  ),
                SizedBox(width: 10),
                FloatingActionButton(
                    backgroundColor: Colors.red,
                    child: Icon(_isRecording
                        ? (_isPaused ? Icons.play_arrow : Icons.stop)
                        : Icons.circle),
                    onPressed: () async {
                      await _recordVideo();
                    }),
              ],
            ),
          ),
          Visibility(
            visible: !_isRecording,
            child: Positioned(
              top: 30, // Adjust this value as needed
              right: 20, // Adjust this value as needed
              child: FloatingActionButton(
                backgroundColor: Colors.grey,
                child: Icon(Icons.switch_camera),
                onPressed: () => _switchCameraDirection(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
