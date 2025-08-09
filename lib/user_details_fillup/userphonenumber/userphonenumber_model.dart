import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'userphonenumber_widget.dart' show UserphonenumberWidget;
import 'package:flutter/material.dart';

class UserphonenumberModel extends FlutterFlowModel<UserphonenumberWidget> {
  ///  Local state fields for this page.

  String? phonenumber;

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
