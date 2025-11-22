import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'questionformat_matchthfollowing_widget.dart'
    show QuestionformatMatchthfollowingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionformatMatchthfollowingModel
    extends FlutterFlowModel<QuestionformatMatchthfollowingWidget> {
  ///  Local state fields for this component.

  List<dynamic> matchleftJson = [];
  void addToMatchleftJson(dynamic item) => matchleftJson.add(item);
  void removeFromMatchleftJson(dynamic item) => matchleftJson.remove(item);
  void removeAtIndexFromMatchleftJson(int index) =>
      matchleftJson.removeAt(index);
  void insertAtIndexInMatchleftJson(int index, dynamic item) =>
      matchleftJson.insert(index, item);
  void updateMatchleftJsonAtIndex(int index, Function(dynamic) updateFn) =>
      matchleftJson[index] = updateFn(matchleftJson[index]);

  List<dynamic> matchrightJson = [];
  void addToMatchrightJson(dynamic item) => matchrightJson.add(item);
  void removeFromMatchrightJson(dynamic item) => matchrightJson.remove(item);
  void removeAtIndexFromMatchrightJson(int index) =>
      matchrightJson.removeAt(index);
  void insertAtIndexInMatchrightJson(int index, dynamic item) =>
      matchrightJson.insert(index, item);
  void updateMatchrightJsonAtIndex(int index, Function(dynamic) updateFn) =>
      matchrightJson[index] = updateFn(matchrightJson[index]);

  String? matchselectedLeftId;

  List<String> matchlockedLeftIds = [];
  void addToMatchlockedLeftIds(String item) => matchlockedLeftIds.add(item);
  void removeFromMatchlockedLeftIds(String item) =>
      matchlockedLeftIds.remove(item);
  void removeAtIndexFromMatchlockedLeftIds(int index) =>
      matchlockedLeftIds.removeAt(index);
  void insertAtIndexInMatchlockedLeftIds(int index, String item) =>
      matchlockedLeftIds.insert(index, item);
  void updateMatchlockedLeftIdsAtIndex(int index, Function(String) updateFn) =>
      matchlockedLeftIds[index] = updateFn(matchlockedLeftIds[index]);

  List<String> matchlockedRightIds = [];
  void addToMatchlockedRightIds(String item) => matchlockedRightIds.add(item);
  void removeFromMatchlockedRightIds(String item) =>
      matchlockedRightIds.remove(item);
  void removeAtIndexFromMatchlockedRightIds(int index) =>
      matchlockedRightIds.removeAt(index);
  void insertAtIndexInMatchlockedRightIds(int index, String item) =>
      matchlockedRightIds.insert(index, item);
  void updateMatchlockedRightIdsAtIndex(int index, Function(String) updateFn) =>
      matchlockedRightIds[index] = updateFn(matchlockedRightIds[index]);

  bool hasSelection = false;

  String? matchselectedRightId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
