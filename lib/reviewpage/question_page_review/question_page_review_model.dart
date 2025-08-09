import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'question_page_review_widget.dart' show QuestionPageReviewWidget;
import 'package:flutter/material.dart';

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
