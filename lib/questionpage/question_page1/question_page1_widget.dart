import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/needheartopractise_widget.dart';
import '/components/questionbasedfeedback_widget.dart';
import '/components/theory_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'question_page1_model.dart';
export 'question_page1_model.dart';

class QuestionPage1Widget extends StatefulWidget {
  const QuestionPage1Widget({super.key});

  static String routeName = 'QuestionPage1';
  static String routePath = '/questionPage1';

  @override
  State<QuestionPage1Widget> createState() => _QuestionPage1WidgetState();
}

class _QuestionPage1WidgetState extends State<QuestionPage1Widget>
    with TickerProviderStateMixin {
  late QuestionPage1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionPage1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QuestionPage1'});
    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<LeaderboardUserRankInTheGroupRow>>(
      future: LeaderboardUserRankInTheGroupTable().querySingleRow(
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
        List<LeaderboardUserRankInTheGroupRow>
            questionPage1LeaderboardUserRankInTheGroupRowList = snapshot.data!;

        final questionPage1LeaderboardUserRankInTheGroupRow =
            questionPage1LeaderboardUserRankInTheGroupRowList.isNotEmpty
                ? questionPage1LeaderboardUserRankInTheGroupRowList.first
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
                    title: Text(
                      'Page Title',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
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
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FutureBuilder<List<AnatomyQuestionDetailsRow>>(
                    future: AnatomyQuestionDetailsTable().querySingleRow(
                      queryFn: (q) => q
                          .eqOrNull(
                            'section_number',
                            FFAppState().currentsectionno,
                          )
                          .eqOrNull(
                            'unit_number',
                            FFAppState().currentunitno,
                          )
                          .eqOrNull(
                            'level_number',
                            FFAppState().currentlevelno,
                          )
                          .eqOrNull(
                            'lesson_number',
                            FFAppState().currentlessonno,
                          )
                          .eqOrNull(
                            'question_number',
                            FFAppState().currentquestionno,
                          )
                          .eqOrNull(
                            'course_id',
                            FFAppState().courseid,
                          )
                          .eqOrNull(
                            'subcourse_id',
                            FFAppState().subcourseid,
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
                          columnAnatomyQuestionDetailsRowList = snapshot.data!;

                      final columnAnatomyQuestionDetailsRow =
                          columnAnatomyQuestionDetailsRowList.isNotEmpty
                              ? columnAnatomyQuestionDetailsRowList.first
                              : null;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (_model.ischeckselected)
                              Text(
                                '${FFAppState().correctanswersinarow.toString()} IN A ROW',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'QUESTION_PAGE1_PAGE_Icon_vhl9td3u_ON_TAP');
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.pushNamed(
                                            HomePageWidget.routeName);

                                        logFirebaseEvent(
                                            'Icon_update_app_state');
                                        FFAppState().correctanswersinarow = 0;
                                        FFAppState().totalnoofcorrectanswers =
                                            0;
                                        FFAppState().currentquestionno = 1;
                                        FFAppState().currentunitno = 1;
                                        FFAppState().currentlevelno = 1;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Icon_update_page_state');
                                        _model.isanswerselected = false;
                                        _model.ischeckselected = false;
                                        _model.iscorrectanswer = false;
                                        _model.selectedoption =
                                            'option selected';
                                        _model.refreshpage = 'page updated';
                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: LinearPercentIndicator(
                                    percent: valueOrDefault<double>(
                                      FFAppState().currentquestionno / 15,
                                      .1,
                                    ),
                                    width: 250.0,
                                    lineHeight: 20.0,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    progressColor:
                                        FlutterFlowTheme.of(context).primary,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    barRadius: Radius.circular(20.0),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 30.0,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconOnActionTriggerAnimation']!,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UserDetailsRow>
                                          textUserDetailsRowList =
                                          snapshot.data!;

                                      final textUserDetailsRow =
                                          textUserDetailsRowList.isNotEmpty
                                              ? textUserDetailsRowList.first
                                              : null;

                                      return Text(
                                        valueOrDefault<String>(
                                          textUserDetailsRow?.totalHearts
                                              ?.toString(),
                                          '5',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'Answer the Question',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            if (columnAnatomyQuestionDetailsRow?.image1Url !=
                                    null &&
                                columnAnatomyQuestionDetailsRow?.image1Url !=
                                    '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (columnAnatomyQuestionDetailsRow
                                                        ?.image1Url !=
                                                    null &&
                                                columnAnatomyQuestionDetailsRow
                                                        ?.image1Url !=
                                                    '')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'QUESTION_PAGE1_Image_rsmq27s3_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_expand_image');
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
                                                            columnAnatomyQuestionDetailsRow!
                                                                .image1Url!,
                                                            fit: BoxFit.contain,
                                                            alignment:
                                                                Alignment(
                                                                    0.0, 0.0),
                                                          ),
                                                          allowRotation: true,
                                                          tag:
                                                              columnAnatomyQuestionDetailsRow!
                                                                  .image1Url!,
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag:
                                                        columnAnatomyQuestionDetailsRow!
                                                            .image1Url!,
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        columnAnatomyQuestionDetailsRow!
                                                            .image1Url!,
                                                        width: 350.0,
                                                        height: 300.0,
                                                        fit: BoxFit.fill,
                                                        alignment:
                                                            Alignment(0.0, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (columnAnatomyQuestionDetailsRow
                                                        ?.image2Url !=
                                                    null &&
                                                columnAnatomyQuestionDetailsRow
                                                        ?.image2Url !=
                                                    '')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'QUESTION_PAGE1_Image_8u6qtkyo_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_expand_image');
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          columnAnatomyQuestionDetailsRow!
                                                              .image1Url!,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: true,
                                                        tag:
                                                            columnAnatomyQuestionDetailsRow!
                                                                .image1Url!,
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag:
                                                      columnAnatomyQuestionDetailsRow!
                                                          .image1Url!,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      columnAnatomyQuestionDetailsRow!
                                                          .image1Url!,
                                                      width: 350.0,
                                                      height: 300.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (columnAnatomyQuestionDetailsRow
                                                        ?.image3Url !=
                                                    null &&
                                                columnAnatomyQuestionDetailsRow
                                                        ?.image3Url !=
                                                    '')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'QUESTION_PAGE1_Image_yq5pd4jo_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_expand_image');
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          columnAnatomyQuestionDetailsRow!
                                                              .image1Url!,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: true,
                                                        tag:
                                                            columnAnatomyQuestionDetailsRow!
                                                                .image1Url!,
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag:
                                                      columnAnatomyQuestionDetailsRow!
                                                          .image1Url!,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      columnAnatomyQuestionDetailsRow!
                                                          .image1Url!,
                                                      width: 350.0,
                                                      height: 300.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (columnAnatomyQuestionDetailsRow
                                                        ?.image4Url !=
                                                    null &&
                                                columnAnatomyQuestionDetailsRow
                                                        ?.image4Url !=
                                                    '')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'QUESTION_PAGE1_Image_567hpclw_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_expand_image');
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          columnAnatomyQuestionDetailsRow!
                                                              .image1Url!,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: true,
                                                        tag:
                                                            columnAnatomyQuestionDetailsRow!
                                                                .image1Url!,
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag:
                                                      columnAnatomyQuestionDetailsRow!
                                                          .image1Url!,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      columnAnatomyQuestionDetailsRow!
                                                          .image1Url!,
                                                      width: 350.0,
                                                      height: 300.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (columnAnatomyQuestionDetailsRow
                                                        ?.image5Url !=
                                                    null &&
                                                columnAnatomyQuestionDetailsRow
                                                        ?.image5Url !=
                                                    '')
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'QUESTION_PAGE1_Image_vymhxe4d_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_expand_image');
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          columnAnatomyQuestionDetailsRow!
                                                              .image1Url!,
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: true,
                                                        tag:
                                                            columnAnatomyQuestionDetailsRow!
                                                                .image1Url!,
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag:
                                                      columnAnatomyQuestionDetailsRow!
                                                          .image1Url!,
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      columnAnatomyQuestionDetailsRow!
                                                          .image1Url!,
                                                      width: 350.0,
                                                      height: 300.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 15.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  columnAnatomyQuestionDetailsRow?.questionText,
                                  'Question Text',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                      lineHeight: 2.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'QUESTION_PAGE1_Container_1t2jp8d7_ON_TAP');
                                  if (FFAppState().courseid == 'mbbs') {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.isanswerselected = true;
                                    _model.selectedoption =
                                        columnAnatomyQuestionDetailsRow!
                                            .optionA!;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.isanswerselected = true;
                                    _model.selectedoption = 'A';
                                    safeSetState(() {});
                                  }
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: 350.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: () {
                                          if (_model.selectedoption ==
                                              columnAnatomyQuestionDetailsRow
                                                  ?.optionA) {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          } else if (_model.selectedoption ==
                                              'A') {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            columnAnatomyQuestionDetailsRow
                                                ?.optionA,
                                            'Option A',
                                          ),
                                          maxLines: 5,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: () {
                                                  if (_model.selectedoption ==
                                                      columnAnatomyQuestionDetailsRow
                                                          ?.optionA) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .alternate;
                                                  } else if (_model
                                                          .selectedoption ==
                                                      'A') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .alternate;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'QUESTION_PAGE1_Container_643dt16w_ON_TAP');
                                  if (FFAppState().courseid == 'mbbs') {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.isanswerselected = true;
                                    _model.selectedoption =
                                        columnAnatomyQuestionDetailsRow!
                                            .optionB!;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.isanswerselected = true;
                                    _model.selectedoption = 'B';
                                    safeSetState(() {});
                                  }
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: 350.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: () {
                                          if (_model.selectedoption ==
                                              columnAnatomyQuestionDetailsRow
                                                  ?.optionB) {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          } else if (_model.selectedoption ==
                                              'B') {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            columnAnatomyQuestionDetailsRow
                                                ?.optionB,
                                            'Option B',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: () {
                                                  if (_model.selectedoption ==
                                                      columnAnatomyQuestionDetailsRow
                                                          ?.optionB) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .alternate;
                                                  } else if (_model
                                                          .selectedoption ==
                                                      'B') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .alternate;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'QUESTION_PAGE1_Container_pazf20b4_ON_TAP');
                                  if (FFAppState().courseid == 'mbbs') {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.isanswerselected = true;
                                    _model.selectedoption =
                                        columnAnatomyQuestionDetailsRow!
                                            .optionC!;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.isanswerselected = true;
                                    _model.selectedoption = 'C';
                                    safeSetState(() {});
                                  }
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: 350.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: () {
                                          if (_model.selectedoption ==
                                              columnAnatomyQuestionDetailsRow
                                                  ?.optionC) {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          } else if (_model.selectedoption ==
                                              'C') {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            columnAnatomyQuestionDetailsRow
                                                ?.optionC,
                                            'Option C',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: () {
                                                  if (_model.selectedoption ==
                                                      columnAnatomyQuestionDetailsRow
                                                          ?.optionC) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .alternate;
                                                  } else if (_model
                                                          .selectedoption ==
                                                      'C') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .alternate;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'QUESTION_PAGE1_Container_7ie4q9a8_ON_TAP');
                                  if (FFAppState().courseid == 'mbbs') {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.isanswerselected = true;
                                    _model.selectedoption =
                                        columnAnatomyQuestionDetailsRow!
                                            .optionD!;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.isanswerselected = true;
                                    _model.selectedoption = 'D';
                                    safeSetState(() {});
                                  }
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    width: 350.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: () {
                                          if (_model.selectedoption ==
                                              columnAnatomyQuestionDetailsRow
                                                  ?.optionD) {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          } else if (_model.selectedoption ==
                                              'D') {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          }
                                        }(),
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            columnAnatomyQuestionDetailsRow
                                                ?.optionD,
                                            'Option D',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: () {
                                                  if (_model.selectedoption ==
                                                      columnAnatomyQuestionDetailsRow
                                                          ?.optionD) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .alternate;
                                                  } else if (_model
                                                          .selectedoption ==
                                                      'D') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .alternate;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText;
                                                  }
                                                }(),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 160.0, 0.0, 0.0),
                                child: FutureBuilder<
                                    List<LeaderboardCollegeWeeklyRankRow>>(
                                  future: LeaderboardCollegeWeeklyRankTable()
                                      .querySingleRow(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'college_id',
                                          questionPage1LeaderboardUserRankInTheGroupRow
                                              ?.collegeId,
                                        )
                                        .eqOrNull(
                                          'state_id',
                                          questionPage1LeaderboardUserRankInTheGroupRow
                                              ?.stateId,
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
                                    List<LeaderboardCollegeWeeklyRankRow>
                                        stackLeaderboardCollegeWeeklyRankRowList =
                                        snapshot.data!;

                                    final stackLeaderboardCollegeWeeklyRankRow =
                                        stackLeaderboardCollegeWeeklyRankRowList
                                                .isNotEmpty
                                            ? stackLeaderboardCollegeWeeklyRankRowList
                                                .first
                                            : null;

                                    return Stack(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      children: [
                                        if ((_model.iscorrectanswer == false) &&
                                            (_model.ischeckselected == true))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 600.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Icon(
                                                                  Icons.warning,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 25.0,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Incorrect',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          fontSize:
                                                                              25.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: InkWell(
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
                                                                      'QUESTION_PAGE1_PAGE_Icon_6qqn2kg2_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_bottom_sheet');
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
                                                                                500.0,
                                                                            child:
                                                                                QuestionbasedfeedbackWidget(),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .flag_circle,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      15.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Correct Answer:',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      15.0,
                                                                      50.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              columnAnatomyQuestionDetailsRow
                                                                  ?.correctOption,
                                                              'correct answer',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      15.0,
                                                                      50.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              columnAnatomyQuestionDetailsRow
                                                                  ?.explanation,
                                                              'explanation',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .explanation,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 10.0))
                                                        .addToEnd(SizedBox(
                                                            height: 40.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if ((_model.ischeckselected == true) &&
                                            (_model.iscorrectanswer == true))
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 50.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryButtonColour,
                                                              size: 25.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Great Job !',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryButtonColour,
                                                                      fontSize:
                                                                          25.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: InkWell(
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
                                                                  'QUESTION_PAGE1_PAGE_Icon_shr5gcpp_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Icon_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            500.0,
                                                                        child:
                                                                            QuestionbasedfeedbackWidget(),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Icon(
                                                              Icons.flag_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryButtonColour,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                                    .addToStart(
                                                        SizedBox(height: 10.0))
                                                    .addToEnd(
                                                        SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 380.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    30.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'QUESTION_PAGE1_Container_5jg921bf_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Container_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        TheoryWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          child: Container(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                width: 3.0,
                                                              ),
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .lightbulb_outline_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    30.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'QUESTION_PAGE1_PAGE_CHECK_BTN_ON_TAP');
                                                            if (_model
                                                                    .isanswerselected ==
                                                                true) {
                                                              if (FFAppState()
                                                                      .noofhearts !=
                                                                  0) {
                                                                logFirebaseEvent(
                                                                    'Button_update_page_state');
                                                                _model.ischeckselected =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                if (_model
                                                                        .selectedoption ==
                                                                    columnAnatomyQuestionDetailsRow
                                                                        ?.correctOption) {
                                                                  logFirebaseEvent(
                                                                      'Button_play_sound');
                                                                  _model.soundPlayer1 ??=
                                                                      AudioPlayer();
                                                                  if (_model
                                                                      .soundPlayer1!
                                                                      .playing) {
                                                                    await _model
                                                                        .soundPlayer1!
                                                                        .stop();
                                                                  }
                                                                  _model
                                                                      .soundPlayer1!
                                                                      .setVolume(
                                                                          1.0);
                                                                  _model
                                                                      .soundPlayer1!
                                                                      .setAsset(
                                                                          'assets/audios/mixkit-quick-win-video-game-notification-269.wav')
                                                                      .then((_) => _model
                                                                          .soundPlayer1!
                                                                          .play());

                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.iscorrectanswer =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_update_app_state');
                                                                  FFAppState()
                                                                          .correctanswersinarow =
                                                                      FFAppState()
                                                                              .correctanswersinarow +
                                                                          1;
                                                                  FFAppState()
                                                                          .totalnoofcorrectanswers =
                                                                      FFAppState()
                                                                              .totalnoofcorrectanswers +
                                                                          1;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Button_play_sound');
                                                                  _model.soundPlayer2 ??=
                                                                      AudioPlayer();
                                                                  if (_model
                                                                      .soundPlayer2!
                                                                      .playing) {
                                                                    await _model
                                                                        .soundPlayer2!
                                                                        .stop();
                                                                  }
                                                                  _model
                                                                      .soundPlayer2!
                                                                      .setVolume(
                                                                          1.0);
                                                                  _model
                                                                      .soundPlayer2!
                                                                      .setAsset(
                                                                          'assets/audios/mixkit-tech-break-fail-2947.wav')
                                                                      .then((_) => _model
                                                                          .soundPlayer2!
                                                                          .play());

                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.iscorrectanswer =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_widget_animation');
                                                                  if (animationsMap[
                                                                          'iconOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'iconOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0)
                                                                        .whenComplete(animationsMap['iconOnActionTriggerAnimation']!
                                                                            .controller
                                                                            .reverse);
                                                                  }
                                                                  logFirebaseEvent(
                                                                      'Button_update_app_state');
                                                                  FFAppState()
                                                                      .correctanswersinarow = 0;
                                                                  FFAppState()
                                                                          .noofhearts =
                                                                      FFAppState()
                                                                              .noofhearts +
                                                                          -1;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_backend_call');
                                                                  await UserDetailsTable()
                                                                      .update(
                                                                    data: {
                                                                      'total_hearts':
                                                                          FFAppState()
                                                                              .noofhearts,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eqOrNull(
                                                                      'user_id',
                                                                      currentUserUid,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Button_bottom_sheet');
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
                                                                              200.0,
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
                                                            }
                                                          },
                                                          text: 'CHECK',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 270.0,
                                                            height: 46.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        10.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: _model
                                                                    .isanswerselected
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: FutureBuilder<
                                              List<UserProgressRow>>(
                                            future: UserProgressTable()
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
                                                    FFAppState().currentunitno,
                                                  )
                                                  .eqOrNull(
                                                    'level_no',
                                                    FFAppState().currentlevelno,
                                                  )
                                                  .eqOrNull(
                                                    'lesson_no',
                                                    FFAppState()
                                                        .currentlessonno,
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
                                              List<UserProgressRow>
                                                  containerUserProgressRowList =
                                                  snapshot.data!;

                                              final containerUserProgressRow =
                                                  containerUserProgressRowList
                                                          .isNotEmpty
                                                      ? containerUserProgressRowList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Visibility(
                                                  visible:
                                                      _model.ischeckselected ==
                                                          true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 30.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<UserDetailsRow>>(
                                                      future: UserDetailsTable()
                                                          .querySingleRow(
                                                        queryFn: (q) =>
                                                            q.eqOrNull(
                                                          'user_id',
                                                          currentUserUid,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<UserDetailsRow>
                                                            buttonUserDetailsRowList =
                                                            snapshot.data!;

                                                        final buttonUserDetailsRow =
                                                            buttonUserDetailsRowList
                                                                    .isNotEmpty
                                                                ? buttonUserDetailsRowList
                                                                    .first
                                                                : null;

                                                        return FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'QUESTION_PAGE1_PAGE_CONTINUE_BTN_ON_TAP');
                                                            if (FFAppState()
                                                                    .courseid ==
                                                                'mbbs') {
                                                              if (FFAppState()
                                                                      .subcourseid ==
                                                                  'mbbs_learn') {
                                                                if (FFAppState()
                                                                        .currentquestionno ==
                                                                    15) {
                                                                  if (FFAppState()
                                                                          .currentlessonno ==
                                                                      5) {
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');
                                                                    _model.checkcurrentlevelnoistotalnooflevels =
                                                                        await AnatomyUnitDetailTable()
                                                                            .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eqOrNull(
                                                                            'Unit_Number',
                                                                            FFAppState().currentunitno,
                                                                          )
                                                                          .eqOrNull(
                                                                            'No_of_Levels',
                                                                            FFAppState().currentlevelno,
                                                                          ),
                                                                    );
                                                                    if (_model.checkcurrentlevelnoistotalnooflevels !=
                                                                            null &&
                                                                        (_model.checkcurrentlevelnoistotalnooflevels)!
                                                                            .isNotEmpty) {
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      _model.checknoofunitsanatomy =
                                                                          await SectionDetailTable()
                                                                              .queryRows(
                                                                        queryFn: (q) => q
                                                                            .eqOrNull(
                                                                              'Section_Number',
                                                                              1,
                                                                            )
                                                                            .eqOrNull(
                                                                              'No_of_Units',
                                                                              FFAppState().currentunitno,
                                                                            ),
                                                                      );
                                                                      if (_model.checknoofunitsanatomy !=
                                                                              null &&
                                                                          (_model.checknoofunitsanatomy)!
                                                                              .isNotEmpty) {
                                                                        if (FFAppState().isreview ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              containerUserProgressRow!.reviewNumber!;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              15;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              FFAppState().reviewnumber + 1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_page_state');
                                                                          _model.isanswerselected =
                                                                              false;
                                                                          _model.ischeckselected =
                                                                              false;
                                                                          _model.iscorrectanswer =
                                                                              false;
                                                                          _model.selectedoption =
                                                                              'option selected';
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          unawaited(
                                                                            () async {
                                                                              await UserProgressTable().update(
                                                                                data: {
                                                                                  'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                  'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                  'xp_earned': 15,
                                                                                  'review_number': FFAppState().reviewnumber,
                                                                                  'difficulty_level': FFAppState().DifficultyLevel,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'user_id',
                                                                                      currentUserUid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_active',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_completed',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'section_no',
                                                                                      FFAppState().currentsectionno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'section_no',
                                                                                      FFAppState().currentsectionno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'unit_no',
                                                                                      FFAppState().currentunitno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'level_no',
                                                                                      FFAppState().currentlevelno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'lesson_no',
                                                                                      FFAppState().currentlessonno,
                                                                                    ),
                                                                              );
                                                                            }(),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .goNamed(
                                                                            LessonCompletedPageWidget.routeName,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.rightToLeft,
                                                                              ),
                                                                            },
                                                                          );

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await LeaderboardUserRankInTheGroupTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await LeaderboardCollegeWeeklyRankTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'college_id',
                                                                                  questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'state_id',
                                                                                  questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                                ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await UserDetailsTable()
                                                                              .update(
                                                                            data: {
                                                                              'total_xp': (buttonUserDetailsRow!.totalXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              60;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_page_state');
                                                                          _model.isanswerselected =
                                                                              false;
                                                                          _model.ischeckselected =
                                                                              false;
                                                                          _model.iscorrectanswer =
                                                                              false;
                                                                          _model.selectedoption =
                                                                              'option selected';
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          _model.activeandcompletesection =
                                                                              await UserProgressTable().update(
                                                                            data: {
                                                                              'is_completed': true,
                                                                              'completed_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                              'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                              'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'is_active',
                                                                                  true,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'is_completed',
                                                                                  false,
                                                                                ),
                                                                            returnRows:
                                                                                true,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .goNamed(LessonCompletedPageWidget.routeName);

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().currentsectionno =
                                                                              FFAppState().currentsectionno + 1;
                                                                          FFAppState().currentunitno =
                                                                              1;
                                                                          FFAppState().currentlevelno =
                                                                              1;
                                                                          FFAppState().currentlessonno =
                                                                              1;
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          _model.querytoupdatesectionxp =
                                                                              await UserDetailsTable().update(
                                                                            data: {
                                                                              'weekly_xp': (buttonUserDetailsRow!.weeklyXp!) + 15,
                                                                              'total_xp': (buttonUserDetailsRow!.totalXp!) + 15,
                                                                              'current_section_no': FFAppState().currentsectionno,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                            returnRows:
                                                                                true,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await UserProgressTable()
                                                                              .insert({
                                                                            'user_id':
                                                                                currentUserUid,
                                                                            'section_no':
                                                                                FFAppState().currentsectionno,
                                                                            'unit_no':
                                                                                FFAppState().currentunitno,
                                                                            'level_no':
                                                                                FFAppState().currentlevelno,
                                                                            'lesson_no':
                                                                                FFAppState().currentlessonno,
                                                                            'is_active':
                                                                                true,
                                                                            'activated_at':
                                                                                supaSerialize<DateTime>(getCurrentTimestamp),
                                                                            'is_completed':
                                                                                false,
                                                                          });
                                                                        }
                                                                      } else {
                                                                        if (FFAppState().isreview ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              containerUserProgressRow!.reviewNumber!;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              15;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              FFAppState().reviewnumber + 1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_page_state');
                                                                          _model.isanswerselected =
                                                                              false;
                                                                          _model.ischeckselected =
                                                                              false;
                                                                          _model.iscorrectanswer =
                                                                              false;
                                                                          _model.selectedoption =
                                                                              'option selected';
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          unawaited(
                                                                            () async {
                                                                              await UserProgressTable().update(
                                                                                data: {
                                                                                  'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                  'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                  'xp_earned': 15,
                                                                                  'review_number': FFAppState().reviewnumber,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'user_id',
                                                                                      currentUserUid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_active',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_completed',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'section_no',
                                                                                      FFAppState().currentsectionno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'section_no',
                                                                                      FFAppState().currentsectionno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'unit_no',
                                                                                      FFAppState().currentunitno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'level_no',
                                                                                      FFAppState().currentlevelno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'lesson_no',
                                                                                      FFAppState().currentlessonno,
                                                                                    ),
                                                                              );
                                                                            }(),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .goNamed(
                                                                            LessonCompletedPageWidget.routeName,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.rightToLeft,
                                                                              ),
                                                                            },
                                                                          );

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await LeaderboardUserRankInTheGroupTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await LeaderboardCollegeWeeklyRankTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'college_id',
                                                                                  questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'state_id',
                                                                                  questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                                ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await UserDetailsTable()
                                                                              .update(
                                                                            data: {
                                                                              'total_xp': (buttonUserDetailsRow!.totalXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              45;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_page_state');
                                                                          _model.isanswerselected =
                                                                              false;
                                                                          _model.ischeckselected =
                                                                              false;
                                                                          _model.iscorrectanswer =
                                                                              false;
                                                                          _model.selectedoption =
                                                                              'option selected';
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          unawaited(
                                                                            () async {
                                                                              _model.activebutnotcompletesection = await UserProgressTable().update(
                                                                                data: {
                                                                                  'is_completed': true,
                                                                                  'completed_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                  'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                  'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                  'difficulty_level': FFAppState().DifficultyLevel,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'is_active',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_completed',
                                                                                      false,
                                                                                    ),
                                                                                returnRows: true,
                                                                              );
                                                                            }(),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .goNamed(LessonCompletedPageWidget.routeName);

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().currentunitno =
                                                                              FFAppState().currentunitno + 1;
                                                                          FFAppState().currentlevelno =
                                                                              1;
                                                                          FFAppState().currentlessonno =
                                                                              1;
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await UserProgressTable()
                                                                              .insert({
                                                                            'user_id':
                                                                                currentUserUid,
                                                                            'section_no':
                                                                                FFAppState().currentsectionno,
                                                                            'unit_no':
                                                                                FFAppState().currentunitno,
                                                                            'level_no':
                                                                                FFAppState().currentlevelno,
                                                                            'lesson_no':
                                                                                FFAppState().currentlessonno,
                                                                            'is_active':
                                                                                true,
                                                                            'activated_at':
                                                                                supaSerialize<DateTime>(getCurrentTimestamp),
                                                                            'is_completed':
                                                                                false,
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          _model.querytoupdateunitxp =
                                                                              await UserDetailsTable().update(
                                                                            data: {
                                                                              'weekly_xp': (buttonUserDetailsRow!.weeklyXp!) + 15,
                                                                              'total_xp': (buttonUserDetailsRow!.totalXp!) + 15,
                                                                              'current_unit_no': FFAppState().currentunitno,
                                                                              'current_level_no': FFAppState().currentlevelno,
                                                                              'current_lesson_no': FFAppState().currentlessonno,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                            returnRows:
                                                                                true,
                                                                          );
                                                                        }
                                                                      }
                                                                    } else {
                                                                      if (FFAppState()
                                                                              .isreview ==
                                                                          true) {
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState().reviewnumber =
                                                                            containerUserProgressRow!.reviewNumber!;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState().lessonendtime =
                                                                            getCurrentTimestamp.secondsSinceEpoch;
                                                                        FFAppState().xpearned =
                                                                            15;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .reviewnumber = FFAppState()
                                                                                .reviewnumber +
                                                                            1;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.isanswerselected =
                                                                            false;
                                                                        _model.ischeckselected =
                                                                            false;
                                                                        _model.iscorrectanswer =
                                                                            false;
                                                                        _model.selectedoption =
                                                                            'option selected';
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        unawaited(
                                                                          () async {
                                                                            await UserProgressTable().update(
                                                                              data: {
                                                                                'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                'xp_earned': 15,
                                                                                'review_number': FFAppState().reviewnumber,
                                                                                'difficulty_level': FFAppState().DifficultyLevel,
                                                                              },
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'is_active',
                                                                                    true,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'is_completed',
                                                                                    true,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'section_no',
                                                                                    FFAppState().currentsectionno,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'section_no',
                                                                                    FFAppState().currentsectionno,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'unit_no',
                                                                                    FFAppState().currentunitno,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'level_no',
                                                                                    FFAppState().currentlevelno,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'lesson_no',
                                                                                    FFAppState().currentlessonno,
                                                                                  ),
                                                                            );
                                                                          }(),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context
                                                                            .goNamed(
                                                                          LessonCompletedPageWidget
                                                                              .routeName,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.rightToLeft,
                                                                            ),
                                                                          },
                                                                        );

                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .currentquestionno = 1;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await LeaderboardUserRankInTheGroupTable()
                                                                            .update(
                                                                          data: {
                                                                            'weekly_xp':
                                                                                (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          ),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await LeaderboardCollegeWeeklyRankTable()
                                                                            .update(
                                                                          data: {
                                                                            'weekly_xp':
                                                                                (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                          },
                                                                          matchingRows: (rows) => rows
                                                                              .eqOrNull(
                                                                                'college_id',
                                                                                questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                              )
                                                                              .eqOrNull(
                                                                                'state_id',
                                                                                questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                              ),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await UserDetailsTable()
                                                                            .update(
                                                                          data: {
                                                                            'total_xp':
                                                                                (buttonUserDetailsRow!.totalXp!) + 15,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState().lessonendtime =
                                                                            getCurrentTimestamp.secondsSinceEpoch;
                                                                        FFAppState().xpearned =
                                                                            30;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.isanswerselected =
                                                                            false;
                                                                        _model.ischeckselected =
                                                                            false;
                                                                        _model.iscorrectanswer =
                                                                            false;
                                                                        _model.selectedoption =
                                                                            'option selected';
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        unawaited(
                                                                          () async {
                                                                            _model.activebutnotcompleteunit =
                                                                                await UserProgressTable().update(
                                                                              data: {
                                                                                'is_completed': true,
                                                                                'completed_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                'difficulty_level': FFAppState().DifficultyLevel,
                                                                              },
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'is_active',
                                                                                    true,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'is_completed',
                                                                                    false,
                                                                                  ),
                                                                              returnRows: true,
                                                                            );
                                                                          }(),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context.goNamed(
                                                                            LessonCompletedPageWidget.routeName);

                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .currentlevelno = FFAppState()
                                                                                .currentlevelno +
                                                                            1;
                                                                        FFAppState()
                                                                            .currentlessonno = 1;
                                                                        FFAppState()
                                                                            .currentquestionno = 1;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        _model.querytoupdatlevelexp =
                                                                            await UserDetailsTable().update(
                                                                          data: {
                                                                            'weekly_xp':
                                                                                (buttonUserDetailsRow!.weeklyXp!) + 15,
                                                                            'total_xp':
                                                                                (buttonUserDetailsRow!.totalXp!) + 15,
                                                                            'current_level_no':
                                                                                FFAppState().currentlevelno,
                                                                            'current_lesson_no':
                                                                                FFAppState().currentlessonno,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          ),
                                                                          returnRows:
                                                                              true,
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await UserProgressTable()
                                                                            .insert({
                                                                          'user_id':
                                                                              currentUserUid,
                                                                          'section_no':
                                                                              FFAppState().currentsectionno,
                                                                          'unit_no':
                                                                              FFAppState().currentunitno,
                                                                          'level_no':
                                                                              FFAppState().currentlevelno,
                                                                          'lesson_no':
                                                                              FFAppState().currentlessonno,
                                                                          'is_active':
                                                                              true,
                                                                          'activated_at':
                                                                              supaSerialize<DateTime>(getCurrentTimestamp),
                                                                          'is_completed':
                                                                              false,
                                                                        });
                                                                      }
                                                                    }
                                                                  } else {
                                                                    if (FFAppState()
                                                                            .isreview ==
                                                                        true) {
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                              .lessonendtime =
                                                                          getCurrentTimestamp
                                                                              .secondsSinceEpoch;
                                                                      FFAppState()
                                                                          .xpearned = 15;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                              .reviewnumber =
                                                                          FFAppState()
                                                                              .reviewnumber;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                              .reviewnumber =
                                                                          FFAppState().reviewnumber +
                                                                              1;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_update_page_state');
                                                                      _model.isanswerselected =
                                                                          false;
                                                                      _model.ischeckselected =
                                                                          false;
                                                                      _model.iscorrectanswer =
                                                                          false;
                                                                      _model.selectedoption =
                                                                          'option selected';
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      unawaited(
                                                                        () async {
                                                                          await UserProgressTable()
                                                                              .update(
                                                                            data: {
                                                                              'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                              'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                              'xp_earned': 15,
                                                                              'review_number': FFAppState().reviewnumber,
                                                                              'difficulty_level': FFAppState().DifficultyLevel,
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'is_active',
                                                                                  true,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'is_completed',
                                                                                  true,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'section_no',
                                                                                  FFAppState().currentsectionno,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'section_no',
                                                                                  FFAppState().currentsectionno,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'unit_no',
                                                                                  FFAppState().currentunitno,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'level_no',
                                                                                  FFAppState().currentlevelno,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'lesson_no',
                                                                                  FFAppState().currentlessonno,
                                                                                ),
                                                                          );
                                                                        }(),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .goNamed(
                                                                        LessonCompletedPageWidget
                                                                            .routeName,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.rightToLeft,
                                                                          ),
                                                                        },
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                          .currentquestionno = 1;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      await LeaderboardUserRankInTheGroupTable()
                                                                          .update(
                                                                        data: {
                                                                          'weekly_xp':
                                                                              (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'user_id',
                                                                          currentUserUid,
                                                                        ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      await LeaderboardCollegeWeeklyRankTable()
                                                                          .update(
                                                                        data: {
                                                                          'weekly_xp':
                                                                              (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                        },
                                                                        matchingRows: (rows) => rows
                                                                            .eqOrNull(
                                                                              'college_id',
                                                                              questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                            )
                                                                            .eqOrNull(
                                                                              'state_id',
                                                                              questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                            ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      await UserDetailsTable()
                                                                          .update(
                                                                        data: {
                                                                          'total_xp':
                                                                              (buttonUserDetailsRow!.totalXp!) + 15,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'user_id',
                                                                          currentUserUid,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                              .lessonendtime =
                                                                          getCurrentTimestamp
                                                                              .secondsSinceEpoch;
                                                                      FFAppState()
                                                                          .xpearned = 15;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_update_page_state');
                                                                      _model.isanswerselected =
                                                                          false;
                                                                      _model.ischeckselected =
                                                                          false;
                                                                      _model.iscorrectanswer =
                                                                          false;
                                                                      _model.selectedoption =
                                                                          'option selected';
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      unawaited(
                                                                        () async {
                                                                          _model.updateuserprogress =
                                                                              await UserProgressTable().update(
                                                                            data: {
                                                                              'is_completed': true,
                                                                              'completed_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                              'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                              'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                              'xp_earned': 15,
                                                                              'difficulty_level': FFAppState().DifficultyLevel,
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'is_active',
                                                                                  true,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'is_completed',
                                                                                  false,
                                                                                ),
                                                                            returnRows:
                                                                                true,
                                                                          );
                                                                        }(),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .goNamed(
                                                                        LessonCompletedPageWidget
                                                                            .routeName,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.rightToLeft,
                                                                          ),
                                                                        },
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                              .currentlessonno =
                                                                          FFAppState().currentlessonno +
                                                                              1;
                                                                      FFAppState()
                                                                          .currentquestionno = 1;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      await LeaderboardUserRankInTheGroupTable()
                                                                          .update(
                                                                        data: {
                                                                          'weekly_xp':
                                                                              (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'user_id',
                                                                          currentUserUid,
                                                                        ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      await LeaderboardCollegeWeeklyRankTable()
                                                                          .update(
                                                                        data: {
                                                                          'weekly_xp':
                                                                              (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                        },
                                                                        matchingRows: (rows) => rows
                                                                            .eqOrNull(
                                                                              'college_id',
                                                                              questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                            )
                                                                            .eqOrNull(
                                                                              'state_id',
                                                                              questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                            ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      await UserDetailsTable()
                                                                          .update(
                                                                        data: {
                                                                          'total_xp':
                                                                              (buttonUserDetailsRow!.totalXp!) + 15,
                                                                          'current_lesson_no':
                                                                              FFAppState().currentlessonno,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eqOrNull(
                                                                          'user_id',
                                                                          currentUserUid,
                                                                        ),
                                                                      );
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');
                                                                      await UserProgressTable()
                                                                          .insert({
                                                                        'user_id':
                                                                            currentUserUid,
                                                                        'section_no':
                                                                            FFAppState().currentsectionno,
                                                                        'unit_no':
                                                                            FFAppState().currentunitno,
                                                                        'level_no':
                                                                            FFAppState().currentlevelno,
                                                                        'lesson_no':
                                                                            FFAppState().currentlessonno,
                                                                        'is_active':
                                                                            true,
                                                                        'activated_at':
                                                                            supaSerialize<DateTime>(getCurrentTimestamp),
                                                                        'is_completed':
                                                                            false,
                                                                      });
                                                                    }
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.isanswerselected =
                                                                      false;
                                                                  _model.ischeckselected =
                                                                      false;
                                                                  _model.iscorrectanswer =
                                                                      false;
                                                                  _model.selectedoption =
                                                                      'option selected';
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_update_app_state');
                                                                  FFAppState()
                                                                          .currentquestionno =
                                                                      FFAppState()
                                                                              .currentquestionno +
                                                                          1;
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Button_update_page_state');
                                                                  _model.refreshpage =
                                                                      'page updated';
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              }
                                                            } else {
                                                              if (FFAppState()
                                                                      .courseid ==
                                                                  'neetpg') {
                                                                if (FFAppState()
                                                                        .subcourseid ==
                                                                    'neetpg_pyq') {
                                                                  if (FFAppState()
                                                                          .currentquestionno ==
                                                                      15) {
                                                                    if (FFAppState()
                                                                            .currentlessonno ==
                                                                        5) {
                                                                      if (FFAppState()
                                                                              .currentlevelno ==
                                                                          9) {
                                                                        if (FFAppState().isreview ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              FFAppState().reviewnumber;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              15;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              FFAppState().reviewnumber + 1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_page_state');
                                                                          _model.isanswerselected =
                                                                              false;
                                                                          _model.ischeckselected =
                                                                              false;
                                                                          _model.iscorrectanswer =
                                                                              false;
                                                                          _model.selectedoption =
                                                                              'option selected';
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          unawaited(
                                                                            () async {
                                                                              await UserProgressTable().update(
                                                                                data: {
                                                                                  'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                  'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                  'xp_earned': 15,
                                                                                  'review_number': FFAppState().reviewnumber,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'user_id',
                                                                                      currentUserUid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_active',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_completed',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'section_no',
                                                                                      FFAppState().currentsectionno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'unit_no',
                                                                                      FFAppState().currentunitno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'level_no',
                                                                                      FFAppState().currentlevelno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'lesson_no',
                                                                                      FFAppState().currentlessonno,
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
                                                                            }(),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .goNamed(
                                                                            LessonCompletedPageWidget.routeName,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.rightToLeft,
                                                                              ),
                                                                            },
                                                                          );

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await LeaderboardUserRankInTheGroupTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await LeaderboardCollegeWeeklyRankTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'college_id',
                                                                                  questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'state_id',
                                                                                  questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                                ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await UserDetailsTable()
                                                                              .update(
                                                                            data: {
                                                                              'total_xp': (buttonUserDetailsRow!.totalXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              60;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_page_state');
                                                                          _model.isanswerselected =
                                                                              false;
                                                                          _model.ischeckselected =
                                                                              false;
                                                                          _model.iscorrectanswer =
                                                                              false;
                                                                          _model.selectedoption =
                                                                              'option selected';
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          _model.activeandcompletesectionneetpgpyq =
                                                                              await UserProgressTable().update(
                                                                            data: {
                                                                              'is_completed': true,
                                                                              'completed_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                              'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                              'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'is_active',
                                                                                  true,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'is_completed',
                                                                                  false,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'course_id',
                                                                                  FFAppState().courseid,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'subcourse_id',
                                                                                  FFAppState().subcourseid,
                                                                                ),
                                                                            returnRows:
                                                                                true,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .goNamed(LessonCompletedPageWidget.routeName);

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().currentsectionno =
                                                                              FFAppState().currentsectionno + 1;
                                                                          FFAppState().currentunitno =
                                                                              1;
                                                                          FFAppState().currentlevelno =
                                                                              1;
                                                                          FFAppState().currentlessonno =
                                                                              1;
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          _model.querytoupdatesectionxpneetpgpyq =
                                                                              await UserDetailsTable().update(
                                                                            data: {
                                                                              'weekly_xp': (buttonUserDetailsRow!.weeklyXp!) + 15,
                                                                              'total_xp': (buttonUserDetailsRow!.totalXp!) + 15,
                                                                              'current_section_no': FFAppState().currentsectionno,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                            returnRows:
                                                                                true,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await UserProgressTable()
                                                                              .insert({
                                                                            'user_id':
                                                                                currentUserUid,
                                                                            'section_no':
                                                                                FFAppState().currentsectionno,
                                                                            'unit_no':
                                                                                FFAppState().currentunitno,
                                                                            'level_no':
                                                                                FFAppState().currentlevelno,
                                                                            'lesson_no':
                                                                                FFAppState().currentlessonno,
                                                                            'is_active':
                                                                                true,
                                                                            'activated_at':
                                                                                supaSerialize<DateTime>(getCurrentTimestamp),
                                                                            'is_completed':
                                                                                false,
                                                                            'course_id':
                                                                                FFAppState().courseid,
                                                                            'subcourse_id':
                                                                                FFAppState().subcourseid,
                                                                          });
                                                                        }
                                                                      } else {
                                                                        if (FFAppState().isreview ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              containerUserProgressRow!.reviewNumber!;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              15;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              FFAppState().reviewnumber + 1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_page_state');
                                                                          _model.isanswerselected =
                                                                              false;
                                                                          _model.ischeckselected =
                                                                              false;
                                                                          _model.iscorrectanswer =
                                                                              false;
                                                                          _model.selectedoption =
                                                                              'option selected';
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          unawaited(
                                                                            () async {
                                                                              await UserProgressTable().update(
                                                                                data: {
                                                                                  'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                  'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                  'xp_earned': 15,
                                                                                  'review_number': FFAppState().reviewnumber,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'user_id',
                                                                                      currentUserUid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_active',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_completed',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'section_no',
                                                                                      FFAppState().currentsectionno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'unit_no',
                                                                                      FFAppState().currentunitno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'level_no',
                                                                                      FFAppState().currentlevelno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'lesson_no',
                                                                                      FFAppState().currentlessonno,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'course_id',
                                                                                      FFAppState().courseid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'subcourse_id',
                                                                                      '',
                                                                                    ),
                                                                              );
                                                                            }(),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .goNamed(
                                                                            LessonCompletedPageWidget.routeName,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.rightToLeft,
                                                                              ),
                                                                            },
                                                                          );

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await LeaderboardUserRankInTheGroupTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await LeaderboardCollegeWeeklyRankTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'college_id',
                                                                                  questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'state_id',
                                                                                  questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                                ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await UserDetailsTable()
                                                                              .update(
                                                                            data: {
                                                                              'total_xp': (buttonUserDetailsRow!.totalXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              30;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_update_page_state');
                                                                          _model.isanswerselected =
                                                                              false;
                                                                          _model.ischeckselected =
                                                                              false;
                                                                          _model.iscorrectanswer =
                                                                              false;
                                                                          _model.selectedoption =
                                                                              'option selected';
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          unawaited(
                                                                            () async {
                                                                              _model.activebutnotcompleteunitpyqpg = await UserProgressTable().update(
                                                                                data: {
                                                                                  'is_completed': true,
                                                                                  'completed_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                  'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                  'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'is_active',
                                                                                      true,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'is_completed',
                                                                                      false,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'course_id',
                                                                                      FFAppState().courseid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'subcourse_id',
                                                                                      FFAppState().subcourseid,
                                                                                    ),
                                                                                returnRows: true,
                                                                              );
                                                                            }(),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .goNamed(LessonCompletedPageWidget.routeName);

                                                                          logFirebaseEvent(
                                                                              'Button_update_app_state');
                                                                          FFAppState().currentlevelno =
                                                                              FFAppState().currentlevelno + 1;
                                                                          FFAppState().currentlessonno =
                                                                              1;
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          _model.querytoupdatlevelexppyqpg =
                                                                              await UserDetailsTable().update(
                                                                            data: {
                                                                              'weekly_xp': (buttonUserDetailsRow!.weeklyXp!) + 15,
                                                                              'total_xp': (buttonUserDetailsRow!.totalXp!) + 15,
                                                                              'current_level_no': FFAppState().currentlevelno,
                                                                              'current_lesson_no': FFAppState().currentlessonno,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                            returnRows:
                                                                                true,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          await UserProgressTable()
                                                                              .insert({
                                                                            'user_id':
                                                                                currentUserUid,
                                                                            'section_no':
                                                                                FFAppState().currentsectionno,
                                                                            'unit_no':
                                                                                FFAppState().currentunitno,
                                                                            'level_no':
                                                                                FFAppState().currentlevelno,
                                                                            'lesson_no':
                                                                                FFAppState().currentlessonno,
                                                                            'is_active':
                                                                                true,
                                                                            'activated_at':
                                                                                supaSerialize<DateTime>(getCurrentTimestamp),
                                                                            'is_completed':
                                                                                false,
                                                                            'course_id':
                                                                                FFAppState().courseid,
                                                                            'subcourse_id':
                                                                                FFAppState().subcourseid,
                                                                          });
                                                                        }
                                                                      }
                                                                    } else {
                                                                      if (FFAppState()
                                                                              .isreview ==
                                                                          true) {
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState().lessonendtime =
                                                                            getCurrentTimestamp.secondsSinceEpoch;
                                                                        FFAppState().xpearned =
                                                                            15;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState().reviewnumber =
                                                                            FFAppState().reviewnumber;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .reviewnumber = FFAppState()
                                                                                .reviewnumber +
                                                                            1;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.isanswerselected =
                                                                            false;
                                                                        _model.ischeckselected =
                                                                            false;
                                                                        _model.iscorrectanswer =
                                                                            false;
                                                                        _model.selectedoption =
                                                                            'option selected';
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        unawaited(
                                                                          () async {
                                                                            await UserProgressTable().update(
                                                                              data: {
                                                                                'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                'xp_earned': 15,
                                                                                'review_number': FFAppState().reviewnumber,
                                                                              },
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'is_active',
                                                                                    true,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'is_completed',
                                                                                    true,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'section_no',
                                                                                    FFAppState().currentsectionno,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'unit_no',
                                                                                    FFAppState().currentunitno,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'level_no',
                                                                                    FFAppState().currentlevelno,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'lesson_no',
                                                                                    FFAppState().currentlessonno,
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
                                                                          }(),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context
                                                                            .goNamed(
                                                                          LessonCompletedPageWidget
                                                                              .routeName,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.rightToLeft,
                                                                            ),
                                                                          },
                                                                        );

                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .currentquestionno = 1;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await LeaderboardUserRankInTheGroupTable()
                                                                            .update(
                                                                          data: {
                                                                            'weekly_xp':
                                                                                (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          ),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await LeaderboardCollegeWeeklyRankTable()
                                                                            .update(
                                                                          data: {
                                                                            'weekly_xp':
                                                                                (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                          },
                                                                          matchingRows: (rows) => rows
                                                                              .eqOrNull(
                                                                                'college_id',
                                                                                questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                              )
                                                                              .eqOrNull(
                                                                                'state_id',
                                                                                questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                              ),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await UserDetailsTable()
                                                                            .update(
                                                                          data: {
                                                                            'total_xp':
                                                                                (buttonUserDetailsRow!.totalXp!) + 15,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState().lessonendtime =
                                                                            getCurrentTimestamp.secondsSinceEpoch;
                                                                        FFAppState().xpearned =
                                                                            15;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_update_page_state');
                                                                        _model.isanswerselected =
                                                                            false;
                                                                        _model.ischeckselected =
                                                                            false;
                                                                        _model.iscorrectanswer =
                                                                            false;
                                                                        _model.selectedoption =
                                                                            'option selected';
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        unawaited(
                                                                          () async {
                                                                            _model.updateuserprogressneetpgpyq =
                                                                                await UserProgressTable().update(
                                                                              data: {
                                                                                'is_completed': true,
                                                                                'completed_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                'xp_earned': 15,
                                                                                'course_id': FFAppState().courseid,
                                                                                'subcourse_id': FFAppState().subcourseid,
                                                                              },
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'user_id',
                                                                                    currentUserUid,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'is_active',
                                                                                    true,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'is_completed',
                                                                                    false,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'course_id',
                                                                                    'neetpg',
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'subcourse_id',
                                                                                    FFAppState().subcourseid,
                                                                                  ),
                                                                              returnRows: true,
                                                                            );
                                                                          }(),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context
                                                                            .goNamed(
                                                                          LessonCompletedPageWidget
                                                                              .routeName,
                                                                          extra: <String,
                                                                              dynamic>{
                                                                            kTransitionInfoKey:
                                                                                TransitionInfo(
                                                                              hasTransition: true,
                                                                              transitionType: PageTransitionType.rightToLeft,
                                                                            ),
                                                                          },
                                                                        );

                                                                        logFirebaseEvent(
                                                                            'Button_update_app_state');
                                                                        FFAppState()
                                                                            .currentlessonno = FFAppState()
                                                                                .currentlessonno +
                                                                            1;
                                                                        FFAppState()
                                                                            .currentquestionno = 1;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await LeaderboardUserRankInTheGroupTable()
                                                                            .update(
                                                                          data: {
                                                                            'weekly_xp':
                                                                                (questionPage1LeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          ),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await LeaderboardCollegeWeeklyRankTable()
                                                                            .update(
                                                                          data: {
                                                                            'weekly_xp':
                                                                                (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                          },
                                                                          matchingRows: (rows) => rows
                                                                              .eqOrNull(
                                                                                'college_id',
                                                                                questionPage1LeaderboardUserRankInTheGroupRow?.collegeId,
                                                                              )
                                                                              .eqOrNull(
                                                                                'state_id',
                                                                                questionPage1LeaderboardUserRankInTheGroupRow?.stateId,
                                                                              ),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await UserDetailsTable()
                                                                            .update(
                                                                          data: {
                                                                            'total_xp':
                                                                                (buttonUserDetailsRow!.totalXp!) + 15,
                                                                            'current_lesson_no':
                                                                                FFAppState().currentlessonno,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eqOrNull(
                                                                            'user_id',
                                                                            currentUserUid,
                                                                          ),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');
                                                                        await UserProgressTable()
                                                                            .insert({
                                                                          'user_id':
                                                                              currentUserUid,
                                                                          'section_no':
                                                                              FFAppState().currentsectionno,
                                                                          'unit_no':
                                                                              FFAppState().currentunitno,
                                                                          'level_no':
                                                                              FFAppState().currentlevelno,
                                                                          'lesson_no':
                                                                              FFAppState().currentlessonno,
                                                                          'is_active':
                                                                              true,
                                                                          'activated_at':
                                                                              supaSerialize<DateTime>(getCurrentTimestamp),
                                                                          'is_completed':
                                                                              false,
                                                                          'course_id':
                                                                              FFAppState().courseid,
                                                                          'subcourse_id':
                                                                              FFAppState().subcourseid,
                                                                        });
                                                                      }
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_update_page_state');
                                                                    _model.isanswerselected =
                                                                        false;
                                                                    _model.ischeckselected =
                                                                        false;
                                                                    _model.iscorrectanswer =
                                                                        false;
                                                                    _model.selectedoption =
                                                                        'option selected';
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Button_update_app_state');
                                                                    FFAppState()
                                                                            .currentquestionno =
                                                                        FFAppState().currentquestionno +
                                                                            1;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Button_update_page_state');
                                                                    _model.refreshpage =
                                                                        'page updated';
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                }
                                                              }
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          text: 'CONTINUE',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 350.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 30.0)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
