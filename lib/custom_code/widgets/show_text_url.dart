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

import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowTextUrl extends StatefulWidget {
  const ShowTextUrl({
    super.key,
    this.width,
    this.height,
    this.text,
  });

  final double? width;
  final double? height;
  final String? text;

  @override
  State<ShowTextUrl> createState() => _ShowTextUrlState();
}

class _ShowTextUrlState extends State<ShowTextUrl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Linkify(
        text: widget.text ?? "",
        style: TextStyle(fontSize: 18),
        linkStyle: TextStyle(color: Colors.blue),
        onOpen: (link) async {
          final Uri uri = Uri.parse(link.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            throw 'Could not launch $uri';
          }
        },
      ),
    );
  }
}
