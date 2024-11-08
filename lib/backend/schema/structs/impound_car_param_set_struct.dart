// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImpoundCarParamSetStruct extends FFFirebaseStruct {
  ImpoundCarParamSetStruct({
    String? improundCONTNO,
    String? improundLOCAT,
    String? improundTITLE,
    String? improundFNAME,
    String? improundSNAME,
    String? improundREGNO,
    String? improundREGPROV,
    String? improundCONTNOTYPE,
    String? improundCONTNOTYPENAME,
    String? improundGCODE,
    String? improundGDESC,
    String? improundNumbody,
    String? improundCUSCOD,
    String? improundARNOW,
    String? improundCONTSTAT,
    String? improundTYPECOD,
    String? improundMANUYR,
    String? improundMODELCOD,
    String? improudCOLORCOD,
    String? improundENGNO,
    String? improundKEYINCSHPRC,
    String? improundMANUYRCONVERT,
    String? impoundPrice,
    String? impoundDbName,
    String? impoundDbCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _improundCONTNO = improundCONTNO,
        _improundLOCAT = improundLOCAT,
        _improundTITLE = improundTITLE,
        _improundFNAME = improundFNAME,
        _improundSNAME = improundSNAME,
        _improundREGNO = improundREGNO,
        _improundREGPROV = improundREGPROV,
        _improundCONTNOTYPE = improundCONTNOTYPE,
        _improundCONTNOTYPENAME = improundCONTNOTYPENAME,
        _improundGCODE = improundGCODE,
        _improundGDESC = improundGDESC,
        _improundNumbody = improundNumbody,
        _improundCUSCOD = improundCUSCOD,
        _improundARNOW = improundARNOW,
        _improundCONTSTAT = improundCONTSTAT,
        _improundTYPECOD = improundTYPECOD,
        _improundMANUYR = improundMANUYR,
        _improundMODELCOD = improundMODELCOD,
        _improudCOLORCOD = improudCOLORCOD,
        _improundENGNO = improundENGNO,
        _improundKEYINCSHPRC = improundKEYINCSHPRC,
        _improundMANUYRCONVERT = improundMANUYRCONVERT,
        _impoundPrice = impoundPrice,
        _impoundDbName = impoundDbName,
        _impoundDbCode = impoundDbCode,
        super(firestoreUtilData);

  // "improundCONTNO" field.
  String? _improundCONTNO;
  String get improundCONTNO => _improundCONTNO ?? '';
  set improundCONTNO(String? val) => _improundCONTNO = val;

  bool hasImproundCONTNO() => _improundCONTNO != null;

  // "improundLOCAT" field.
  String? _improundLOCAT;
  String get improundLOCAT => _improundLOCAT ?? '';
  set improundLOCAT(String? val) => _improundLOCAT = val;

  bool hasImproundLOCAT() => _improundLOCAT != null;

  // "improundTITLE" field.
  String? _improundTITLE;
  String get improundTITLE => _improundTITLE ?? '';
  set improundTITLE(String? val) => _improundTITLE = val;

  bool hasImproundTITLE() => _improundTITLE != null;

  // "improundFNAME" field.
  String? _improundFNAME;
  String get improundFNAME => _improundFNAME ?? '';
  set improundFNAME(String? val) => _improundFNAME = val;

  bool hasImproundFNAME() => _improundFNAME != null;

  // "improundSNAME" field.
  String? _improundSNAME;
  String get improundSNAME => _improundSNAME ?? '';
  set improundSNAME(String? val) => _improundSNAME = val;

  bool hasImproundSNAME() => _improundSNAME != null;

  // "improundREGNO" field.
  String? _improundREGNO;
  String get improundREGNO => _improundREGNO ?? '';
  set improundREGNO(String? val) => _improundREGNO = val;

  bool hasImproundREGNO() => _improundREGNO != null;

  // "improundREGPROV" field.
  String? _improundREGPROV;
  String get improundREGPROV => _improundREGPROV ?? '';
  set improundREGPROV(String? val) => _improundREGPROV = val;

  bool hasImproundREGPROV() => _improundREGPROV != null;

  // "improundCONTNOTYPE" field.
  String? _improundCONTNOTYPE;
  String get improundCONTNOTYPE => _improundCONTNOTYPE ?? '';
  set improundCONTNOTYPE(String? val) => _improundCONTNOTYPE = val;

  bool hasImproundCONTNOTYPE() => _improundCONTNOTYPE != null;

  // "improundCONTNOTYPENAME" field.
  String? _improundCONTNOTYPENAME;
  String get improundCONTNOTYPENAME => _improundCONTNOTYPENAME ?? '';
  set improundCONTNOTYPENAME(String? val) => _improundCONTNOTYPENAME = val;

  bool hasImproundCONTNOTYPENAME() => _improundCONTNOTYPENAME != null;

  // "improundGCODE" field.
  String? _improundGCODE;
  String get improundGCODE => _improundGCODE ?? '';
  set improundGCODE(String? val) => _improundGCODE = val;

  bool hasImproundGCODE() => _improundGCODE != null;

  // "improundGDESC" field.
  String? _improundGDESC;
  String get improundGDESC => _improundGDESC ?? '';
  set improundGDESC(String? val) => _improundGDESC = val;

  bool hasImproundGDESC() => _improundGDESC != null;

  // "improundNumbody" field.
  String? _improundNumbody;
  String get improundNumbody => _improundNumbody ?? '';
  set improundNumbody(String? val) => _improundNumbody = val;

  bool hasImproundNumbody() => _improundNumbody != null;

  // "improundCUSCOD" field.
  String? _improundCUSCOD;
  String get improundCUSCOD => _improundCUSCOD ?? '';
  set improundCUSCOD(String? val) => _improundCUSCOD = val;

  bool hasImproundCUSCOD() => _improundCUSCOD != null;

  // "improundARNOW" field.
  String? _improundARNOW;
  String get improundARNOW => _improundARNOW ?? '';
  set improundARNOW(String? val) => _improundARNOW = val;

  bool hasImproundARNOW() => _improundARNOW != null;

  // "improundCONTSTAT" field.
  String? _improundCONTSTAT;
  String get improundCONTSTAT => _improundCONTSTAT ?? '';
  set improundCONTSTAT(String? val) => _improundCONTSTAT = val;

  bool hasImproundCONTSTAT() => _improundCONTSTAT != null;

  // "improundTYPECOD" field.
  String? _improundTYPECOD;
  String get improundTYPECOD => _improundTYPECOD ?? '';
  set improundTYPECOD(String? val) => _improundTYPECOD = val;

  bool hasImproundTYPECOD() => _improundTYPECOD != null;

  // "improundMANUYR" field.
  String? _improundMANUYR;
  String get improundMANUYR => _improundMANUYR ?? '';
  set improundMANUYR(String? val) => _improundMANUYR = val;

  bool hasImproundMANUYR() => _improundMANUYR != null;

  // "improundMODELCOD" field.
  String? _improundMODELCOD;
  String get improundMODELCOD => _improundMODELCOD ?? '';
  set improundMODELCOD(String? val) => _improundMODELCOD = val;

  bool hasImproundMODELCOD() => _improundMODELCOD != null;

  // "improudCOLORCOD" field.
  String? _improudCOLORCOD;
  String get improudCOLORCOD => _improudCOLORCOD ?? '';
  set improudCOLORCOD(String? val) => _improudCOLORCOD = val;

  bool hasImproudCOLORCOD() => _improudCOLORCOD != null;

  // "improundENGNO" field.
  String? _improundENGNO;
  String get improundENGNO => _improundENGNO ?? '';
  set improundENGNO(String? val) => _improundENGNO = val;

  bool hasImproundENGNO() => _improundENGNO != null;

  // "improundKEYINCSHPRC" field.
  String? _improundKEYINCSHPRC;
  String get improundKEYINCSHPRC => _improundKEYINCSHPRC ?? '';
  set improundKEYINCSHPRC(String? val) => _improundKEYINCSHPRC = val;

  bool hasImproundKEYINCSHPRC() => _improundKEYINCSHPRC != null;

  // "improundMANUYRCONVERT" field.
  String? _improundMANUYRCONVERT;
  String get improundMANUYRCONVERT => _improundMANUYRCONVERT ?? '';
  set improundMANUYRCONVERT(String? val) => _improundMANUYRCONVERT = val;

  bool hasImproundMANUYRCONVERT() => _improundMANUYRCONVERT != null;

  // "impoundPrice" field.
  String? _impoundPrice;
  String get impoundPrice => _impoundPrice ?? '';
  set impoundPrice(String? val) => _impoundPrice = val;

  bool hasImpoundPrice() => _impoundPrice != null;

  // "impoundDbName" field.
  String? _impoundDbName;
  String get impoundDbName => _impoundDbName ?? '';
  set impoundDbName(String? val) => _impoundDbName = val;

  bool hasImpoundDbName() => _impoundDbName != null;

  // "impoundDbCode" field.
  String? _impoundDbCode;
  String get impoundDbCode => _impoundDbCode ?? '';
  set impoundDbCode(String? val) => _impoundDbCode = val;

  bool hasImpoundDbCode() => _impoundDbCode != null;

  static ImpoundCarParamSetStruct fromMap(Map<String, dynamic> data) =>
      ImpoundCarParamSetStruct(
        improundCONTNO: data['improundCONTNO'] as String?,
        improundLOCAT: data['improundLOCAT'] as String?,
        improundTITLE: data['improundTITLE'] as String?,
        improundFNAME: data['improundFNAME'] as String?,
        improundSNAME: data['improundSNAME'] as String?,
        improundREGNO: data['improundREGNO'] as String?,
        improundREGPROV: data['improundREGPROV'] as String?,
        improundCONTNOTYPE: data['improundCONTNOTYPE'] as String?,
        improundCONTNOTYPENAME: data['improundCONTNOTYPENAME'] as String?,
        improundGCODE: data['improundGCODE'] as String?,
        improundGDESC: data['improundGDESC'] as String?,
        improundNumbody: data['improundNumbody'] as String?,
        improundCUSCOD: data['improundCUSCOD'] as String?,
        improundARNOW: data['improundARNOW'] as String?,
        improundCONTSTAT: data['improundCONTSTAT'] as String?,
        improundTYPECOD: data['improundTYPECOD'] as String?,
        improundMANUYR: data['improundMANUYR'] as String?,
        improundMODELCOD: data['improundMODELCOD'] as String?,
        improudCOLORCOD: data['improudCOLORCOD'] as String?,
        improundENGNO: data['improundENGNO'] as String?,
        improundKEYINCSHPRC: data['improundKEYINCSHPRC'] as String?,
        improundMANUYRCONVERT: data['improundMANUYRCONVERT'] as String?,
        impoundPrice: data['impoundPrice'] as String?,
        impoundDbName: data['impoundDbName'] as String?,
        impoundDbCode: data['impoundDbCode'] as String?,
      );

  static ImpoundCarParamSetStruct? maybeFromMap(dynamic data) => data is Map
      ? ImpoundCarParamSetStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'improundCONTNO': _improundCONTNO,
        'improundLOCAT': _improundLOCAT,
        'improundTITLE': _improundTITLE,
        'improundFNAME': _improundFNAME,
        'improundSNAME': _improundSNAME,
        'improundREGNO': _improundREGNO,
        'improundREGPROV': _improundREGPROV,
        'improundCONTNOTYPE': _improundCONTNOTYPE,
        'improundCONTNOTYPENAME': _improundCONTNOTYPENAME,
        'improundGCODE': _improundGCODE,
        'improundGDESC': _improundGDESC,
        'improundNumbody': _improundNumbody,
        'improundCUSCOD': _improundCUSCOD,
        'improundARNOW': _improundARNOW,
        'improundCONTSTAT': _improundCONTSTAT,
        'improundTYPECOD': _improundTYPECOD,
        'improundMANUYR': _improundMANUYR,
        'improundMODELCOD': _improundMODELCOD,
        'improudCOLORCOD': _improudCOLORCOD,
        'improundENGNO': _improundENGNO,
        'improundKEYINCSHPRC': _improundKEYINCSHPRC,
        'improundMANUYRCONVERT': _improundMANUYRCONVERT,
        'impoundPrice': _impoundPrice,
        'impoundDbName': _impoundDbName,
        'impoundDbCode': _impoundDbCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'improundCONTNO': serializeParam(
          _improundCONTNO,
          ParamType.String,
        ),
        'improundLOCAT': serializeParam(
          _improundLOCAT,
          ParamType.String,
        ),
        'improundTITLE': serializeParam(
          _improundTITLE,
          ParamType.String,
        ),
        'improundFNAME': serializeParam(
          _improundFNAME,
          ParamType.String,
        ),
        'improundSNAME': serializeParam(
          _improundSNAME,
          ParamType.String,
        ),
        'improundREGNO': serializeParam(
          _improundREGNO,
          ParamType.String,
        ),
        'improundREGPROV': serializeParam(
          _improundREGPROV,
          ParamType.String,
        ),
        'improundCONTNOTYPE': serializeParam(
          _improundCONTNOTYPE,
          ParamType.String,
        ),
        'improundCONTNOTYPENAME': serializeParam(
          _improundCONTNOTYPENAME,
          ParamType.String,
        ),
        'improundGCODE': serializeParam(
          _improundGCODE,
          ParamType.String,
        ),
        'improundGDESC': serializeParam(
          _improundGDESC,
          ParamType.String,
        ),
        'improundNumbody': serializeParam(
          _improundNumbody,
          ParamType.String,
        ),
        'improundCUSCOD': serializeParam(
          _improundCUSCOD,
          ParamType.String,
        ),
        'improundARNOW': serializeParam(
          _improundARNOW,
          ParamType.String,
        ),
        'improundCONTSTAT': serializeParam(
          _improundCONTSTAT,
          ParamType.String,
        ),
        'improundTYPECOD': serializeParam(
          _improundTYPECOD,
          ParamType.String,
        ),
        'improundMANUYR': serializeParam(
          _improundMANUYR,
          ParamType.String,
        ),
        'improundMODELCOD': serializeParam(
          _improundMODELCOD,
          ParamType.String,
        ),
        'improudCOLORCOD': serializeParam(
          _improudCOLORCOD,
          ParamType.String,
        ),
        'improundENGNO': serializeParam(
          _improundENGNO,
          ParamType.String,
        ),
        'improundKEYINCSHPRC': serializeParam(
          _improundKEYINCSHPRC,
          ParamType.String,
        ),
        'improundMANUYRCONVERT': serializeParam(
          _improundMANUYRCONVERT,
          ParamType.String,
        ),
        'impoundPrice': serializeParam(
          _impoundPrice,
          ParamType.String,
        ),
        'impoundDbName': serializeParam(
          _impoundDbName,
          ParamType.String,
        ),
        'impoundDbCode': serializeParam(
          _impoundDbCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImpoundCarParamSetStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ImpoundCarParamSetStruct(
        improundCONTNO: deserializeParam(
          data['improundCONTNO'],
          ParamType.String,
          false,
        ),
        improundLOCAT: deserializeParam(
          data['improundLOCAT'],
          ParamType.String,
          false,
        ),
        improundTITLE: deserializeParam(
          data['improundTITLE'],
          ParamType.String,
          false,
        ),
        improundFNAME: deserializeParam(
          data['improundFNAME'],
          ParamType.String,
          false,
        ),
        improundSNAME: deserializeParam(
          data['improundSNAME'],
          ParamType.String,
          false,
        ),
        improundREGNO: deserializeParam(
          data['improundREGNO'],
          ParamType.String,
          false,
        ),
        improundREGPROV: deserializeParam(
          data['improundREGPROV'],
          ParamType.String,
          false,
        ),
        improundCONTNOTYPE: deserializeParam(
          data['improundCONTNOTYPE'],
          ParamType.String,
          false,
        ),
        improundCONTNOTYPENAME: deserializeParam(
          data['improundCONTNOTYPENAME'],
          ParamType.String,
          false,
        ),
        improundGCODE: deserializeParam(
          data['improundGCODE'],
          ParamType.String,
          false,
        ),
        improundGDESC: deserializeParam(
          data['improundGDESC'],
          ParamType.String,
          false,
        ),
        improundNumbody: deserializeParam(
          data['improundNumbody'],
          ParamType.String,
          false,
        ),
        improundCUSCOD: deserializeParam(
          data['improundCUSCOD'],
          ParamType.String,
          false,
        ),
        improundARNOW: deserializeParam(
          data['improundARNOW'],
          ParamType.String,
          false,
        ),
        improundCONTSTAT: deserializeParam(
          data['improundCONTSTAT'],
          ParamType.String,
          false,
        ),
        improundTYPECOD: deserializeParam(
          data['improundTYPECOD'],
          ParamType.String,
          false,
        ),
        improundMANUYR: deserializeParam(
          data['improundMANUYR'],
          ParamType.String,
          false,
        ),
        improundMODELCOD: deserializeParam(
          data['improundMODELCOD'],
          ParamType.String,
          false,
        ),
        improudCOLORCOD: deserializeParam(
          data['improudCOLORCOD'],
          ParamType.String,
          false,
        ),
        improundENGNO: deserializeParam(
          data['improundENGNO'],
          ParamType.String,
          false,
        ),
        improundKEYINCSHPRC: deserializeParam(
          data['improundKEYINCSHPRC'],
          ParamType.String,
          false,
        ),
        improundMANUYRCONVERT: deserializeParam(
          data['improundMANUYRCONVERT'],
          ParamType.String,
          false,
        ),
        impoundPrice: deserializeParam(
          data['impoundPrice'],
          ParamType.String,
          false,
        ),
        impoundDbName: deserializeParam(
          data['impoundDbName'],
          ParamType.String,
          false,
        ),
        impoundDbCode: deserializeParam(
          data['impoundDbCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImpoundCarParamSetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImpoundCarParamSetStruct &&
        improundCONTNO == other.improundCONTNO &&
        improundLOCAT == other.improundLOCAT &&
        improundTITLE == other.improundTITLE &&
        improundFNAME == other.improundFNAME &&
        improundSNAME == other.improundSNAME &&
        improundREGNO == other.improundREGNO &&
        improundREGPROV == other.improundREGPROV &&
        improundCONTNOTYPE == other.improundCONTNOTYPE &&
        improundCONTNOTYPENAME == other.improundCONTNOTYPENAME &&
        improundGCODE == other.improundGCODE &&
        improundGDESC == other.improundGDESC &&
        improundNumbody == other.improundNumbody &&
        improundCUSCOD == other.improundCUSCOD &&
        improundARNOW == other.improundARNOW &&
        improundCONTSTAT == other.improundCONTSTAT &&
        improundTYPECOD == other.improundTYPECOD &&
        improundMANUYR == other.improundMANUYR &&
        improundMODELCOD == other.improundMODELCOD &&
        improudCOLORCOD == other.improudCOLORCOD &&
        improundENGNO == other.improundENGNO &&
        improundKEYINCSHPRC == other.improundKEYINCSHPRC &&
        improundMANUYRCONVERT == other.improundMANUYRCONVERT &&
        impoundPrice == other.impoundPrice &&
        impoundDbName == other.impoundDbName &&
        impoundDbCode == other.impoundDbCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        improundCONTNO,
        improundLOCAT,
        improundTITLE,
        improundFNAME,
        improundSNAME,
        improundREGNO,
        improundREGPROV,
        improundCONTNOTYPE,
        improundCONTNOTYPENAME,
        improundGCODE,
        improundGDESC,
        improundNumbody,
        improundCUSCOD,
        improundARNOW,
        improundCONTSTAT,
        improundTYPECOD,
        improundMANUYR,
        improundMODELCOD,
        improudCOLORCOD,
        improundENGNO,
        improundKEYINCSHPRC,
        improundMANUYRCONVERT,
        impoundPrice,
        impoundDbName,
        impoundDbCode
      ]);
}

ImpoundCarParamSetStruct createImpoundCarParamSetStruct({
  String? improundCONTNO,
  String? improundLOCAT,
  String? improundTITLE,
  String? improundFNAME,
  String? improundSNAME,
  String? improundREGNO,
  String? improundREGPROV,
  String? improundCONTNOTYPE,
  String? improundCONTNOTYPENAME,
  String? improundGCODE,
  String? improundGDESC,
  String? improundNumbody,
  String? improundCUSCOD,
  String? improundARNOW,
  String? improundCONTSTAT,
  String? improundTYPECOD,
  String? improundMANUYR,
  String? improundMODELCOD,
  String? improudCOLORCOD,
  String? improundENGNO,
  String? improundKEYINCSHPRC,
  String? improundMANUYRCONVERT,
  String? impoundPrice,
  String? impoundDbName,
  String? impoundDbCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImpoundCarParamSetStruct(
      improundCONTNO: improundCONTNO,
      improundLOCAT: improundLOCAT,
      improundTITLE: improundTITLE,
      improundFNAME: improundFNAME,
      improundSNAME: improundSNAME,
      improundREGNO: improundREGNO,
      improundREGPROV: improundREGPROV,
      improundCONTNOTYPE: improundCONTNOTYPE,
      improundCONTNOTYPENAME: improundCONTNOTYPENAME,
      improundGCODE: improundGCODE,
      improundGDESC: improundGDESC,
      improundNumbody: improundNumbody,
      improundCUSCOD: improundCUSCOD,
      improundARNOW: improundARNOW,
      improundCONTSTAT: improundCONTSTAT,
      improundTYPECOD: improundTYPECOD,
      improundMANUYR: improundMANUYR,
      improundMODELCOD: improundMODELCOD,
      improudCOLORCOD: improudCOLORCOD,
      improundENGNO: improundENGNO,
      improundKEYINCSHPRC: improundKEYINCSHPRC,
      improundMANUYRCONVERT: improundMANUYRCONVERT,
      impoundPrice: impoundPrice,
      impoundDbName: impoundDbName,
      impoundDbCode: impoundDbCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImpoundCarParamSetStruct? updateImpoundCarParamSetStruct(
  ImpoundCarParamSetStruct? impoundCarParamSet, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    impoundCarParamSet
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImpoundCarParamSetStructData(
  Map<String, dynamic> firestoreData,
  ImpoundCarParamSetStruct? impoundCarParamSet,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (impoundCarParamSet == null) {
    return;
  }
  if (impoundCarParamSet.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && impoundCarParamSet.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final impoundCarParamSetData =
      getImpoundCarParamSetFirestoreData(impoundCarParamSet, forFieldValue);
  final nestedData =
      impoundCarParamSetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      impoundCarParamSet.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImpoundCarParamSetFirestoreData(
  ImpoundCarParamSetStruct? impoundCarParamSet, [
  bool forFieldValue = false,
]) {
  if (impoundCarParamSet == null) {
    return {};
  }
  final firestoreData = mapToFirestore(impoundCarParamSet.toMap());

  // Add any Firestore field values
  impoundCarParamSet.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImpoundCarParamSetListFirestoreData(
  List<ImpoundCarParamSetStruct>? impoundCarParamSets,
) =>
    impoundCarParamSets
        ?.map((e) => getImpoundCarParamSetFirestoreData(e, true))
        .toList() ??
    [];
