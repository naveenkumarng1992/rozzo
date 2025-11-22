import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/needheartopractise_widget.dart';
import '/components/nextlesson1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'home_page_copypagestatequery_widget.dart'
    show HomePageCopypagestatequeryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageCopypagestatequeryModel
    extends FlutterFlowModel<HomePageCopypagestatequeryWidget> {
  ///  Local state fields for this page.

  List<AnatomyUnitDetailRow> unitvariable = [];
  void addToUnitvariable(AnatomyUnitDetailRow item) => unitvariable.add(item);
  void removeFromUnitvariable(AnatomyUnitDetailRow item) =>
      unitvariable.remove(item);
  void removeAtIndexFromUnitvariable(int index) => unitvariable.removeAt(index);
  void insertAtIndexInUnitvariable(int index, AnatomyUnitDetailRow item) =>
      unitvariable.insert(index, item);
  void updateUnitvariableAtIndex(
          int index, Function(AnatomyUnitDetailRow) updateFn) =>
      unitvariable[index] = updateFn(unitvariable[index]);

  List<AnatomyLevelDetailRow> levelvariable = [];
  void addToLevelvariable(AnatomyLevelDetailRow item) =>
      levelvariable.add(item);
  void removeFromLevelvariable(AnatomyLevelDetailRow item) =>
      levelvariable.remove(item);
  void removeAtIndexFromLevelvariable(int index) =>
      levelvariable.removeAt(index);
  void insertAtIndexInLevelvariable(int index, AnatomyLevelDetailRow item) =>
      levelvariable.insert(index, item);
  void updateLevelvariableAtIndex(
          int index, Function(AnatomyLevelDetailRow) updateFn) =>
      levelvariable[index] = updateFn(levelvariable[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePageCopypagestatequery widget.
  List<AnatomyUnitDetailRow>? psUnits;
  // Stores action output result for [Backend Call - Query Rows] action in HomePageCopypagestatequery widget.
  List<ChallengeUserChallengeRow>? userchallenges;
  // Stores action output result for [Backend Call - Query Rows] action in HomePageCopypagestatequery widget.
  List<UserDetailsRow>? noofhearts;
  // Stores action output result for [Backend Call - Query Rows] action in HomePageCopypagestatequery widget.
  List<AnatomyUnitDetailRow>? queryforunits;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UserProgressRow>? querytocheckiflesson5iscompletedforreview;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
