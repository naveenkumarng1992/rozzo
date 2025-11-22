import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'testmultiselect_widget.dart' show TestmultiselectWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestmultiselectModel extends FlutterFlowModel<TestmultiselectWidget> {
  ///  Local state fields for this page.

  List<dynamic> optionsselect = [];
  void addToOptionsselect(dynamic item) => optionsselect.add(item);
  void removeFromOptionsselect(dynamic item) => optionsselect.remove(item);
  void removeAtIndexFromOptionsselect(int index) =>
      optionsselect.removeAt(index);
  void insertAtIndexInOptionsselect(int index, dynamic item) =>
      optionsselect.insert(index, item);
  void updateOptionsselectAtIndex(int index, Function(dynamic) updateFn) =>
      optionsselect[index] = updateFn(optionsselect[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in testmultiselect widget.
  List<QuestionsTestRow>? testquery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
