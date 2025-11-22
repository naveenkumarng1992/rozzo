import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'change_user_college_widget.dart' show ChangeUserCollegeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeUserCollegeModel extends FlutterFlowModel<ChangeUserCollegeWidget> {
  ///  Local state fields for this page.

  int? college;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<LeaderboardUserRankInTheGroupRow>? filteruseridforcolledupdation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
