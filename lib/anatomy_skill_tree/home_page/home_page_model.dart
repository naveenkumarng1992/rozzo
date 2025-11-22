import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choosecourse_widget.dart';
import '/components/lessonslocked_widget.dart';
import '/components/needheartopractise_widget.dart';
import '/components/nextlesson1_widget.dart';
import '/components/review_lesson_widget.dart';
import '/components/user_guide_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<ChallengeUserChallengeRow>? userchallenges;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<UserDetailsRow>? noofhearts;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<LeaderboardUserRankInTheGroupRow>? appstateleaderboardbefore;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UserProgressRow>? querytocheckiflesson5iscompletedforreview;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UserProgressRow>? querytocheckiflesson5iscompletedforreviewneetpgpyq;

  /// Query cache managers for this widget.

  final _unitQueryManager =
      FutureRequestManager<List<AnatomyQuestionDetailsRow>>();
  Future<List<AnatomyQuestionDetailsRow>> unitQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AnatomyQuestionDetailsRow>> Function() requestFn,
  }) =>
      _unitQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUnitQueryCache() => _unitQueryManager.clear();
  void clearUnitQueryCacheKey(String? uniqueKey) =>
      _unitQueryManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearUnitQueryCache();
  }
}
