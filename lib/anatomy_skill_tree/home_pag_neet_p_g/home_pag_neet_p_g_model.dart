import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'home_pag_neet_p_g_widget.dart' show HomePagNeetPGWidget;
import 'package:flutter/material.dart';

class HomePagNeetPGModel extends FlutterFlowModel<HomePagNeetPGWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePag_NeetPG widget.
  List<ChallengeUserChallengeRow>? userchallenges;
  // Stores action output result for [Backend Call - Query Rows] action in HomePag_NeetPG widget.
  List<UserDetailsRow>? noofhearts;
  // Stores action output result for [Backend Call - Query Rows] action in HomePag_NeetPG widget.
  List<LeaderboardUserRankInTheGroupRow>? appstateleaderboardbefore;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UserProgressRow>? querytocheckiflesson5iscompletedforreview;

  /// Query cache managers for this widget.

  final _unitQueryManager = FutureRequestManager<List<AnatomyUnitDetailRow>>();
  Future<List<AnatomyUnitDetailRow>> unitQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AnatomyUnitDetailRow>> Function() requestFn,
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
