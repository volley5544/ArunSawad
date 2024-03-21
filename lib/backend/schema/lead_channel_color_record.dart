import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadChannelColorRecord extends FirestoreRecord {
  LeadChannelColorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "color" field.
  List<Color>? _color;
  List<Color> get color => _color ?? const [];
  bool hasColor() => _color != null;

  // "lead_channel" field.
  List<String>? _leadChannel;
  List<String> get leadChannel => _leadChannel ?? const [];
  bool hasLeadChannel() => _leadChannel != null;

  // "lead_age" field.
  List<int>? _leadAge;
  List<int> get leadAge => _leadAge ?? const [];
  bool hasLeadAge() => _leadAge != null;

  void _initializeFields() {
    _color = getColorsList(snapshotData['color']);
    _leadChannel = getDataList(snapshotData['lead_channel']);
    _leadAge = getDataList(snapshotData['lead_age']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LeadChannelColor');

  static Stream<LeadChannelColorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadChannelColorRecord.fromSnapshot(s));

  static Future<LeadChannelColorRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LeadChannelColorRecord.fromSnapshot(s));

  static LeadChannelColorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadChannelColorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadChannelColorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadChannelColorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadChannelColorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadChannelColorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadChannelColorRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class LeadChannelColorRecordDocumentEquality
    implements Equality<LeadChannelColorRecord> {
  const LeadChannelColorRecordDocumentEquality();

  @override
  bool equals(LeadChannelColorRecord? e1, LeadChannelColorRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.color, e2?.color) &&
        listEquality.equals(e1?.leadChannel, e2?.leadChannel) &&
        listEquality.equals(e1?.leadAge, e2?.leadAge);
  }

  @override
  int hash(LeadChannelColorRecord? e) =>
      const ListEquality().hash([e?.color, e?.leadChannel, e?.leadAge]);

  @override
  bool isValidKey(Object? o) => o is LeadChannelColorRecord;
}
