import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'lesson_completed_page_widget.dart' show LessonCompletedPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LessonCompletedPageModel
    extends FlutterFlowModel<LessonCompletedPageWidget> {
  ///  Local state fields for this page.

  String isactivateiscompleted = 'true';

  int? weeklyxp = 1;

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<StreakUserStreakRow>? updatelastactiveat;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChallengeUserChallengeRow>? challengetype2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChallengeUserChallengeRow>? challengetype3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChallengeUserChallengeRow>? challengtype4;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ChallengeUserChallengeRow>? challengetype5;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<StreakUserStreakRow>? updatecurrentstreak;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
