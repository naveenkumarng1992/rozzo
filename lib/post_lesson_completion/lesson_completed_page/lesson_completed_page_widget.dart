import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'lesson_completed_page_model.dart';
export 'lesson_completed_page_model.dart';

class LessonCompletedPageWidget extends StatefulWidget {
  const LessonCompletedPageWidget({super.key});

  static String routeName = 'LessonCompletedPage';
  static String routePath = '/lessonCompletedPage';

  @override
  State<LessonCompletedPageWidget> createState() =>
      _LessonCompletedPageWidgetState();
}

class _LessonCompletedPageWidgetState extends State<LessonCompletedPageWidget> {
  late LessonCompletedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonCompletedPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LessonCompletedPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LESSON_COMPLETED_LessonCompletedPage_ON_');
      logFirebaseEvent('LessonCompletedPage_play_sound');
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(1.0);
      _model.soundPlayer!
          .setAsset(
              'assets/audios/mixkit-orchestra-triumphant-trumpets-2285.wav')
          .then((_) => _model.soundPlayer!.play());
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
        appBar: FFAppState().currentsectionno == 0
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Text(
                  'Page Title',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              FutureBuilder<List<StreakUserStreakRow>>(
                future: StreakUserStreakTable().querySingleRow(
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
                  List<StreakUserStreakRow> columnStreakUserStreakRowList =
                      snapshot.data!;

                  final columnStreakUserStreakRow =
                      columnStreakUserStreakRowList.isNotEmpty
                          ? columnStreakUserStreakRowList.first
                          : null;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Remove_background_project_(15).png',
                              width: 300.0,
                              height: 300.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Perfect Lesson!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).accent5,
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Text(
                          'Take a  bow!',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100.0,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent5,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'TOTAL XP',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Container(
                                        width: 90.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.flash_on,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFAppState()
                                                      .xpearned
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                              Container(
                                width: 100.0,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'SPEEDY',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Container(
                                        width: 90.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.flash_on,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  functions
                                                      .timetakenforlessoncompletion(
                                                          FFAppState()
                                                              .lessonstarttime,
                                                          FFAppState()
                                                              .lessonendtime),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                              Container(
                                width: 100.0,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'AMAZING',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Container(
                                        width: 90.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.flash_on,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFAppState().courseid ==
                                                          'mbbs'
                                                      ? formatNumber(
                                                          FFAppState()
                                                                  .totalnoofcorrectanswers /
                                                              10,
                                                          formatType: FormatType
                                                              .percent,
                                                        )
                                                      : formatNumber(
                                                          FFAppState()
                                                                  .totalnoofcorrectanswers /
                                                              15,
                                                          formatType: FormatType
                                                              .percent,
                                                        ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
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
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 100.0, 0.0, 0.0),
                            child: FutureBuilder<List<UserDetailsRow>>(
                              future: UserDetailsTable().querySingleRow(
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UserDetailsRow> buttonUserDetailsRowList =
                                    snapshot.data!;

                                final buttonUserDetailsRow =
                                    buttonUserDetailsRowList.isNotEmpty
                                        ? buttonUserDetailsRowList.first
                                        : null;

                                return FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'LESSON_COMPLETED_CONTINUE_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');
                                    await StreakUserStreakTable().update(
                                      data: {
                                        'last_active_date':
                                            supaSerialize<DateTime>(
                                                getCurrentTimestamp),
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      ),
                                    );
                                    logFirebaseEvent('Button_backend_call');
                                    await UserDetailsTable().update(
                                      data: {
                                        'last_active_at':
                                            supaSerialize<DateTime>(
                                                getCurrentTimestamp),
                                      },
                                      matchingRows: (rows) => rows.eqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      ),
                                    );
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().timetakeninseconds =
                                        FFAppState().lessonendtime -
                                            FFAppState().lessonstarttime;
                                    safeSetState(() {});
                                    logFirebaseEvent('Button_backend_call');
                                    _model.challengetype2 =
                                        await ChallengeUserChallengeTable()
                                            .queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'user_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'challenge_type',
                                            2,
                                          )
                                          .eqOrNull(
                                            'is_completed',
                                            false,
                                          ),
                                    );
                                    logFirebaseEvent('Button_backend_call');
                                    _model.challengetype3 =
                                        await ChallengeUserChallengeTable()
                                            .queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'user_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'challenge_type',
                                            3,
                                          )
                                          .eqOrNull(
                                            'is_completed',
                                            false,
                                          ),
                                    );
                                    logFirebaseEvent('Button_backend_call');
                                    _model.challengtype4 =
                                        await ChallengeUserChallengeTable()
                                            .queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'user_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'challenge_type',
                                            4,
                                          )
                                          .eqOrNull(
                                            'is_completed',
                                            false,
                                          ),
                                    );
                                    logFirebaseEvent('Button_backend_call');
                                    _model.challengetype5 =
                                        await ChallengeUserChallengeTable()
                                            .queryRows(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'user_id',
                                            currentUserUid,
                                          )
                                          .eqOrNull(
                                            'challenge_type',
                                            5,
                                          )
                                          .eqOrNull(
                                            'is_completed',
                                            false,
                                          ),
                                    );
                                    if (dateTimeFormat(
                                            "d/M/y",
                                            columnStreakUserStreakRow
                                                ?.lastActiveDate) !=
                                        dateTimeFormat(
                                            "d/M/y", getCurrentTimestamp)) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().currentstreak =
                                          columnStreakUserStreakRow!
                                              .currentStreak!;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().currentstreak =
                                          FFAppState().currentstreak + 1;
                                      FFAppState().streakanimationboolean =
                                          true;
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_backend_call');
                                      await StreakUserStreakTable().update(
                                        data: {
                                          'current_streak':
                                              FFAppState().currentstreak,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'user_id',
                                          currentUserUid,
                                        ),
                                      );
                                      logFirebaseEvent('Button_backend_call');
                                      await LeaderboardUserRankInTheGroupTable()
                                          .update(
                                        data: {
                                          'is_frozen': false,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'user_id',
                                          currentUserUid,
                                        ),
                                      );
                                      if (FFAppState().challenge1 == 1) {
                                        logFirebaseEvent('Button_backend_call');
                                        await ChallengeUserChallengeTable()
                                            .update(
                                          data: {
                                            'progress':
                                                FFAppState().currentstreak,
                                          },
                                          matchingRows: (rows) => rows
                                              .eqOrNull(
                                                'user_id',
                                                currentUserUid,
                                              )
                                              .eqOrNull(
                                                'challenge_number',
                                                1,
                                              ),
                                        );
                                      }
                                    }
                                    if (_model.challengetype2 != null &&
                                        (_model.challengetype2)!.isNotEmpty) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().progressintimetaken = _model
                                          .challengetype2!
                                          .firstOrNull!
                                          .progress!;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().progressintimetaken =
                                          FFAppState().timetakeninseconds +
                                              FFAppState().progressintimetaken;
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_backend_call');
                                      await ChallengeUserChallengeTable()
                                          .update(
                                        data: {
                                          'progress':
                                              FFAppState().progressintimetaken,
                                        },
                                        matchingRows: (rows) => rows
                                            .eqOrNull(
                                              'challenge_type',
                                              2,
                                            )
                                            .eqOrNull(
                                              'user_id',
                                              currentUserUid,
                                            ),
                                      );
                                      if (FFAppState().progressintimetaken >=
                                          _model.challengetype2!.firstOrNull!
                                              .target!) {
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().challengecompleted = true;
                                        FFAppState().gemsearned =
                                            FFAppState().gemsearned + 5;
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_backend_call');
                                        await ChallengeUserChallengeTable()
                                            .update(
                                          data: {
                                            'is_completed': true,
                                          },
                                          matchingRows: (rows) => rows
                                              .eqOrNull(
                                                'user_id',
                                                currentUserUid,
                                              )
                                              .eqOrNull(
                                                'challenge_type',
                                                2,
                                              ),
                                        );
                                      }
                                    }
                                    if (_model.challengetype3 != null &&
                                        (_model.challengetype3)!.isNotEmpty) {
                                      if (FFAppState()
                                              .totalnoofcorrectanswers >=
                                          14) {
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState()
                                                .lessonswithmorethan90accuracy =
                                            _model.challengetype3!.firstOrNull!
                                                .progress!;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState()
                                                .lessonswithmorethan90accuracy =
                                            FFAppState()
                                                    .lessonswithmorethan90accuracy +
                                                1;
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_backend_call');
                                        await ChallengeUserChallengeTable()
                                            .update(
                                          data: {
                                            'progress': FFAppState()
                                                .lessonswithmorethan90accuracy,
                                          },
                                          matchingRows: (rows) => rows
                                              .eqOrNull(
                                                'challenge_type',
                                                3,
                                              )
                                              .eqOrNull(
                                                'user_id',
                                                currentUserUid,
                                              ),
                                        );
                                        if (FFAppState()
                                                .lessonswithmorethan90accuracy >=
                                            _model.challengetype3!.firstOrNull!
                                                .target!) {
                                          logFirebaseEvent(
                                              'Button_update_app_state');
                                          FFAppState().challengecompleted =
                                              true;
                                          FFAppState().gemsearned =
                                              FFAppState().gemsearned + 5;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          await ChallengeUserChallengeTable()
                                              .update(
                                            data: {
                                              'is_completed': true,
                                            },
                                            matchingRows: (rows) => rows
                                                .eqOrNull(
                                                  'user_id',
                                                  currentUserUid,
                                                )
                                                .eqOrNull(
                                                  'challenge_type',
                                                  3,
                                                ),
                                          );
                                        }
                                      }
                                    }
                                    if (_model.challengtype4?.firstOrNull !=
                                        null) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState()
                                              .numberoflessonscompletedtoday =
                                          _model.challengtype4!.firstOrNull!
                                              .progress!;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState()
                                              .numberoflessonscompletedtoday =
                                          FFAppState()
                                                  .numberoflessonscompletedtoday +
                                              1;
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_backend_call');
                                      await ChallengeUserChallengeTable()
                                          .update(
                                        data: {
                                          'progress': FFAppState()
                                              .numberoflessonscompletedtoday,
                                        },
                                        matchingRows: (rows) => rows
                                            .eqOrNull(
                                              'user_id',
                                              currentUserUid,
                                            )
                                            .eqOrNull(
                                              'challenge_type',
                                              4,
                                            ),
                                      );
                                      if (FFAppState()
                                              .numberoflessonscompletedtoday >=
                                          _model.challengtype4!.firstOrNull!
                                              .target!) {
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().challengecompleted = true;
                                        FFAppState().gemsearned =
                                            FFAppState().gemsearned + 5;
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_backend_call');
                                        await ChallengeUserChallengeTable()
                                            .update(
                                          data: {
                                            'is_completed': true,
                                          },
                                          matchingRows: (rows) => rows
                                              .eqOrNull(
                                                'user_id',
                                                currentUserUid,
                                              )
                                              .eqOrNull(
                                                'challenge_type',
                                                4,
                                              ),
                                        );
                                      }
                                    }
                                    if (_model.challengetype5 != null &&
                                        (_model.challengetype5)!.isNotEmpty) {
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().xpearnedtoday = _model
                                          .challengetype5!
                                          .firstOrNull!
                                          .progress!;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().xpearnedfromlesson = 15;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().xpearnedtoday = (_model
                                              .challengetype5!
                                              .firstOrNull!
                                              .progress!) +
                                          FFAppState().xpearnedfromlesson;
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_backend_call');
                                      await ChallengeUserChallengeTable()
                                          .update(
                                        data: {
                                          'progress':
                                              FFAppState().xpearnedtoday,
                                        },
                                        matchingRows: (rows) => rows
                                            .eqOrNull(
                                              'user_id',
                                              currentUserUid,
                                            )
                                            .eqOrNull(
                                              'challenge_type',
                                              5,
                                            ),
                                      );
                                      if (FFAppState().xpearnedtoday >=
                                          _model.challengetype5!.firstOrNull!
                                              .target!) {
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().challengecompleted = true;
                                        FFAppState().gemsearned =
                                            FFAppState().gemsearned + 5;
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_backend_call');
                                        await ChallengeUserChallengeTable()
                                            .update(
                                          data: {
                                            'is_completed': true,
                                          },
                                          matchingRows: (rows) => rows
                                              .eqOrNull(
                                                'user_id',
                                                currentUserUid,
                                              )
                                              .eqOrNull(
                                                'challenge_type',
                                                5,
                                              ),
                                        );
                                      }
                                    }
                                    logFirebaseEvent('Button_wait__delay');
                                    await Future.delayed(
                                      Duration(
                                        milliseconds: 100,
                                      ),
                                    );
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().gemsfromdatabase =
                                        buttonUserDetailsRow!.gems!;
                                    safeSetState(() {});
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      QuestCompletionDailyRewardCopyWidget
                                          .routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                        ),
                                      },
                                    );

                                    safeSetState(() {});
                                  },
                                  text: 'CONTINUE',
                                  options: FFButtonOptions(
                                    width: 340.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
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
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Lottie.network(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/med-max-ezfe7d/assets/tlp90st7vw5t/Page_Completion_Celebration-Animation.json',
                  width: 400.0,
                  height: 400.0,
                  fit: BoxFit.contain,
                  repeat: false,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
