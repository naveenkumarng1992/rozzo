import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'userbatchyear_widget.dart' show UserbatchyearWidget;
import 'package:flutter/material.dart';

class UserbatchyearModel extends FlutterFlowModel<UserbatchyearWidget> {
  ///  Local state fields for this page.

  String? batchyear = '2020';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? username;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
