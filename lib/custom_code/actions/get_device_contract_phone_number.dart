// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:contacts_service/contacts_service.dart';

Future<List<String>> getDeviceContractPhoneNumber(String? contactType) async {
  // Add your function code here!
  List<String> list = ['1', '2', '3'];
  List<Contact> contacts =
      await ContactsService.getContacts(withThumbnails: false);
//   //list = ;
  List<String> names = [];
  List<String> phones = [];
//
//   //Iterable<Contact> _contacts = await ContactsService.getContacts(withThumbnails: false);
//
  contacts.forEach((contact) {
    contact.phones!.toSet().forEach((phone) {
      names.add(contact.displayName ?? contact.givenName!);
      phones.add(phone.value!);
    });
  });
  if (contactType! == 'name') {
    return names;
  } else {
    return phones;
  }
}
