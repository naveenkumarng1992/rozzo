import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_user_country_widget.dart' show ChangeUserCountryWidget;
import 'package:flutter/material.dart';

class ChangeUserCountryModel extends FlutterFlowModel<ChangeUserCountryWidget> {
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
