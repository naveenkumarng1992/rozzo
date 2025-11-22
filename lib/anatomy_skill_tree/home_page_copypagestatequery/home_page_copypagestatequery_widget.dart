import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/needheartopractise_widget.dart';
import '/components/nextlesson1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_copypagestatequery_model.dart';
export 'home_page_copypagestatequery_model.dart';

class HomePageCopypagestatequeryWidget extends StatefulWidget {
  const HomePageCopypagestatequeryWidget({super.key});

  static String routeName = 'HomePageCopypagestatequery';
  static String routePath = '/homePageCopypagestatequery';

  @override
  State<HomePageCopypagestatequeryWidget> createState() =>
      _HomePageCopypagestatequeryWidgetState();
}

class _HomePageCopypagestatequeryWidgetState
    extends State<HomePageCopypagestatequeryWidget> {
  late HomePageCopypagestatequeryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCopypagestatequeryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomePageCopypagestatequery'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_COPYPAGESTATEQUERY_HomePageCopypage');
      logFirebaseEvent('HomePageCopypagestatequery_backend_call');
      _model.psUnits = await AnatomyUnitDetailTable().queryRows(
        queryFn: (q) => q.order('Unit_Number', ascending: true),
      );
      logFirebaseEvent('HomePageCopypagestatequery_backend_call');
      _model.userchallenges = await ChallengeUserChallengeTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .order('challenge_type', ascending: true),
      );
      logFirebaseEvent('HomePageCopypagestatequery_update_app_st');
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
      logFirebaseEvent('HomePageCopypagestatequery_update_app_st');
      FFAppState().challenge2 =
          _model.userchallenges!.elementAtOrNull(1)!.challengeType!;
      safeSetState(() {});
      logFirebaseEvent('HomePageCopypagestatequery_update_app_st');
      FFAppState().challenge3 =
          _model.userchallenges!.elementAtOrNull(2)!.challengeType!;
      safeSetState(() {});
      logFirebaseEvent('HomePageCopypagestatequery_backend_call');
      _model.noofhearts = await UserDetailsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      logFirebaseEvent('HomePageCopypagestatequery_update_app_st');
      FFAppState().noofhearts = _model.noofhearts!.firstOrNull!.totalHearts!;
      safeSetState(() {});
      logFirebaseEvent('HomePageCopypagestatequery_backend_call');
      _model.queryforunits = await AnatomyUnitDetailTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'section_id',
              FFAppState().currentsectionno,
            )
            .order('Unit_Number', ascending: true),
      );
      logFirebaseEvent('HomePageCopypagestatequery_update_page_s');
      _model.unitvariable =
          _model.queryforunits!.toList().cast<AnatomyUnitDetailRow>();
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
        List<UserDetailsRow> homePageCopypagestatequeryUserDetailsRowList =
            snapshot.data!;

        final homePageCopypagestatequeryUserDetailsRow =
            homePageCopypagestatequeryUserDetailsRowList.isNotEmpty
                ? homePageCopypagestatequeryUserDetailsRowList.first
                : null;

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
                    title: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'HOME_COPYPAGESTATEQUERY_Text_7jr7nn39_ON');
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
                    child: Builder(
                      builder: (context) {
                        final dynamicunitquery = _model.unitvariable.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: dynamicunitquery.length,
                          itemBuilder: (context, dynamicunitqueryIndex) {
                            final dynamicunitqueryItem =
                                dynamicunitquery[dynamicunitqueryIndex];
                            return Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
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
                                                  'Unit ${dynamicunitqueryItem.unitNumber?.toString()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
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
                                                    dynamicunitqueryItem
                                                        .unitName,
                                                    'unit name',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
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
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 100.0, 0.0, 0.0),
                                        child: FutureBuilder<
                                            List<AnatomyLevelDetailRow>>(
                                          future: AnatomyLevelDetailTable()
                                              .queryRows(
                                            queryFn: (q) => q
                                                .eqOrNull(
                                                  'section_number',
                                                  FFAppState().currentsectionno,
                                                )
                                                .eqOrNull(
                                                  'unit_number',
                                                  dynamicunitqueryItem
                                                      .unitNumber,
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
                                                          future:
                                                              UserProgressTable()
                                                                  .querySingleRow(
                                                            queryFn: (q) => q
                                                                .eqOrNull(
                                                                  'user_id',
                                                                  currentUserUid,
                                                                )
                                                                .eqOrNull(
                                                                  'section_no',
                                                                  FFAppState()
                                                                      .currentsectionno,
                                                                )
                                                                .eqOrNull(
                                                                  'unit_no',
                                                                  dynamicunitqueryItem
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
                                                            List<UserProgressRow>
                                                                containerUserProgressRowList =
                                                                snapshot.data!;

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
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'HOME_COPYPAGESTATEQUERY_Container_ltrbpi');
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
                                                                        dynamicunitqueryItem
                                                                            .unitNumber!;
                                                                    FFAppState()
                                                                            .currentlevelno =
                                                                        columnAnatomyLevelDetailRow
                                                                            .levelNumber!;
                                                                    FFAppState()
                                                                            .currentlessonno =
                                                                        homePageCopypagestatequeryUserDetailsRow!
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
                                                                            FFAppState().currentsectionno,
                                                                          )
                                                                          .eqOrNull(
                                                                            'unit_no',
                                                                            dynamicunitqueryItem.unitNumber,
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
                                                                      FFAppState()
                                                                              .currentunitno =
                                                                          dynamicunitqueryItem
                                                                              .unitNumber!;
                                                                      FFAppState()
                                                                              .currentlevelno =
                                                                          columnAnatomyLevelDetailRow
                                                                              .levelNumber!;
                                                                      FFAppState()
                                                                              .currentlessonno =
                                                                          homePageCopypagestatequeryUserDetailsRow!
                                                                              .currentLessonNo!;
                                                                      FFAppState()
                                                                              .isreview =
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
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: 170.0,
                                                                                child: Nextlesson1Widget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
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
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: 170.0,
                                                                                child: Nextlesson1Widget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Container_update_app_state');
                                                                    FFAppState()
                                                                            .currentunitno =
                                                                        dynamicunitqueryItem
                                                                            .unitNumber!;
                                                                    FFAppState()
                                                                            .currentlevelno =
                                                                        columnAnatomyLevelDetailRow
                                                                            .levelNumber!;
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
                                                                              child: Nextlesson1Widget(),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Container_bottom_sheet');
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                300.0,
                                                                            child:
                                                                                NeedheartopractiseWidget(),
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
                                                              child: Container(
                                                                width: 70.0,
                                                                height: 70.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if ((containerUserProgressRow?.isActive != null) &&
                                                                        (dynamicunitqueryItem.unitNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    } else if ((dynamicunitqueryItem.unitNumber == 2) &&
                                                                        (containerUserProgressRow?.isActive !=
                                                                            null)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate;
                                                                    } else if ((dynamicunitqueryItem.unitNumber == 2) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate;
                                                                    } else if ((dynamicunitqueryItem.unitNumber == 3) &&
                                                                        (containerUserProgressRow?.isActive !=
                                                                            null)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary;
                                                                    } else if ((dynamicunitqueryItem.unitNumber == 3) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary;
                                                                    } else if ((dynamicunitqueryItem.unitNumber ==
                                                                            4) &&
                                                                        (containerUserProgressRow?.isActive !=
                                                                            null)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary;
                                                                    } else if ((dynamicunitqueryItem.unitNumber ==
                                                                            4) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary;
                                                                    } else if ((containerUserProgressRow?.isActive !=
                                                                            null) &&
                                                                        (dynamicunitqueryItem.unitNumber ==
                                                                            5)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    } else if ((dynamicunitqueryItem.unitNumber ==
                                                                            5) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    } else if ((containerUserProgressRow?.isActive !=
                                                                            null) &&
                                                                        (dynamicunitqueryItem.unitNumber ==
                                                                            6)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate;
                                                                    } else if ((dynamicunitqueryItem.unitNumber ==
                                                                            6) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate;
                                                                    } else if ((containerUserProgressRow?.isActive !=
                                                                            null) &&
                                                                        (dynamicunitqueryItem.unitNumber ==
                                                                            7)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary;
                                                                    } else if ((dynamicunitqueryItem.unitNumber ==
                                                                            7) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary;
                                                                    } else if ((containerUserProgressRow?.isActive !=
                                                                            null) &&
                                                                        (dynamicunitqueryItem.unitNumber ==
                                                                            8)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary;
                                                                    } else if ((dynamicunitqueryItem.unitNumber ==
                                                                            8) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary;
                                                                    } else if ((containerUserProgressRow?.isActive !=
                                                                            null) &&
                                                                        (dynamicunitqueryItem.unitNumber ==
                                                                            9)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent5;
                                                                    } else if ((dynamicunitqueryItem.unitNumber ==
                                                                            9) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent5;
                                                                    } else if ((containerUserProgressRow?.isActive !=
                                                                            null) &&
                                                                        (dynamicunitqueryItem.unitNumber ==
                                                                            10)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    } else if ((dynamicunitqueryItem.unitNumber ==
                                                                            10) &&
                                                                        (columnAnatomyLevelDetailRow.levelNumber ==
                                                                            1)) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .inactiveLevelButton;
                                                                    }
                                                                  }(),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color:
                                                                          () {
                                                                        if ((containerUserProgressRow?.isActive != null) &&
                                                                            (dynamicunitqueryItem.unitNumber ==
                                                                                1)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greenShade;
                                                                        } else if ((dynamicunitqueryItem.unitNumber == 2) &&
                                                                            (containerUserProgressRow?.isActive !=
                                                                                null)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .facebook;
                                                                        } else if ((dynamicunitqueryItem.unitNumber == 2) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .facebook;
                                                                        } else if ((dynamicunitqueryItem.unitNumber == 3) &&
                                                                            (containerUserProgressRow?.isActive !=
                                                                                null)) {
                                                                          return Color(
                                                                              0xFF9A2720);
                                                                        } else if ((dynamicunitqueryItem.unitNumber == 3) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return Color(
                                                                              0xFF9A2720);
                                                                        } else if ((dynamicunitqueryItem.unitNumber ==
                                                                                4) &&
                                                                            (containerUserProgressRow?.isActive !=
                                                                                null)) {
                                                                          return Color(
                                                                              0xFFCCBE30);
                                                                        } else if ((dynamicunitqueryItem.unitNumber ==
                                                                                4) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return Color(
                                                                              0xFFCCBE30);
                                                                        } else if ((containerUserProgressRow?.isActive !=
                                                                                null) &&
                                                                            (dynamicunitqueryItem.unitNumber ==
                                                                                5)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greenShade;
                                                                        } else if ((dynamicunitqueryItem.unitNumber ==
                                                                                5) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greenShade;
                                                                        } else if ((containerUserProgressRow?.isActive !=
                                                                                null) &&
                                                                            (dynamicunitqueryItem.unitNumber ==
                                                                                6)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .facebook;
                                                                        } else if ((dynamicunitqueryItem.unitNumber ==
                                                                                6) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .facebook;
                                                                        } else if ((containerUserProgressRow?.isActive !=
                                                                                null) &&
                                                                            (dynamicunitqueryItem.unitNumber ==
                                                                                7)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else if ((dynamicunitqueryItem.unitNumber ==
                                                                                7) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else if ((containerUserProgressRow?.isActive !=
                                                                                null) &&
                                                                            (dynamicunitqueryItem.unitNumber ==
                                                                                8)) {
                                                                          return Color(
                                                                              0xFFCCBE30);
                                                                        } else if ((dynamicunitqueryItem.unitNumber ==
                                                                                8) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return Color(
                                                                              0xFFCCBE30);
                                                                        } else if ((containerUserProgressRow?.isActive !=
                                                                                null) &&
                                                                            (dynamicunitqueryItem.unitNumber ==
                                                                                9)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else if ((dynamicunitqueryItem.unitNumber ==
                                                                                9) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else if ((containerUserProgressRow?.isActive !=
                                                                                null) &&
                                                                            (dynamicunitqueryItem.unitNumber ==
                                                                                10)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greenShade;
                                                                        } else if ((dynamicunitqueryItem.unitNumber ==
                                                                                10) &&
                                                                            (columnAnatomyLevelDetailRow.levelNumber ==
                                                                                1)) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .greenShade;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .inactiveLevelButtonShadow;
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 300.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          dynamicunitqueryItem
                                              .leftCartoonCharacterUrl!,
                                          width: 100.0,
                                          height: 150.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 190.0, 10.0, 10.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            dynamicunitqueryItem
                                                .rightCartoonCharacterUrl!,
                                            width: 100.0,
                                            height: 150.0,
                                            fit: BoxFit.cover,
                                          ),
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
                                            homePageCopypagestatequeryUserDetailsRow
                                                ?.gems
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
                                        'HOME_COPYPAGESTATEQUERY_Row_c3d9vzzl_ON_');
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
