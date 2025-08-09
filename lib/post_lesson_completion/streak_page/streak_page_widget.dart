import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'streak_page_model.dart';
export 'streak_page_model.dart';

class StreakPageWidget extends StatefulWidget {
  const StreakPageWidget({super.key});

  static String routeName = 'StreakPage';
  static String routePath = '/streakPage';

  @override
  State<StreakPageWidget> createState() => _StreakPageWidgetState();
}

class _StreakPageWidgetState extends State<StreakPageWidget> {
  late StreakPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreakPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'StreakPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STREAK_StreakPage_ON_INIT_STATE');
      logFirebaseEvent('StreakPage_update_page_state');
      _model.streakanimation = (int streak) {
        return streak = (streak > 0) ? streak - 1 : streak;
      }(FFAppState().currentstreak);
      safeSetState(() {});
      logFirebaseEvent('StreakPage_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      logFirebaseEvent('StreakPage_update_page_state');
      _model.streakanimation = _model.streakanimation! + 1;
      safeSetState(() {});
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
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Lottie.network(
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/med-max-ezfe7d/assets/g86wequw3pcc/Animation_-_1733995396062.json',
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                        Text(
                          valueOrDefault<String>(
                            _model.streakanimation?.toString(),
                            '0',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                font: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).accent5,
                                fontSize: 100.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .fontStyle,
                                lineHeight: 1.0,
                              ),
                        ),
                        Text(
                          'day streak!',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).accent5,
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 200.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.share_sharp,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: FutureBuilder<
                                      List<LeaderboardUserRankInTheGroupRow>>(
                                    future: LeaderboardUserRankInTheGroupTable()
                                        .querySingleRow(
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<LeaderboardUserRankInTheGroupRow>
                                          buttonLeaderboardUserRankInTheGroupRowList =
                                          snapshot.data!;

                                      final buttonLeaderboardUserRankInTheGroupRow =
                                          buttonLeaderboardUserRankInTheGroupRowList
                                                  .isNotEmpty
                                              ? buttonLeaderboardUserRankInTheGroupRowList
                                                  .first
                                              : null;

                                      return FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'STREAK_PAGE_PAGE_IM_COMMITTED_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed(
                                            HomePageWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                              ),
                                            },
                                          );

                                          logFirebaseEvent(
                                              'Button_update_page_state');
                                          _model.streakanimation = 0;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState()
                                                  .leaderboardrankafterupdate =
                                              buttonLeaderboardUserRankInTheGroupRow!
                                                  .rankInGroup!;
                                          safeSetState(() {});
                                          if (buttonLeaderboardUserRankInTheGroupRow
                                                      .groupId !=
                                                  null &&
                                              buttonLeaderboardUserRankInTheGroupRow
                                                      .groupId !=
                                                  '') {
                                            if (FFAppState()
                                                    .leaderboardrankafterupdate <
                                                FFAppState()
                                                    .leaderboardrankbeforeupdate) {
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                LeaderboardProgressPageWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .bottomToTop,
                                                  ),
                                                },
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                HomePageWidget.routeName,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .bottomToTop,
                                                  ),
                                                },
                                              );
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.pushNamed(
                                              HomePageWidget.routeName,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .bottomToTop,
                                                ),
                                              },
                                            );
                                          }

                                          logFirebaseEvent(
                                              'Button_wait__delay');
                                          await Future.delayed(
                                            Duration(
                                              milliseconds: 500,
                                            ),
                                          );
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().streakanimationboolean =
                                              false;
                                          FFAppState().currentstreak = 0;
                                          safeSetState(() {});
                                        },
                                        text: 'I\'M COMMITTED',
                                        options: FFButtonOptions(
                                          width: 280.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 200.0),
                    child: Lottie.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/med-max-ezfe7d/assets/enhwnj8bhxp1/pZEj3LEtIb.json',
                      width: 500.0,
                      height: 500.0,
                      fit: BoxFit.contain,
                      repeat: false,
                      animate: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
