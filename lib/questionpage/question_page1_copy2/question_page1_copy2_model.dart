import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/needheartopractise_widget.dart';
import '/components/questionbasedfeedback_widget.dart';
import '/components/theory_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'question_page1_copy2_widget.dart' show QuestionPage1Copy2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuestionPage1Copy2Model
    extends FlutterFlowModel<QuestionPage1Copy2Widget> {
  ///  Local state fields for this page.

  bool isanswerselected = false;

  bool ischeckselected = false;

  bool iscorrectanswer = false;

  String selectedoption = 'option selected';

  bool correctanswerdialoguebox = false;

  bool wronganswerdialoguebox = false;

  String refreshpage = 'page updated';

  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AnatomyUnitDetailRow>? checkcurrentlevelnoistotalnooflevels;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<SectionDetailRow>? checknoofunitsanatomy;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? activeandcompletesection;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? querytoupdatesectionxp;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? activebutnotcompletesection;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? querytoupdateunitxp;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? activebutnotcompleteunit;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? querytoupdatlevelexp;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? updatereviewnumberforlessonupdate;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? updateuserprogress;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? querytoupdatelessonxp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
