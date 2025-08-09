import '/flutter_flow/flutter_flow_util.dart';
import 'user_leaderboard_page_widget.dart' show UserLeaderboardPageWidget;
import 'package:flutter/material.dart';

class UserLeaderboardPageModel
    extends FlutterFlowModel<UserLeaderboardPageWidget> {
  ///  Local state fields for this page.

  int? promotioncutoff = 0;

  int? demotioncutoff = 0;

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
