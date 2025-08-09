import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'question_page1_widget.dart' show QuestionPage1Widget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class QuestionPage1Model extends FlutterFlowModel<QuestionPage1Widget> {
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
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? activeandcompletesectionneetpgpyq;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? querytoupdatesectionxpneetpgpyq;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? activebutnotcompleteunitpyqpg;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? querytoupdatlevelexppyqpg;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? updatereviewnumberforlessonupdateneetpgpyq;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserProgressRow>? updateuserprogressneetpgpyq;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? querytoupdatelessonxpneetpgpys;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
