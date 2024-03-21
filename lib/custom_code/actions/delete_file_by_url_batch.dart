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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future deleteFileByUrlBatch(List<String>? imgUrlList) async {
  // Add your function code here!
  // const imageURLS = !Array.isArray(item?.data?.imageURL)
  //   ? [item?.data?.imageURL]
  //   : item?.data?.imageURL;

  //await FirebaseStorage.instance.refFromURL(imgUrlList![0]).delete();

  for (int i = 0; i < imgUrlList!.length; i++) {
    FFAppState().idNumberTemp++;
    await FirebaseStorage.instance.refFromURL(imgUrlList![i]).delete();
  }

  // imgUrlList!.forEach((URL) => {
  //   let storageRef = projectStorage.refFromURL(URL);
  //   await deleteFile(`images/${currentUser.uid}/${storageRef.name}`);
  // });

// const deleteFromFirebase = (url) => {
//     //1.
//     let pictureRef = storage.refFromURL(url);
//    //2.
//     pictureRef.delete()
//       .then(() => {
//         //3.
//         setImages(allImages.filter((image) => image !== url));
//         alert("Picture is deleted successfully!");
//       })
//       .catch((err) => {
//         console.log(err);
//       });
//   };

  // imgUrlList!.forEach(
  //     (url) async => {await FirebaseStorage.instance.refFromURL(url).delete()});
  //await FirebaseStorage.instance.refFromURL('www.google.co.th').delete();
}
