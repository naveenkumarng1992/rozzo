import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_profile_picture_model.dart';
export 'confirm_profile_picture_model.dart';

class ConfirmProfilePictureWidget extends StatefulWidget {
  const ConfirmProfilePictureWidget({
    super.key,
    this.profile,
  });

  final String? profile;

  static String routeName = 'confirm_profile_picture';
  static String routePath = '/confirmProfilePicture';

  @override
  State<ConfirmProfilePictureWidget> createState() =>
      _ConfirmProfilePictureWidgetState();
}

class _ConfirmProfilePictureWidgetState
    extends State<ConfirmProfilePictureWidget> {
  late ConfirmProfilePictureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmProfilePictureModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'confirm_profile_picture'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CONFIRM_PROFILE_PICTURE_Icon_wx9i4fn9_ON');
                          logFirebaseEvent('Icon_navigate_to');

                          context.pushNamed(
                            ProfilePictureWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.leftToRight,
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 600.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          widget!.profile!,
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'CONFIRM_PROFILE_PICTURE_CONFIRM_BTN_ON_T');
                      logFirebaseEvent('Button_backend_call');
                      await UserDetailsTable().update(
                        data: {
                          'profile_picture_url': widget!.profile,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'user_id',
                          currentUserUid,
                        ),
                      );
                      logFirebaseEvent('Button_backend_call');
                      await LeaderboardUserRankInTheGroupTable().update(
                        data: {
                          'profile_picture': widget!.profile,
                        },
                        matchingRows: (rows) => rows.eqOrNull(
                          'user_id',
                          currentUserUid,
                        ),
                      );
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(UserDetailsWidget.routeName);
                    },
                    text: 'Confirm',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ].divide(SizedBox(height: 25.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
