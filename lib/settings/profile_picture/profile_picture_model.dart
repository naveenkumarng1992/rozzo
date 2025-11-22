import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'profile_picture_widget.dart' show ProfilePictureWidget;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePictureModel extends FlutterFlowModel<ProfilePictureWidget> {
  ///  Local state fields for this page.

  String profilepicture =
      'https://wynwfipbypahdzczidep.supabase.co/storage/v1/object/public/profilepicture/Girls/2ace4a95484caba4164f8e2198823f31.jpg';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  /// Query cache managers for this widget.

  final _girlsProfilePictureManager =
      FutureRequestManager<List<ProfilePictureGirlsRow>>();
  Future<List<ProfilePictureGirlsRow>> girlsProfilePicture({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProfilePictureGirlsRow>> Function() requestFn,
  }) =>
      _girlsProfilePictureManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGirlsProfilePictureCache() => _girlsProfilePictureManager.clear();
  void clearGirlsProfilePictureCacheKey(String? uniqueKey) =>
      _girlsProfilePictureManager.clearRequest(uniqueKey);

  final _boysProfilePictureManager =
      FutureRequestManager<List<ProfilePictureBoysRow>>();
  Future<List<ProfilePictureBoysRow>> boysProfilePicture({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProfilePictureBoysRow>> Function() requestFn,
  }) =>
      _boysProfilePictureManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBoysProfilePictureCache() => _boysProfilePictureManager.clear();
  void clearBoysProfilePictureCacheKey(String? uniqueKey) =>
      _boysProfilePictureManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearGirlsProfilePictureCache();

    clearBoysProfilePictureCache();
  }
}
