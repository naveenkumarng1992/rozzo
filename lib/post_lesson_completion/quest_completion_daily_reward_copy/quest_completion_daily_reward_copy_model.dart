import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'quest_completion_daily_reward_copy_widget.dart'
    show QuestCompletionDailyRewardCopyWidget;
import 'package:flutter/material.dart';

class QuestCompletionDailyRewardCopyModel
    extends FlutterFlowModel<QuestCompletionDailyRewardCopyWidget> {
  ///  Local state fields for this page.

  String? updatepagestate;

  ///  State fields for stateful widgets in this page.

  Completer<List<ChallengeUserChallengeRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
