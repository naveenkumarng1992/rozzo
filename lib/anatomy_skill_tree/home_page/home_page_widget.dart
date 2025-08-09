import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/choosecourse_widget.dart';
import '/components/lessonslocked_widget.dart';
import '/components/needheartopractise_widget.dart';
import '/components/nextlesson1_widget.dart';
import '/components/user_guide_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_HomePage_ON_INIT_STATE');
      logFirebaseEvent('HomePage_backend_call');
      _model.userchallenges = await ChallengeUserChallengeTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .order('challenge_type', ascending: true),
      );
      logFirebaseEvent('HomePage_update_app_state');
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
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().challenge2 =
          _model.userchallenges!.elementAtOrNull(1)!.challengeType!;
      safeSetState(() {});
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().challenge3 =
          _model.userchallenges!.elementAtOrNull(2)!.challengeType!;
      safeSetState(() {});
      logFirebaseEvent('HomePage_backend_call');
      _model.noofhearts = await UserDetailsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().noofhearts = _model.noofhearts!.firstOrNull!.totalHearts!;
      FFAppState().courseid = valueOrDefault<String>(
        _model.noofhearts?.firstOrNull?.courseId,
        'mbbs',
      );
      FFAppState().subcourseid = valueOrDefault<String>(
        _model.noofhearts?.firstOrNull?.subcourseId,
        'mbbs_learn',
      );
      safeSetState(() {});
      logFirebaseEvent('HomePage_backend_call');
      _model.appstateleaderboardbefore =
          await LeaderboardUserRankInTheGroupTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().leaderboardrankbeforeupdate =
          _model.appstateleaderboardbefore!.firstOrNull!.rankInGroup!;
      safeSetState(() {});
      logFirebaseEvent('HomePage_update_app_state');
      FFAppState().now = getCurrentTimestamp.secondsSinceEpoch;
      FFAppState().lastpromptnowdifference =
          FFAppState().now - FFAppState().lastnotificationprompt;
      safeSetState(() {});
      if (FFAppState().fcmToken == '') {
        logFirebaseEvent('HomePage_custom_action');
        await actions.initializeMessaging();
      }
      logFirebaseEvent('HomePage_backend_call');
      await UserDetailsTable().update(
        data: {
          'fcm_token': FFAppState().fcmToken,
        },
        matchingRows: (rows) => rows.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      logFirebaseEvent('HomePage_custom_action');
      await actions.checkNotificationPermissionStatus();
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
        List<UserDetailsRow> homePageUserDetailsRowList = snapshot.data!;

        final homePageUserDetailsRow = homePageUserDetailsRowList.isNotEmpty
            ? homePageUserDetailsRowList.first
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
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  logFirebaseEvent('HOME_FloatingActionButton_4bcbshlk_ON_TA');
                  logFirebaseEvent('FloatingActionButton_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: double.infinity,
                            child: UserGuideWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).alternate,
                elevation: 5.0,
                child: Icon(
                  Icons.waving_hand_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
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
                              'HOME_PAGE_PAGE_Text_3if2esxi_ON_TAP');
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 140.0, 0.0, 0.0),
                      child: FutureBuilder<List<AnatomyQuestionDetailsRow>>(
                        future: _model.unitQuery(
                          requestFn: () =>
                              AnatomyQuestionDetailsTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'section_number',
                                  FFAppState().currentsectionno,
                                )
                                .eqOrNull(
                                  'level_number',
                                  1,
                                )
                                .eqOrNull(
                                  'lesson_number',
                                  1,
                                )
                                .eqOrNull(
                                  'question_number',
                                  1,
                                )
                                .eqOrNull(
                                  'course_id',
                                  _model.noofhearts?.firstOrNull?.courseId,
                                )
                                .eqOrNull(
                                  'subcourse_id',
                                  homePageUserDetailsRow?.subcourseId,
                                )
                                .order('unit_number', ascending: true),
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
                          List<AnatomyQuestionDetailsRow>
                              listViewAnatomyQuestionDetailsRowList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewAnatomyQuestionDetailsRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAnatomyQuestionDetailsRow =
                                  listViewAnatomyQuestionDetailsRowList[
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
                                                    'Unit ${listViewAnatomyQuestionDetailsRow.unitNumber?.toString()}',
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
                                                      listViewAnatomyQuestionDetailsRow
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
                                            listViewAnatomyQuestionDetailsRow
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
                                              listViewAnatomyQuestionDetailsRow
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
                                              List<AnatomyQuestionDetailsRow>>(
                                            future:
                                                AnatomyQuestionDetailsTable()
                                                    .queryRows(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'unit_number',
                                                    listViewAnatomyQuestionDetailsRow
                                                        .unitNumber,
                                                  )
                                                  .eqOrNull(
                                                    'section_number',
                                                    FFAppState()
                                                        .currentsectionno,
                                                  )
                                                  .eqOrNull(
                                                    'lesson_number',
                                                    1,
                                                  )
                                                  .eqOrNull(
                                                    'question_number',
                                                    1,
                                                  )
                                                  .eqOrNull(
                                                    'course_id',
                                                    FFAppState().courseid,
                                                  )
                                                  .eqOrNull(
                                                    'subcourse_id',
                                                    FFAppState().subcourseid,
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
                                              List<AnatomyQuestionDetailsRow>
                                                  columnAnatomyQuestionDetailsRowList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnAnatomyQuestionDetailsRowList
                                                        .length, (columnIndex) {
                                                  final columnAnatomyQuestionDetailsRow =
                                                      columnAnatomyQuestionDetailsRowList[
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
                                                                    columnAnatomyQuestionDetailsRow
                                                                        .leftSpace
                                                                        ?.toDouble(),
                                                                    0.0,
                                                                  ),
                                                                  15.0,
                                                                  valueOrDefault<
                                                                      double>(
                                                                    columnAnatomyQuestionDetailsRow
                                                                        .rightSpace
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
                                                                    listViewAnatomyQuestionDetailsRow
                                                                        .sectionNumber,
                                                                  )
                                                                  .eqOrNull(
                                                                    'unit_no',
                                                                    listViewAnatomyQuestionDetailsRow
                                                                        .unitNumber,
                                                                  )
                                                                  .eqOrNull(
                                                                    'level_no',
                                                                    columnAnatomyQuestionDetailsRow
                                                                        .levelNumber,
                                                                  )
                                                                  .eqOrNull(
                                                                    'course_id',
                                                                    homePageUserDetailsRow
                                                                        ?.courseId,
                                                                  )
                                                                  .eqOrNull(
                                                                    'subcourse_id',
                                                                    homePageUserDetailsRow
                                                                        ?.subcourseId,
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
                                                                      'HOME_PAGE_PAGE_Container_qg3agguc_ON_TAP');
                                                                  if (FFAppState()
                                                                          .noofhearts !=
                                                                      0) {
                                                                    if (FFAppState()
                                                                            .courseid ==
                                                                        'mbbs') {
                                                                      if (FFAppState()
                                                                              .subcourseid ==
                                                                          'mbbs_learn') {
                                                                        if (containerUserProgressRow?.isActive ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Container_update_app_state');
                                                                          FFAppState().currentunitno =
                                                                              listViewAnatomyQuestionDetailsRow.unitNumber!;
                                                                          FFAppState().currentlevelno =
                                                                              columnAnatomyQuestionDetailsRow.levelNumber!;
                                                                          FFAppState().currentlessonno =
                                                                              homePageUserDetailsRow!.currentLessonNo!;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Container_backend_call');
                                                                          _model.querytocheckiflesson5iscompletedforreview =
                                                                              await UserProgressTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'section_no',
                                                                                  listViewAnatomyQuestionDetailsRow.sectionNumber,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'unit_no',
                                                                                  listViewAnatomyQuestionDetailsRow.unitNumber,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'level_no',
                                                                                  columnAnatomyQuestionDetailsRow.levelNumber,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'lesson_no',
                                                                                  5,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'is_completed',
                                                                                  true,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'course_id',
                                                                                  FFAppState().courseid,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'subcourse_id',
                                                                                  FFAppState().subcourseid,
                                                                                ),
                                                                          );
                                                                          if (_model.querytocheckiflesson5iscompletedforreview != null &&
                                                                              (_model.querytocheckiflesson5iscompletedforreview)!.isNotEmpty) {
                                                                            logFirebaseEvent('Container_update_app_state');
                                                                            FFAppState().currentunitno =
                                                                                listViewAnatomyQuestionDetailsRow.unitNumber!;
                                                                            FFAppState().currentlevelno =
                                                                                columnAnatomyQuestionDetailsRow.levelNumber!;
                                                                            FFAppState().currentlessonno =
                                                                                homePageUserDetailsRow.currentLessonNo!;
                                                                            FFAppState().isreview =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
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
                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
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
                                                                          if (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1) {
                                                                            logFirebaseEvent('Container_update_app_state');
                                                                            FFAppState().currentunitno =
                                                                                listViewAnatomyQuestionDetailsRow.unitNumber!;
                                                                            FFAppState().currentlevelno =
                                                                                columnAnatomyQuestionDetailsRow.levelNumber!;
                                                                            FFAppState().currentlessonno =
                                                                                1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
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
                                                                            logFirebaseEvent('Container_update_app_state');
                                                                            FFAppState().currentunitno =
                                                                                listViewAnatomyQuestionDetailsRow.unitNumber!;
                                                                            FFAppState().currentlevelno =
                                                                                columnAnatomyQuestionDetailsRow.levelNumber!;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
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
                                                                      }
                                                                    } else if (FFAppState()
                                                                            .courseid ==
                                                                        'neetpg') {
                                                                      if (FFAppState()
                                                                              .subcourseid ==
                                                                          'neetpg_pyq') {
                                                                        if (containerUserProgressRow?.isActive ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Container_update_app_state');
                                                                          FFAppState().currentunitno =
                                                                              listViewAnatomyQuestionDetailsRow.unitNumber!;
                                                                          FFAppState().currentlevelno =
                                                                              columnAnatomyQuestionDetailsRow.levelNumber!;
                                                                          FFAppState().currentlessonno =
                                                                              homePageUserDetailsRow!.currentLessonNo!;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Container_backend_call');
                                                                          _model.querytocheckiflesson5iscompletedforreviewneetpgpyq =
                                                                              await UserProgressTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'section_no',
                                                                                  listViewAnatomyQuestionDetailsRow.sectionNumber,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'unit_no',
                                                                                  listViewAnatomyQuestionDetailsRow.unitNumber,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'level_no',
                                                                                  columnAnatomyQuestionDetailsRow.levelNumber,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'lesson_no',
                                                                                  5,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'is_completed',
                                                                                  true,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'course_id',
                                                                                  FFAppState().courseid,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'subcourse_id',
                                                                                  FFAppState().subcourseid,
                                                                                ),
                                                                          );
                                                                          if (_model.querytocheckiflesson5iscompletedforreview != null &&
                                                                              (_model.querytocheckiflesson5iscompletedforreview)!.isNotEmpty) {
                                                                            logFirebaseEvent('Container_update_app_state');
                                                                            FFAppState().currentunitno =
                                                                                listViewAnatomyQuestionDetailsRow.unitNumber!;
                                                                            FFAppState().currentlevelno =
                                                                                columnAnatomyQuestionDetailsRow.levelNumber!;
                                                                            FFAppState().currentlessonno =
                                                                                homePageUserDetailsRow.currentLessonNo!;
                                                                            FFAppState().isreview =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
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
                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
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
                                                                          if (columnAnatomyQuestionDetailsRow.levelNumber.toString() ==
                                                                              '1') {
                                                                            logFirebaseEvent('Container_update_app_state');
                                                                            FFAppState().currentunitno =
                                                                                listViewAnatomyQuestionDetailsRow.unitNumber!;
                                                                            FFAppState().currentlevelno =
                                                                                columnAnatomyQuestionDetailsRow.levelNumber!;
                                                                            FFAppState().currentlessonno =
                                                                                1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
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
                                                                            logFirebaseEvent('Container_update_app_state');
                                                                            FFAppState().currentunitno =
                                                                                listViewAnatomyQuestionDetailsRow.unitNumber!;
                                                                            FFAppState().currentlevelno =
                                                                                columnAnatomyQuestionDetailsRow.levelNumber!;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Container_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
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
                                                                          (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 2) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 2) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 3) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 3) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 4) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 4) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                              5)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 5) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                              6)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 6) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                              7)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 7) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                              8)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 8) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                              9)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent5;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 9) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent5;
                                                                      } else if ((containerUserProgressRow?.isActive != null) &&
                                                                          (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                              10)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 10) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 11) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 11) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 12) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 12) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 13) &&
                                                                          (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                              1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 13) &&
                                                                          (containerUserProgressRow?.isActive !=
                                                                              null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 14)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 14) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 15)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 15) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 16)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 16) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 17) && (containerUserProgressRow?.isActive != null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 17) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 18) && (containerUserProgressRow?.isActive != null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 18) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 20) && (containerUserProgressRow?.isActive != null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 19) && (containerUserProgressRow?.isActive != null)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 19) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 20) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 21)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 21) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 22)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 22) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .alternate;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 23)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 23) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .tertiary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 24)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 24) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondary;
                                                                      } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 25)) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .accent3;
                                                                      } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 25) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
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
                                                                              (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 2) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 2) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 3) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 3) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 4) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 4) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                                  5)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 5) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                                  6)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 6) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                                  7)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 7) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                                  8)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 8) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                                  9)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 9) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 11) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 11) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 12) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 12) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 13) &&
                                                                              (containerUserProgressRow?.isActive !=
                                                                                  null)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 13) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber ==
                                                                                  1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((containerUserProgressRow?.isActive != null) &&
                                                                              (listViewAnatomyQuestionDetailsRow.unitNumber ==
                                                                                  14)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 14) &&
                                                                              (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 15)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 15) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 16)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 16) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 17)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 18)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 18) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 17)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 19) && (containerUserProgressRow?.isActive != null)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 19) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return Color(0xFF9A2720);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 20) && (containerUserProgressRow?.isActive != null)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 20) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 21)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 21) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 22)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 22) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).facebook;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 23)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 23) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((containerUserProgressRow?.isActive != null) && (listViewAnatomyQuestionDetailsRow.unitNumber == 24)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 24) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return Color(0xFFCCBE30);
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 25) && (containerUserProgressRow?.isActive != null)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 25) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 10) && (containerUserProgressRow?.isActive != null)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 10) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
                                                                            return FlutterFlowTheme.of(context).greenShade;
                                                                          } else if ((listViewAnatomyQuestionDetailsRow.unitNumber == 17) && (columnAnatomyQuestionDetailsRow.levelNumber == 1)) {
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
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (FFAppState().notificationsenabled == false)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Remove_background_project_-512px.png',
                                              width: 35.0,
                                              height: 35.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Rozzo wants to send you \npractice reminders!',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_ALLOW_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_custom_action');
                                            await actions
                                                .navigateToAppSettings();
                                          },
                                          text: 'ALLOW',
                                          options: FFButtonOptions(
                                            height: 35.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 30.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 0.0),
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_Image_qhdsmpsw_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 350.0,
                                                      child:
                                                          ChoosecourseWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/navigation-removebg-preview.png',
                                              width: 35.0,
                                              height: 35.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            homePageUserDetailsRow?.gems
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
                                                    FlutterFlowTheme.of(context)
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<SectionDetailRow> rowSectionDetailRowList =
                                    snapshot.data!;

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
                                        'HOME_PAGE_PAGE_Row_hr7fq4is_ON_TAP');
                                    if (FFAppState().courseid == 'mbbs') {
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
                                    }
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
                                            color: FlutterFlowTheme.of(context)
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
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
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
