import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
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
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'question_page_clinicalcases_widget.dart'
    show QuestionPageClinicalcasesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuestionPageClinicalcasesModel
    extends FlutterFlowModel<QuestionPageClinicalcasesWidget> {
  ///  Local state fields for this page.

  bool isanswerselected = false;

  bool ischeckselected = false;

  bool iscorrectanswer = false;

  String selectedoption = 'option selected';

  bool correctanswerdialoguebox = false;

  bool wronganswerdialoguebox = false;

  String refreshpage = 'page updated';

  String? mcqSelected;

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

  List<int> multiselectselectedoptionids = [];
  void addToMultiselectselectedoptionids(int item) =>
      multiselectselectedoptionids.add(item);
  void removeFromMultiselectselectedoptionids(int item) =>
      multiselectselectedoptionids.remove(item);
  void removeAtIndexFromMultiselectselectedoptionids(int index) =>
      multiselectselectedoptionids.removeAt(index);
  void insertAtIndexInMultiselectselectedoptionids(int index, int item) =>
      multiselectselectedoptionids.insert(index, item);
  void updateMultiselectselectedoptionidsAtIndex(
          int index, Function(int) updateFn) =>
      multiselectselectedoptionids[index] =
          updateFn(multiselectselectedoptionids[index]);

  List<int> multiselectcorrectoptionids = [];
  void addToMultiselectcorrectoptionids(int item) =>
      multiselectcorrectoptionids.add(item);
  void removeFromMultiselectcorrectoptionids(int item) =>
      multiselectcorrectoptionids.remove(item);
  void removeAtIndexFromMultiselectcorrectoptionids(int index) =>
      multiselectcorrectoptionids.removeAt(index);
  void insertAtIndexInMultiselectcorrectoptionids(int index, int item) =>
      multiselectcorrectoptionids.insert(index, item);
  void updateMultiselectcorrectoptionidsAtIndex(
          int index, Function(int) updateFn) =>
      multiselectcorrectoptionids[index] =
          updateFn(multiselectcorrectoptionids[index]);

  List<dynamic> multiselectoptionlist = [];
  void addToMultiselectoptionlist(dynamic item) =>
      multiselectoptionlist.add(item);
  void removeFromMultiselectoptionlist(dynamic item) =>
      multiselectoptionlist.remove(item);
  void removeAtIndexFromMultiselectoptionlist(int index) =>
      multiselectoptionlist.removeAt(index);
  void insertAtIndexInMultiselectoptionlist(int index, dynamic item) =>
      multiselectoptionlist.insert(index, item);
  void updateMultiselectoptionlistAtIndex(
          int index, Function(dynamic) updateFn) =>
      multiselectoptionlist[index] = updateFn(multiselectoptionlist[index]);

  String? questiontype;

  int? mcqtruefalseselectedoptions;

  dynamic mcqtruefalsecorrectoption;

  bool wrongansweralreadyselected = false;

  bool showhint = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in QuestionPageClinicalcases widget.
  List<AnatomyQuestionDetailsRow>? queryformultiselect;
  // Stores action output result for [Backend Call - Query Rows] action in QuestionPageClinicalcases widget.
  List<AnatomyQuestionDetailsRow>? updatequestiontype;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;
  AudioPlayer? soundPlayer5;
  AudioPlayer? soundPlayer6;
  // Stores action output result for [Backend Call - Query Rows] action in Buttondialogue widget.
  List<AnatomyUnitDetailRow>? checkcurrentlevelnoistotalnooflevelsdialogue;
  // Stores action output result for [Backend Call - Query Rows] action in Buttondialogue widget.
  List<SectionDetailRow>? checknoofunitsanatomyDialogueCopy;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserProgressRow>? activeandcompletesectionCopy1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserDetailsRow>? querytoupdatesectionxpCopy1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserProgressRow>? activebutnotcompletesectionCopy1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserDetailsRow>? querytoupdateunitxpCopy1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserProgressRow>? activebutnotcompleteunitCopy1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserDetailsRow>? querytoupdatlevelexpCopy1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserProgressRow>? updatereviewnumberforlessonupdateCopy1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserProgressRow>? updateuserprogressCopy2;
  // Stores action output result for [Backend Call - Update Row(s)] action in Buttondialogue widget.
  List<UserDetailsRow>? querytoupdatelessonxpCopy1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
