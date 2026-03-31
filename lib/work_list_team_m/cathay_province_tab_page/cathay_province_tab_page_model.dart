import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cathay_province_tab_page_widget.dart' show CathayProvinceTabPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CathayProvinceTabPageModel
    extends FlutterFlowModel<CathayProvinceTabPageWidget> {
  ///  Local state fields for this page.

  List<CollectionTabMDataModelStruct> dataTabM = [];
  void addToDataTabM(CollectionTabMDataModelStruct item) => dataTabM.add(item);
  void removeFromDataTabM(CollectionTabMDataModelStruct item) =>
      dataTabM.remove(item);
  void removeAtIndexFromDataTabM(int index) => dataTabM.removeAt(index);
  void insertAtIndexInDataTabM(int index, CollectionTabMDataModelStruct item) =>
      dataTabM.insert(index, item);
  void updateDataTabMAtIndex(
          int index, Function(CollectionTabMDataModelStruct) updateFn) =>
      dataTabM[index] = updateFn(dataTabM[index]);

  List<String> choicechipsData = [];
  void addToChoicechipsData(String item) => choicechipsData.add(item);
  void removeFromChoicechipsData(String item) => choicechipsData.remove(item);
  void removeAtIndexFromChoicechipsData(int index) =>
      choicechipsData.removeAt(index);
  void insertAtIndexInChoicechipsData(int index, String item) =>
      choicechipsData.insert(index, item);
  void updateChoicechipsDataAtIndex(int index, Function(String) updateFn) =>
      choicechipsData[index] = updateFn(choicechipsData[index]);

  List<CollectionTabMDataModelStruct> showingData = [];
  void addToShowingData(CollectionTabMDataModelStruct item) =>
      showingData.add(item);
  void removeFromShowingData(CollectionTabMDataModelStruct item) =>
      showingData.remove(item);
  void removeAtIndexFromShowingData(int index) => showingData.removeAt(index);
  void insertAtIndexInShowingData(
          int index, CollectionTabMDataModelStruct item) =>
      showingData.insert(index, item);
  void updateShowingDataAtIndex(
          int index, Function(CollectionTabMDataModelStruct) updateFn) =>
      showingData[index] = updateFn(showingData[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
