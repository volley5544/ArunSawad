// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:enough_mail/enough_mail.dart';

class EmailInfo {
  final String from;
  final String subject;
  final String? content;
  final String contentType;

  EmailInfo(this.from, this.subject, this.content, this.contentType);
}

Future<List<String>> enoughEmail(
  String? user,
  String? password,
  String? infoType,
) async {
  // Add your function code here!
  final List<EmailInfo> emails = [];
  List<String> outputList = [];
  final client = ImapClient(isLogEnabled: false);
  try {
    await client.connectToServer('mail.srisawadpower.com', 143,
        isSecure: false);
    await client.login(user!, password!);
    await client.selectInbox();

    final fetchResult = await client.fetchRecentMessages(
      messageCount: 10,
      criteria: 'BODY.PEEK[]',
    );

    for (final message in fetchResult.messages) {
      final from = message.from?.join(', ') ?? 'Unknown Sender';
      final subject = message.decodeSubject();
      final contentType = message.getHeaderValue('content-type') ?? '';
      final content = message.isTextMessage()
          ? message.decodeTextHtmlPart() ?? ''
          : 'Non-text content';
      emails.add(EmailInfo(from, subject!, content!, contentType));
    }

    await client.logout();
  } on ImapException catch (e) {
    print('IMAP failed with $e');
  }

  if (infoType! == 'content') {
    for (final email in emails) {
      outputList.add(email.content!);
    }
  } else if (infoType! == 'from') {
    for (final email in emails) {
      outputList.add(email.from!);
    }
  } else if (infoType! == 'subject') {
    for (final email in emails) {
      outputList.add(email.subject!);
    }
  }
  if (infoType! == 'subject') {
    List<String> filteredList =
        outputList.where((item) => item.contains('5')).toList();
  }
  List<String> filteredList =
      outputList.where((item) => item.contains('5')).toList();
  return filteredList;
}
