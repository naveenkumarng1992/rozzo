import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reward_page_model.dart';
export 'reward_page_model.dart';

class RewardPageWidget extends StatefulWidget {
  const RewardPageWidget({super.key});

  static String routeName = 'RewardPage';
  static String routePath = '/rewardPage';

  @override
  State<RewardPageWidget> createState() => _RewardPageWidgetState();
}

class _RewardPageWidgetState extends State<RewardPageWidget>
    with TickerProviderStateMixin {
  late RewardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RewardPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'RewardPage'});
    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1270.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 360.0.ms,
            duration: 1230.0.ms,
            begin: Offset(0.0, 23.0),
            end: Offset(0.0, -49.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 100.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Gems',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/tourmaline.png',
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+ ${FFAppState().gemsearned.toString()} gems',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).alternate,
                            fontSize: 25.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/tourmaline.png',
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/file_(5).png',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                FutureBuilder<List<LeaderboardUserRankInTheGroupRow>>(
                  future: LeaderboardUserRankInTheGroupTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'user_id',
                      currentUserUid,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<LeaderboardUserRankInTheGroupRow>
                        buttonLeaderboardUserRankInTheGroupRowList =
                        snapshot.data!;

                    final buttonLeaderboardUserRankInTheGroupRow =
                        buttonLeaderboardUserRankInTheGroupRowList.isNotEmpty
                            ? buttonLeaderboardUserRankInTheGroupRowList.first
                            : null;

                    return FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'REWARD_PAGE_PAGE_CONTINUE_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');
                        _model.querystreak =
                            await StreakUserStreakTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'user_id',
                            currentUserUid,
                          ),
                        );
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().gemstodatabase = FFAppState().gemsearned +
                            FFAppState().gemsfromdatabase;
                        safeSetState(() {});
                        logFirebaseEvent('Button_backend_call');
                        await UserDetailsTable().update(
                          data: {
                            'gems': FFAppState().gemstodatabase,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'user_id',
                            currentUserUid,
                          ),
                        );
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().currentstreak =
                            _model.querystreak!.firstOrNull!.currentStreak!;
                        safeSetState(() {});
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().challengecompleted = false;
                        safeSetState(() {});
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().leaderboardrankafterupdate =
                            buttonLeaderboardUserRankInTheGroupRow!
                                .rankInGroup!;
                        safeSetState(() {});
                        if (buttonLeaderboardUserRankInTheGroupRow?.groupId !=
                                null &&
                            buttonLeaderboardUserRankInTheGroupRow?.groupId !=
                                '') {
                          if (FFAppState().leaderboardrankafterupdate <
                              FFAppState().leaderboardrankbeforeupdate) {
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              LeaderboardProgressPageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                ),
                              },
                            );
                          } else {
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              HomePageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                ),
                              },
                            );
                          }
                        } else {
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed(
                            HomePageWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.bottomToTop,
                              ),
                            },
                          );
                        }

                        safeSetState(() {});
                      },
                      text: 'CONTINUE',
                      options: FFButtonOptions(
                        width: 350.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  },
                ),
              ].divide(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}
