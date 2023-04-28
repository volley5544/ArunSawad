// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future batchUpdate(DocumentReference? userDocRef) async {
  // collectionRef is variable name that can be changed
  // updateCollection is a parameter - set as a 'specific value' with the name of the collection
  // you want to update (e.g. where the documents are)
  CollectionReference collectionRef = FirebaseFirestore.instance
      .collection('user_custom')
      .doc(userDocRef!.id)
      .collection('notification');
  //CollectionReference collectionRef2 =
  //FirebaseFirestore.instance.collection('notification');
  //collectionRef.where('employee_id', isEqualTo: '31622').firestore.collection('notification').where('noti_is_read', isEqualTo: false).get()
  //;

  //FirebaseFirestore.instance.collection('user_custom').doc('mtufF0N2p6QiHtBM1V7R').collection("notification").doc().update({'noti_is_read': true})
  //.add({
  //add your data that you want to upload
  //})
  //;

  //WriteBatch creates a temporary 'wrapper' for your querys + actions on them
  //batch is a variable name you can change (the first one only)
  WriteBatch batch = FirebaseFirestore.instance.batch();

  //this runs a query on your firestore collection to get the documents you want to update
  collectionRef

      //collectionRef.where('uid', isEqualTo: userUID).get()
      //.where is a search filter - you can add more filters here like a normal query in flutterflow
      //set updateField and currentValue as parameters to configure this for your query
      //.where('noti_is_read', isEqualTo: false)
      //.where('employee_id', isEqualTo: '31622')
      //.firestore.collection('notification')
      //.where('noti_is_read', isEqualTo: false)
      //.get is used to retrieves those documents
      .where('noti_is_read', isEqualTo: false)
      .get()

      //.then allows you to run action/actions on the results from your query
      //querySnapshot is a variable name you can change
      .then((querySnapshot) {
    //docs.forEach runs your action as a loop on each result
    //document is a variable name you can change
    querySnapshot.docs.forEach((document) {
      //set newValue parameter in action with value you want your documents to be updated to
      batch.update(document.reference, {'noti_is_read': true});
    });

    //this ends your firestore batch as one single 'action' on the database all at the same time
    return batch.commit();
  });
  //return '$collectionRef';
}
