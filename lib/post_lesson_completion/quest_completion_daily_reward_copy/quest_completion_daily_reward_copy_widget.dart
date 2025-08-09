import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quest_completion_daily_reward_copy_model.dart';
export 'quest_completion_daily_reward_copy_model.dart';

class QuestCompletionDailyRewardCopyWidget extends StatefulWidget {
  const QuestCompletionDailyRewardCopyWidget({super.key});

  static String routeName = 'QuestCompletionDailyRewardCopy';
  static String routePath = '/questCompletionDailyRewardCopy';

  @override
  State<QuestCompletionDailyRewardCopyWidget> createState() =>
      _QuestCompletionDailyRewardCopyWidgetState();
}

class _QuestCompletionDailyRewardCopyWidgetState
    extends State<QuestCompletionDailyRewardCopyWidget> {
  late QuestCompletionDailyRewardCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestCompletionDailyRewardCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QuestCompletionDailyRewardCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUEST_COMPLETION_DAILY_REWARD_COPY_Quest');
      logFirebaseEvent('QuestCompletionDailyRewardCopy_wait__del');
      await Future.delayed(
        Duration(
          milliseconds: 500,
        ),
      );
      logFirebaseEvent('QuestCompletionDailyRewardCopy_refresh_d');
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
      logFirebaseEvent('QuestCompletionDailyRewardCopy_update_pa');
      _model.updatepagestate = null;
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Text(
                    '1 Daily Quest complete!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).accent5,
                          fontSize: 40.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FutureBuilder<List<ChallengeUserChallengeRow>>(
                    future: (_model.requestCompleter ??= Completer<
                            List<ChallengeUserChallengeRow>>()
                          ..complete(ChallengeUserChallengeTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'user_id',
                                  currentUserUid,
                                )
                                .order('challenge_number', ascending: true),
                            limit: 3,
                          )))
                        .future,
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
                      List<ChallengeUserChallengeRow>
                          columnChallengeUserChallengeRowList = snapshot.data!;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            columnChallengeUserChallengeRowList.length,
                            (columnIndex) {
                          final columnChallengeUserChallengeRow =
                              columnChallengeUserChallengeRowList[columnIndex];
                          return Container(
                            width: double.infinity,
                            height: 100.0,
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
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        columnChallengeUserChallengeRow
                                            .challengeName,
                                        'challenge name',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/treasure-chest.png',
                                            width: 25.0,
                                            height: 25.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        LinearPercentIndicator(
                                          percent: valueOrDefault<double>(
                                            (int progress, int target) {
                                              return ((progress <= target
                                                      ? progress
                                                      : target) /
                                                  target);
                                            }(
                                                columnChallengeUserChallengeRow
                                                    .progress!,
                                                columnChallengeUserChallengeRow
                                                    .target!),
                                            .2,
                                          ),
                                          width: 200.0,
                                          lineHeight: 20.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          barRadius: Radius.circular(20.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/treasure-chest.png',
                                            width: 30.0,
                                            height: 30.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).divide(SizedBox(height: 10.0)),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).neutralColour,
                        width: 3.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        FutureBuilder<List<MonthlyChallengesRow>>(
                          future: MonthlyChallengesTable().querySingleRow(
                            queryFn: (q) => q
                                .lteOrNull(
                                  'start_date',
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                                )
                                .gteOrNull(
                                  'end_date',
                                  supaSerialize<DateTime>(getCurrentTimestamp),
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
                            List<MonthlyChallengesRow>
                                richTextMonthlyChallengesRowList =
                                snapshot.data!;

                            final richTextMonthlyChallengesRow =
                                richTextMonthlyChallengesRowList.isNotEmpty
                                    ? richTextMonthlyChallengesRowList.first
                                    : null;

                            return RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      richTextMonthlyChallengesRow
                                          ?.nameOfTheMonth,
                                      'Monthly ',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' Challenge',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            );
                          },
                        ),
                        Text(
                          '0/20',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: FutureBuilder<List<LeaderboardUserRankInTheGroupRow>>(
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
                              'QUEST_COMPLETION_DAILY_REWARD_COPY_CONTI');
                          if (FFAppState().challengecompleted == true) {
                            logFirebaseEvent('Button_wait__delay');
                            await Future.delayed(
                              Duration(
                                milliseconds: 100,
                              ),
                            );
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              RewardPageWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          } else {
                            if (FFAppState().streakanimationboolean == true) {
                              logFirebaseEvent('Button_wait__delay');
                              await Future.delayed(
                                Duration(
                                  milliseconds: 100,
                                ),
                              );
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                StreakPageWidget.routeName,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            } else {
                              logFirebaseEvent('Button_wait__delay');
                              await Future.delayed(
                                Duration(
                                  milliseconds: 100,
                                ),
                              );
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().leaderboardrankafterupdate =
                                  buttonLeaderboardUserRankInTheGroupRow!
                                      .rankInGroup!;
                              safeSetState(() {});
                              if (buttonLeaderboardUserRankInTheGroupRow
                                          .groupId !=
                                      null &&
                                  buttonLeaderboardUserRankInTheGroupRow
                                          .groupId !=
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
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                    ),
                                  },
                                );
                              }
                            }
                          }
                        },
                        text: 'CONTINUE',
                        options: FFButtonOptions(
                          width: 350.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                                    fontSize: 16.0,
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
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      );
                    },
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
