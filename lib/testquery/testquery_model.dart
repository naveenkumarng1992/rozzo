import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'testquery_widget.dart' show TestqueryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestqueryModel extends FlutterFlowModel<TestqueryWidget> {
  ///  Local state fields for this page.

  List<int> unitnumber = [];
  void addToUnitnumber(int item) => unitnumber.add(item);
  void removeFromUnitnumber(int item) => unitnumber.remove(item);
  void removeAtIndexFromUnitnumber(int index) => unitnumber.removeAt(index);
  void insertAtIndexInUnitnumber(int index, int item) =>
      unitnumber.insert(index, item);
  void updateUnitnumberAtIndex(int index, Function(int) updateFn) =>
      unitnumber[index] = updateFn(unitnumber[index]);

  List<String> unitname = [];
  void addToUnitname(String item) => unitname.add(item);
  void removeFromUnitname(String item) => unitname.remove(item);
  void removeAtIndexFromUnitname(int index) => unitname.removeAt(index);
  void insertAtIndexInUnitname(int index, String item) =>
      unitname.insert(index, item);
  void updateUnitnameAtIndex(int index, Function(String) updateFn) =>
      unitname[index] = updateFn(unitname[index]);

  List<AnatomyLevelDetailRow> level = [];
  void addToLevel(AnatomyLevelDetailRow item) => level.add(item);
  void removeFromLevel(AnatomyLevelDetailRow item) => level.remove(item);
  void removeAtIndexFromLevel(int index) => level.removeAt(index);
  void insertAtIndexInLevel(int index, AnatomyLevelDetailRow item) =>
      level.insert(index, item);
  void updateLevelAtIndex(
          int index, Function(AnatomyLevelDetailRow) updateFn) =>
      level[index] = updateFn(level[index]);

  List<AnatomyUnitDetailRow> unit2 = [];
  void addToUnit2(AnatomyUnitDetailRow item) => unit2.add(item);
  void removeFromUnit2(AnatomyUnitDetailRow item) => unit2.remove(item);
  void removeAtIndexFromUnit2(int index) => unit2.removeAt(index);
  void insertAtIndexInUnit2(int index, AnatomyUnitDetailRow item) =>
      unit2.insert(index, item);
  void updateUnit2AtIndex(int index, Function(AnatomyUnitDetailRow) updateFn) =>
      unit2[index] = updateFn(unit2[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in testquery widget.
  List<AnatomyUnitDetailRow>? unit;
  // Stores action output result for [Backend Call - Query Rows] action in testquery widget.
  List<AnatomyLevelDetailRow>? levelquery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
