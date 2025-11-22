import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'user_country_list_widget.dart' show UserCountryListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserCountryListModel extends FlutterFlowModel<UserCountryListWidget> {
  ///  Local state fields for this page.

  int? countryidchosen;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UserDetailsRow>? filterusertoupdatecountry;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<LeaderboardUserRankInTheGroupRow>? updatecountry;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
