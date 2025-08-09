import '/flutter_flow/flutter_flow_util.dart';
import 'user_leaderboard_page_copy_widget.dart'
    show UserLeaderboardPageCopyWidget;
import 'package:flutter/material.dart';

class UserLeaderboardPageCopyModel
    extends FlutterFlowModel<UserLeaderboardPageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
