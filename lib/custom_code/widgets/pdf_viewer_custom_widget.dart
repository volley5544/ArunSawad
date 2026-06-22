// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdfx/pdfx.dart';

class PdfViewerCustomWidget extends StatefulWidget {
  const PdfViewerCustomWidget({
    super.key,
    this.width,
    this.height,
    this.assetPath,
    this.horizontalScroll = false,
  });

  final double? width;
  final double? height;
  final String? assetPath;
  final bool horizontalScroll;

  @override
  State<PdfViewerCustomWidget> createState() => _PdfViewerCustomWidgetState();
}

class _PdfViewerCustomWidgetState extends State<PdfViewerCustomWidget> {
  PdfController? controller;
  bool _isLoading = true;
  String get assetPath => widget.assetPath ?? '';

  Future<void> _initializeController() async {
    safeSetState(() => _isLoading = true);
    final pdfDocument =
        assetPath.isNotEmpty ? await PdfDocument.openFile(assetPath) : null;
    controller = pdfDocument != null
        ? PdfController(document: Future.value(pdfDocument))
        : null;
    safeSetState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  // @override
  // void didUpdateWidget(PdfViewerCustomWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.networkPath != widget.networkPath ||
  //       oldWidget.fileBytes != widget.fileBytes) {
  //     _initializeController();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller != null
              ? PdfView(
                  controller: controller!,
                  scrollDirection:
                      widget.horizontalScroll ? Axis.horizontal : Axis.vertical,
                  builders: PdfViewBuilders<DefaultBuilderOptions>(
                    options: const DefaultBuilderOptions(),
                    documentLoaderBuilder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    pageLoaderBuilder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    errorBuilder: (_, __) => Container(),
                  ),
                )
              : const SizedBox(),
    );
  }
}
