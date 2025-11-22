import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'testpageformultiquestions_widget.dart'
    show TestpageformultiquestionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestpageformultiquestionsModel
    extends FlutterFlowModel<TestpageformultiquestionsWidget> {
  ///  Local state fields for this page.

  List<dynamic> matchleftoptions = [];
  void addToMatchleftoptions(dynamic item) => matchleftoptions.add(item);
  void removeFromMatchleftoptions(dynamic item) =>
      matchleftoptions.remove(item);
  void removeAtIndexFromMatchleftoptions(int index) =>
      matchleftoptions.removeAt(index);
  void insertAtIndexInMatchleftoptions(int index, dynamic item) =>
      matchleftoptions.insert(index, item);
  void updateMatchleftoptionsAtIndex(int index, Function(dynamic) updateFn) =>
      matchleftoptions[index] = updateFn(matchleftoptions[index]);

  List<dynamic> matchrightoptions = [];
  void addToMatchrightoptions(dynamic item) => matchrightoptions.add(item);
  void removeFromMatchrightoptions(dynamic item) =>
      matchrightoptions.remove(item);
  void removeAtIndexFromMatchrightoptions(int index) =>
      matchrightoptions.removeAt(index);
  void insertAtIndexInMatchrightoptions(int index, dynamic item) =>
      matchrightoptions.insert(index, item);
  void updateMatchrightoptionsAtIndex(int index, Function(dynamic) updateFn) =>
      matchrightoptions[index] = updateFn(matchrightoptions[index]);

  int? matchselectedleftid;

  int? matchselectedrightid;

  List<int> matchlockedleftids = [];
  void addToMatchlockedleftids(int item) => matchlockedleftids.add(item);
  void removeFromMatchlockedleftids(int item) =>
      matchlockedleftids.remove(item);
  void removeAtIndexFromMatchlockedleftids(int index) =>
      matchlockedleftids.removeAt(index);
  void insertAtIndexInMatchlockedleftids(int index, int item) =>
      matchlockedleftids.insert(index, item);
  void updateMatchlockedleftidsAtIndex(int index, Function(int) updateFn) =>
      matchlockedleftids[index] = updateFn(matchlockedleftids[index]);

  List<int> matchlockedrightids = [];
  void addToMatchlockedrightids(int item) => matchlockedrightids.add(item);
  void removeFromMatchlockedrightids(int item) =>
      matchlockedrightids.remove(item);
  void removeAtIndexFromMatchlockedrightids(int index) =>
      matchlockedrightids.removeAt(index);
  void insertAtIndexInMatchlockedrightids(int index, int item) =>
      matchlockedrightids.insert(index, item);
  void updateMatchlockedrightidsAtIndex(int index, Function(int) updateFn) =>
      matchlockedrightids[index] = updateFn(matchlockedrightids[index]);

  List<dynamic> multiselectoptionstest = [];
  void addToMultiselectoptionstest(dynamic item) =>
      multiselectoptionstest.add(item);
  void removeFromMultiselectoptionstest(dynamic item) =>
      multiselectoptionstest.remove(item);
  void removeAtIndexFromMultiselectoptionstest(int index) =>
      multiselectoptionstest.removeAt(index);
  void insertAtIndexInMultiselectoptionstest(int index, dynamic item) =>
      multiselectoptionstest.insert(index, item);
  void updateMultiselectoptionstestAtIndex(
          int index, Function(dynamic) updateFn) =>
      multiselectoptionstest[index] = updateFn(multiselectoptionstest[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in testpageformultiquestions widget.
  List<QuestionsTestRow>? left1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
