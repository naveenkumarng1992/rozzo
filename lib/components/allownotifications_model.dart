import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'allownotifications_widget.dart' show AllownotificationsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllownotificationsModel
    extends FlutterFlowModel<AllownotificationsWidget> {
  ///  Local state fields for this component.

  bool notnowselected = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? querytoupdatefcmtoken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
