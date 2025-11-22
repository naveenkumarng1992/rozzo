import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'question_page_review_widget.dart' show QuestionPageReviewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuestionPageReviewModel
    extends FlutterFlowModel<QuestionPageReviewWidget> {
  ///  Local state fields for this page.

  bool isanswerselected = false;

  bool ischeckselected = false;

  bool correctanswer = false;

  String selectedoption = 'selcted_option';

  bool correctanswerdialoguebox = false;

  bool wronganswerdialoguebox = false;

  int questionnunmber = 1;

  String refreshpage = 'refresh';

  int? timetaken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
