import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_country_list_widget.dart' show UserCountryListWidget;
import 'package:flutter/material.dart';

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
