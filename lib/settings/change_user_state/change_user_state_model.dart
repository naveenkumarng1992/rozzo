import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_user_state_widget.dart' show ChangeUserStateWidget;
import 'package:flutter/material.dart';

class ChangeUserStateModel extends FlutterFlowModel<ChangeUserStateWidget> {
  ///  Local state fields for this page.

  int? stateidchosen;

  String statename = 'statename';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in Column widget.
  List<UserDetailsRow>? updatestateofuser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
