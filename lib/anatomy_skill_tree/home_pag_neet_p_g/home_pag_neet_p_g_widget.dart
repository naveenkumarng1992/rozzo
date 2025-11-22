import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/lessonslocked_widget.dart';
import '/components/needheartopractise_widget.dart';
import '/components/nextlesson1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_pag_neet_p_g_model.dart';
export 'home_pag_neet_p_g_model.dart';

class HomePagNeetPGWidget extends StatefulWidget {
  const HomePagNeetPGWidget({super.key});

  static String routeName = 'HomePag_NeetPG';
  static String routePath = '/homePagNeetPG';

  @override
  State<HomePagNeetPGWidget> createState() => _HomePagNeetPGWidgetState();
}

class _HomePagNeetPGWidgetState extends State<HomePagNeetPGWidget> {
  late HomePagNeetPGModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePagNeetPGModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomePag_NeetPG'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAG_NEET_P_G_HomePag_NeetPG_ON_INIT');
      logFirebaseEvent('HomePag_NeetPG_backend_call');
      _model.userchallenges = await ChallengeUserChallengeTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .order('challenge_type', ascending: true),
      );
      logFirebaseEvent('HomePag_NeetPG_update_app_state');
      FFAppState().challenge1 =
          _model.userchallenges!.firstOrNull!.challengeType!;
      FFAppState().xpearnedtoday = 0;
      FFAppState().timetakeninseconds = 0;
      FFAppState().progressintimetaken = 0;
      FFAppState().correctanswersinarow = 0;
      FFAppState().totalnoofcorrectanswers = 0;
      FFAppState().gemsearned = 0;
      FFAppState().gemsfromdatabase = 0;
      FFAppState().gemstodatabase = 0;
      FFAppState().isreview = false;
      FFAppState().reviewnumber = 0;
      safeSetState(() {});
      logFirebaseEvent('HomePag_NeetPG_update_app_state');
      FFAppState().challenge2 =
          _model.userchallenges!.elementAtOrNull(1)!.challengeType!;
      safeSetState(() {});
      logFirebaseEvent('HomePag_NeetPG_update_app_state');
      FFAppState().challenge3 =
          _model.userchallenges!.elementAtOrNull(2)!.challengeType!;
      safeSetState(() {});
      logFirebaseEvent('HomePag_NeetPG_backend_call');
      _model.noofhearts = await UserDetailsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      logFirebaseEvent('HomePag_NeetPG_update_app_state');
      FFAppState().noofhearts = _model.noofhearts!.firstOrNull!.totalHearts!;
      safeSetState(() {});
      logFirebaseEvent('HomePag_NeetPG_backend_call');
      _model.appstateleaderboardbefore =
          await LeaderboardUserRankInTheGroupTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      logFirebaseEvent('HomePag_NeetPG_update_app_state');
      FFAppState().leaderboardrankbeforeupdate =
          _model.appstateleaderboardbefore!.firstOrNull!.rankInGroup!;
      safeSetState(() {});
      logFirebaseEvent('HomePag_NeetPG_update_app_state');
      FFAppState().now = getCurrentTimestamp.secondsSinceEpoch;
      FFAppState().lastpromptnowdifference =
          FFAppState().now - FFAppState().lastnotificationprompt;
      safeSetState(() {});
      if (FFAppState().fcmToken == null || FFAppState().fcmToken == '') {
        logFirebaseEvent('HomePag_NeetPG_custom_action');
        await actions.initializeMessaging();
      }
      logFirebaseEvent('HomePag_NeetPG_backend_call');
      await UserDetailsTable().update(
        data: {
          'fcm_token': FFAppState().fcmToken,
        },
        matchingRows: (rows) => rows.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
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

    return FutureBuilder<List<UserDetailsRow>>(
      future: UserDetailsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UserDetailsRow> homePagNeetPGUserDetailsRowList = snapshot.data!;

        final homePagNeetPGUserDetailsRow =
            homePagNeetPGUserDetailsRowList.isNotEmpty
                ? homePagNeetPGUserDetailsRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: FFAppState().currentsectionno == 0
                  ? AppBar(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      automaticallyImplyLeading: false,
                      title: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'HOME_PAG_NEET_P_G_Text_bbeh7kes_ON_TAP');
                          logFirebaseEvent('Text_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth(
                              SignUpSignInWidget.routeName, context.mounted);
                        },
                        child: Text(
                          'LogOut',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
                      child: FutureBuilder<List<AnatomyUnitDetailRow>>(
                        future: _model.unitQuery(
                          requestFn: () => AnatomyUnitDetailTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'section_id',
                                  FFAppState().currentsectionno,
                                )
                                .order('Unit_Number', ascending: true),
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
                          List<AnatomyUnitDetailRow>
                              listViewAnatomyUnitDetailRowList = snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAnatomyUnitDetailRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAnatomyUnitDetailRow =
                                  listViewAnatomyUnitDetailRowList[
                                      listViewIndex];
                              return Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Unit ${listViewAnatomyUnitDetailRow.unitNumber?.toString()}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 15.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      listViewAnatomyUnitDetailRow
                                                          .unitName,
                                                      'Unit_Name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 400.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            listViewAnatomyUnitDetailRow
                                                .leftCartoonCharacterUrl!,
                                            width: 100.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 220.0, 0.0, 10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              listViewAnatomyUnitDetailRow
                                                  .rightCartoonCharacterUrl!,
                                              width: 100.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 100.0, 0.0, 0.0),
                                          child: FutureBuilder<
                                              List<AnatomyLevelDetailRow>>(
                                            future: AnatomyLevelDetailTable()
                                                .queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'unit_number',
                                                    listViewAnatomyUnitDetailRow
                                                        .unitNumber,
                                                  )
                                                  .eqOrNull(
                                                    'section_number',
                                                    FFAppState()
                                                        .currentsectionno,
                                                  )
                                                  .order('level_number',
                                                      ascending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<AnatomyLevelDetailRow>
                                                  columnAnatomyLevelDetailRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnAnatomyLevelDetailRowList
                                                        .length, (columnIndex) {
                                                  final columnAnatomyLevelDetailRow =
                                                      columnAnatomyLevelDetailRowList[
                                                          columnIndex];
                                                  return Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  valueOrDefault<
                                                                      double>(
                                                                    columnAnatomyLevelDetailRow
                                                                        .leftPosition
                                                                        ?.toDouble(),
                                                                    0.0,
                                                                  ),
                                                                  15.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    columnAnatomyLevelDetailRow
                                                                        .rightPosition
                                                                        ?.toDouble(),
                                                                    0.0,
                                                                  ),
                                                                  15.0),
                                                          child: FutureBuilder<
                                                              List<
                                                                  UserProgressRow>>(
                                                            future: UserProgressTable()
                                                                .querySingleRow(
                                                              queryFn: (q) => q
                                                                  .eqOrNull(
                                                                    'user_id',
                                                                    currentUserUid,
                                                                  )
                                                                  .eqOrNull(
                                                                    'section_no',
                                                                    listViewAnatomyUnitDetailRow
                                                                        .sectionId,
                                                                  )
                                                                  .eqOrNull(
                                                                    'unit_no',
                                                                    listViewAnatomyUnitDetailRow
                                                                        .unitNumber,
                                                                  )
                                                                  .eqOrNull(
                                                                    'level_no',
                                                                    columnAnatomyLevelDetailRow
                                                                        .levelNumber,
                                                                  ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<UserProgressRow>
                                                                  containerUserProgressRowList =
                                                                  snapshot
                                                                      .data!;

                                                              final containerUserProgressRow =
                                                                  containerUserProgressRowList
                                                                          .isNotEmpty
                                                                      ? containerUserProgressRowList
                                                                          .first
                                                                      : null;

                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'HOME_PAG_NEET_P_G_Container_2ujtn8wa_ON_');
                                                                  if (FFAppState()
                                                                          .noofhearts !=
                                                                      0) {
                                                                    if (containerUserProgressRow
                                                                            ?.isActive ==
                                                                        true) {
                                                                      logFirebaseEvent(
                                                                          'Container_update_app_state');
                                                                      FFAppState()
                                                                              .currentunitno =
                                                                          listViewAnatomyUnitDetailRow
                                                                              .unitNumber!;
                                                                      FFAppState()
                                                                              .currentlevelno =
                                                                          columnAnatomyLevelDetailRow
                                                                              .levelNumber!;
                                                                      FFAppState()
                                                                              .currentlessonno =
                                                                          homePagNeetPGUserDetailsRow!
                                                                              .currentLessonNo!;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');
                                                                      _model.querytocheckiflesson5iscompletedforreview =
                                                                          await UserProgressTable()
                                                                              .queryRows(
                                                                        queryFn: (q) => q
                                                                            .eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            )
                                                                            .eqOrNull(
                                                                              'section_no',
                                                                              listViewAnatomyUnitDetailRow.sectionId,
                                                                            )
                                                                            .eqOrNull(
                                                                              'unit_no',
                                                                              listViewAnatomyUnitDetailRow.unitNumber,
                                                                            )
                                                                            .eqOrNull(
                                                                              'level_no',
                                                                              columnAnatomyLevelDetailRow.levelNumber,
                                                                            )
                                                                            .eqOrNull(
                                                                              'lesson_no',
                                                                              5,
                                                                            )
                                                                            .eqOrNull(
                                                                              'is_completed',
                                                                              true,
                                                                            ),
                                                                      );
                                                                      if (_model.querytocheckiflesson5iscompletedforreview !=
                                                                              null &&
                                                                          (_model.querytocheckiflesson5iscompletedforreview)!
                                                                              .isNotEmpty) {
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState().currentunitno =
                                                                            listViewAnatomyUnitDetailRow.unitNumber!;
                                                                        FFAppState().currentlevelno =
                                                                            columnAnatomyLevelDetailRow.levelNumber!;
                                                                        FFAppState().currentlessonno =
                                                                            homePagNeetPGUserDetailsRow!.currentLessonNo!;
                                                                        FFAppState().isreview =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: 200.0,
                                                                                  child: Nextlesson1Widget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Container_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: 200.0,
                                                                                  child: Nextlesson1Widget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      }
                                                                    } else {
                                                                      if (columnAnatomyLevelDetailRow
                                                                              .levelNumber ==
                                                                          1) {
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState().currentunitno =
                                                                            listViewAnatomyUnitDetailRow.unitNumber!;
                                                                        FFAppState().currentlevelno =
                                                                            columnAnatomyLevelDetailRow.levelNumber!;
                                                                        FFAppState()
                                                                            .currentlessonno = 1;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: 200.0,
                                                                                  child: Nextlesson1Widget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Container_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: 200.0,
                                                                                  child: LessonslockedWidget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      }
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Container_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 170.0,
                                                                              child: NeedheartopractiseWidget(),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 70.0,
                                                                  height: 70.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: () {
                                                                      if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 2) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 2) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 3) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 3) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 4) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 4) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                              5)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 5) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                              6)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 6) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                              7)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 7) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                              8)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 8) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                              9)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent5;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 9) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent5;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                              10)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 10) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 11) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 11) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 12) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 12) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 13) &&
                                                                          (columnAnatomyLevelDetailRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 13) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 14)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 14) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 15)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 15) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 16)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 16) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 17) && (containerUserProgressRow?.isActive != null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 17) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 18) && (containerUserProgressRow?.isActive != null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 18) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 20) && (containerUserProgressRow?.isActive != null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 19) && (containerUserProgressRow?.isActive != null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 19) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 20) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 21)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 21) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 22)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 22) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 23)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 23) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 24)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 24) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 25)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent3;
                                                                      } else if ((listViewAnatomyUnitDetailRow.unitNumber == 25) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent3;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .inactiveLevelButton;
                                                                      }
                                                                    }(),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color:
                                                                            () {
                                                                          if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 2) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 2) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 3) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 3) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 4) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 4) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                                  5)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 5) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                                  6)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 6) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                                  7)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 7) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                                  8)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 8) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                                  9)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 9) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 11) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 11) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 12) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 12) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 13) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 13) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyUnitDetailRow.unitNumber ==
                                                                                  14)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 14) &&
                                                                              (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 15)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 15) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 16)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 16) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 17)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 18)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 18) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 17)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 19) && (containerUserProgressRow?.isActive != null)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 19) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 20) && (containerUserProgressRow?.isActive != null)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 20) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 21)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 21) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 22)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 22) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 23)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 23) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyUnitDetailRow.unitNumber == 24)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 24) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 25) && (containerUserProgressRow?.isActive != null)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 25) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 10) && (containerUserProgressRow?.isActive != null)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 10) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyUnitDetailRow.unitNumber == 17) && (columnAnatomyLevelDetailRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else {
                                                                            return Color(0xFF373A40);
                                                                          }
                                                                        }(),
                                                                        offset:
                                                                            Offset(
                                                                          1.0,
                                                                          10.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .auto_stories,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 40.0,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 19.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/fire.png',
                                              width: 25.0,
                                              height: 25.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 0.0, 0.0, 0.0),
                                            child: FutureBuilder<
                                                List<StreakUserStreakRow>>(
                                              future: StreakUserStreakTable()
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
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<StreakUserStreakRow>
                                                    textStreakUserStreakRowList =
                                                    snapshot.data!;

                                                final textStreakUserStreakRow =
                                                    textStreakUserStreakRowList
                                                            .isNotEmpty
                                                        ? textStreakUserStreakRowList
                                                            .first
                                                        : null;

                                                return Text(
                                                  valueOrDefault<String>(
                                                    textStreakUserStreakRow
                                                        ?.currentStreak
                                                        ?.toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/tourmaline.png',
                                            width: 25.0,
                                            height: 25.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  1.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              homePagNeetPGUserDetailsRow?.gems
                                                  ?.toString(),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/heart.png',
                                              width: 25.0,
                                              height: 25.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                FFAppState()
                                                    .noofhearts
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
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
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FutureBuilder<List<SectionDetailRow>>(
                                future: SectionDetailTable().querySingleRow(
                                  queryFn: (q) => q.eqOrNull(
                                    'Section_Number',
                                    FFAppState().currentsectionno,
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
                                  List<SectionDetailRow>
                                      rowSectionDetailRowList = snapshot.data!;

                                  final rowSectionDetailRow =
                                      rowSectionDetailRowList.isNotEmpty
                                          ? rowSectionDetailRowList.first
                                          : null;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_PAG_NEET_P_G_Row_n5h55f06_ON_TAP');
                                      logFirebaseEvent('Row_navigate_to');

                                      context.goNamed(
                                        SectionPageWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                          ),
                                        },
                                      );
                                    },
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Icon(
                                              Icons.keyboard_arrow_up_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 30.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 15.0),
                                            child: Text(
                                              'Section ${rowSectionDetailRow?.sectionNumber?.toString()}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
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
          ),
        );
      },
    );
  }
}
