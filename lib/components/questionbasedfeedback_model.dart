import '/flutter_flow/flutter_flow_util.dart';
import 'questionbasedfeedback_widget.dart' show QuestionbasedfeedbackWidget;
import 'package:flutter/material.dart';

class QuestionbasedfeedbackModel
    extends FlutterFlowModel<QuestionbasedfeedbackWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
