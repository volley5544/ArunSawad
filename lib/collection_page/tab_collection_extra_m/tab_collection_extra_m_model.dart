import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/data_not_found_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'tab_collection_extra_m_widget.dart' show TabCollectionExtraMWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TabCollectionExtraMModel
    extends FlutterFlowModel<TabCollectionExtraMWidget> {
  ///  Local state fields for this page.

  List<CollectionTabMDataModelStruct> dataTab = [];
  void addToDataTab(CollectionTabMDataModelStruct item) => dataTab.add(item);
  void removeFromDataTab(CollectionTabMDataModelStruct item) =>
      dataTab.remove(item);
  void removeAtIndexFromDataTab(int index) => dataTab.removeAt(index);
  void insertAtIndexInDataTab(int index, CollectionTabMDataModelStruct item) =>
      dataTab.insert(index, item);
  void updateDataTabAtIndex(
          int index, Function(CollectionTabMDataModelStruct) updateFn) =>
      dataTab[index] = updateFn(dataTab[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in tabCollectionExtraM widget.
  UrlLinkStorageRecord? queryBranchViewApiUrlUat;
  // Stores action output result for [Backend Call - API (collectionApiGetDataCount ExtraM)] action in tabCollectionExtraM widget.
  ApiCallResponse? collectionApiGetdataCountM;
  // Model for appbarFollowUpDebt component.
  late AppbarFollowUpDebtModel appbarFollowUpDebtModel;

  @override
  void initState(BuildContext context) {
    appbarFollowUpDebtModel =
        createModel(context, () => AppbarFollowUpDebtModel());
  }

  @override
  void dispose() {
    appbarFollowUpDebtModel.dispose();
  }
}
