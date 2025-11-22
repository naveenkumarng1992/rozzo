import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
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
import '/custom_code/widgets/index.dart' as custom_widgets;
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
import 'question_page_clinicalcases_model.dart';
export 'question_page_clinicalcases_model.dart';

class QuestionPageClinicalcasesWidget extends StatefulWidget {
  const QuestionPageClinicalcasesWidget({super.key});

  static String routeName = 'QuestionPageClinicalcases';
  static String routePath = '/questionPageClinicalcases';

  @override
  State<QuestionPageClinicalcasesWidget> createState() =>
      _QuestionPageClinicalcasesWidgetState();
}

class _QuestionPageClinicalcasesWidgetState
    extends State<QuestionPageClinicalcasesWidget>
    with TickerProviderStateMixin {
  late QuestionPageClinicalcasesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionPageClinicalcasesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QuestionPageClinicalcases'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUESTION_CLINICALCASES_QuestionPageClini');
      logFirebaseEvent('QuestionPageClinicalcases_backend_call');
      _model.queryformultiselect =
          await AnatomyQuestionDetailsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'question_type',
              'multi_select',
            )
            .eqOrNull(
              'lesson_number',
              FFAppState().currentlessonno,
            )
            .eqOrNull(
              'difficulty_level',
              FFAppState().DifficultyLevel,
            )
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
              'course_id',
              'mbbs',
            ),
      );
      logFirebaseEvent('QuestionPageClinicalcases_update_page_st');
      _model.multiselectcorrectoptionids =
          (_model.queryformultiselect!.firstOrNull!.correctAnswer! as List)
              .cast<int>()
              .toList()
              .cast<int>();
      _model.questiontype =
          _model.queryformultiselect?.firstOrNull?.questionType;
      safeSetState(() {});
      logFirebaseEvent('QuestionPageClinicalcases_update_app_sta');
      FFAppState().multiselectcorrectoptionids = (getJsonField(
        _model.queryformultiselect!.firstOrNull!.correctAnswer!,
        r'''$.id''',
        true,
      ) as List?)!
          .cast<int>()
          .toList()
          .cast<int>();
      safeSetState(() {});
      logFirebaseEvent('QuestionPageClinicalcases_backend_call');
      _model.updatequestiontype = await AnatomyQuestionDetailsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'lesson_number',
              FFAppState().currentlessonno,
            )
            .eqOrNull(
              'difficulty_level',
              FFAppState().DifficultyLevel,
            )
            .eqOrNull(
              'question_number',
              FFAppState().currentquestionno,
            )
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
              'difficulty_level',
              FFAppState().DifficultyLevel,
            )
            .eqOrNull(
              'course_id',
              FFAppState().courseid,
            ),
      );
      logFirebaseEvent('QuestionPageClinicalcases_update_page_st');
      _model.questiontype =
          _model.updatequestiontype?.firstOrNull?.questionType;
      safeSetState(() {});
      if (_model.questiontype == 'mcq') {
        logFirebaseEvent('QuestionPageClinicalcases_update_page_st');
        _model.mcqtruefalsecorrectoption = getJsonField(
          _model.queryformultiselect?.firstOrNull?.correctAnswer,
          r'''$.id''',
        );
        safeSetState(() {});
      } else if (_model.questiontype == 'true_false') {
        logFirebaseEvent('QuestionPageClinicalcases_update_page_st');
        _model.mcqtruefalsecorrectoption =
            _model.queryformultiselect?.firstOrNull?.correctAnswer;
        safeSetState(() {});
      } else if (_model.questiontype == 'match_pairs') {
        logFirebaseEvent('QuestionPageClinicalcases_update_page_st');
        _model.matchleftoptions = getJsonField(
          _model.queryformultiselect!.firstOrNull!.options!,
          r'''$.left''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        _model.matchrightoptions = getJsonField(
          _model.queryformultiselect!.firstOrNull!.options!,
          r'''$.right''',
          true,
        )!
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
      } else if (_model.questiontype == 'multi_select') {
        logFirebaseEvent('QuestionPageClinicalcases_update_page_st');
        _model.multiselectoptionlist = _model
            .queryformultiselect!.firstOrNull!.options!
            .toList()
            .cast<dynamic>();
        _model.multiselectcorrectoptionids =
            (_model.queryformultiselect!.firstOrNull!.correctAnswer! as List)
                .cast<int>()
                .toList()
                .cast<int>();
        safeSetState(() {});
      }
    });

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
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 2.0,
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
            questionPageClinicalcasesLeaderboardUserRankInTheGroupRowList =
            snapshot.data!;

        final questionPageClinicalcasesLeaderboardUserRankInTheGroupRow =
            questionPageClinicalcasesLeaderboardUserRankInTheGroupRowList
                    .isNotEmpty
                ? questionPageClinicalcasesLeaderboardUserRankInTheGroupRowList
                    .first
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
                child: FutureBuilder<List<AnatomyQuestionDetailsRow>>(
                  future: AnatomyQuestionDetailsTable().querySingleRow(
                    queryFn: (q) => q
                        .eqOrNull(
                          'question_number',
                          FFAppState().currentquestionno,
                        )
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
                          'difficulty_level',
                          FFAppState().DifficultyLevel,
                        )
                        .eqOrNull(
                          'course_id',
                          FFAppState().courseid,
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
                        containertopmostAnatomyQuestionDetailsRowList =
                        snapshot.data!;

                    final containertopmostAnatomyQuestionDetailsRow =
                        containertopmostAnatomyQuestionDetailsRowList.isNotEmpty
                            ? containertopmostAnatomyQuestionDetailsRowList
                                .first
                            : null;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child:
                                FutureBuilder<List<AnatomyQuestionDetailsRow>>(
                              future:
                                  AnatomyQuestionDetailsTable().querySingleRow(
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
                                      'difficulty_level',
                                      FFAppState().DifficultyLevel,
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
                                List<AnatomyQuestionDetailsRow>
                                    columnAnatomyQuestionDetailsRowList =
                                    snapshot.data!;

                                final columnAnatomyQuestionDetailsRow =
                                    columnAnatomyQuestionDetailsRowList
                                            .isNotEmpty
                                        ? columnAnatomyQuestionDetailsRowList
                                            .first
                                        : null;

                                return SingleChildScrollView(
                                  primary: false,
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
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'QUESTION_CLINICALCASES_Icon_ho6kfagw_ON_');
                                                  logFirebaseEvent(
                                                      'Icon_navigate_to');

                                                  context.pushNamed(
                                                      HomePageWidget.routeName);

                                                  logFirebaseEvent(
                                                      'Icon_update_app_state');
                                                  FFAppState()
                                                      .correctanswersinarow = 0;
                                                  FFAppState()
                                                      .totalnoofcorrectanswers = 0;
                                                  FFAppState()
                                                      .currentquestionno = 1;
                                                  FFAppState().currentunitno =
                                                      1;
                                                  FFAppState().currentlevelno =
                                                      1;
                                                  safeSetState(() {});
                                                  logFirebaseEvent(
                                                      'Icon_update_page_state');
                                                  _model.isanswerselected =
                                                      false;
                                                  _model.ischeckselected =
                                                      false;
                                                  _model.iscorrectanswer =
                                                      false;
                                                  _model.selectedoption =
                                                      'option selected';
                                                  _model.refreshpage =
                                                      'page updated';
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: LinearPercentIndicator(
                                              percent: valueOrDefault<double>(
                                                FFAppState().currentquestionno /
                                                    10,
                                                .1,
                                              ),
                                              width: 250.0,
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
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.favorite,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 30.0,
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'iconOnActionTriggerAnimation']!,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3.0, 0.0, 0.0, 0.0),
                                            child: FutureBuilder<
                                                List<UserDetailsRow>>(
                                              future: UserDetailsTable()
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
                                                List<UserDetailsRow>
                                                    textUserDetailsRowList =
                                                    snapshot.data!;

                                                final textUserDetailsRow =
                                                    textUserDetailsRowList
                                                            .isNotEmpty
                                                        ? textUserDetailsRowList
                                                            .first
                                                        : null;

                                                return Text(
                                                  valueOrDefault<String>(
                                                    textUserDetailsRow
                                                        ?.totalHearts
                                                        ?.toString(),
                                                    '5',
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
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
                                      if (columnAnatomyQuestionDetailsRow
                                                  ?.image1Url !=
                                              null &&
                                          columnAnatomyQuestionDetailsRow
                                                  ?.image1Url !=
                                              '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 300.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (columnAnatomyQuestionDetailsRow
                                                                  ?.image1Url !=
                                                              null &&
                                                          columnAnatomyQuestionDetailsRow
                                                                  ?.image1Url !=
                                                              '')
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
                                                                  'QUESTION_CLINICALCASES_Image_oo21n2bm_ON');
                                                              logFirebaseEvent(
                                                                  'Image_expand_image');
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      columnAnatomyQuestionDetailsRow!
                                                                          .image1Url!,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      alignment:
                                                                          Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                    ),
                                                                    allowRotation:
                                                                        true,
                                                                    tag: columnAnatomyQuestionDetailsRow!
                                                                        .image1Url!,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag: columnAnatomyQuestionDetailsRow!
                                                                  .image1Url!,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  columnAnatomyQuestionDetailsRow!
                                                                      .image1Url!,
                                                                  width: 350.0,
                                                                  height: 300.0,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          0.0),
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
                                                                'QUESTION_CLINICALCASES_Image_pvo2pyic_ON');
                                                            logFirebaseEvent(
                                                                'Image_expand_image');
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    columnAnatomyQuestionDetailsRow!
                                                                        .image1Url!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      true,
                                                                  tag: columnAnatomyQuestionDetailsRow!
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                columnAnatomyQuestionDetailsRow!
                                                                    .image1Url!,
                                                                width: 350.0,
                                                                height: 300.0,
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                'QUESTION_CLINICALCASES_Image_bwz2mzxr_ON');
                                                            logFirebaseEvent(
                                                                'Image_expand_image');
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    columnAnatomyQuestionDetailsRow!
                                                                        .image1Url!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      true,
                                                                  tag: columnAnatomyQuestionDetailsRow!
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                columnAnatomyQuestionDetailsRow!
                                                                    .image1Url!,
                                                                width: 350.0,
                                                                height: 300.0,
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                'QUESTION_CLINICALCASES_Image_pn3ib2um_ON');
                                                            logFirebaseEvent(
                                                                'Image_expand_image');
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    columnAnatomyQuestionDetailsRow!
                                                                        .image1Url!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      true,
                                                                  tag: columnAnatomyQuestionDetailsRow!
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                columnAnatomyQuestionDetailsRow!
                                                                    .image1Url!,
                                                                width: 350.0,
                                                                height: 300.0,
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                'QUESTION_CLINICALCASES_Image_ywis5eed_ON');
                                                            logFirebaseEvent(
                                                                'Image_expand_image');
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    columnAnatomyQuestionDetailsRow!
                                                                        .image1Url!,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      true,
                                                                  tag: columnAnatomyQuestionDetailsRow!
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
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                columnAnatomyQuestionDetailsRow!
                                                                    .image1Url!,
                                                                width: 350.0,
                                                                height: 300.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().DifficultyLevel == 1)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 30.0, 10.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (FFAppState()
                                                        .DifficultyLevel ==
                                                    1)
                                                  Text(
                                                    valueOrDefault<String>(
                                                      containertopmostAnatomyQuestionDetailsRow
                                                          ?.conversationTitle,
                                                      'Title',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                if (FFAppState()
                                                        .DifficultyLevel ==
                                                    1)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 20.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        containertopmostAnatomyQuestionDetailsRow
                                                            ?.conversationDescription,
                                                        'Description',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                Container(
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: FutureBuilder<
                                                        List<
                                                            AnatomyQuestionDetailsRow>>(
                                                      future:
                                                          AnatomyQuestionDetailsTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .lteOrNull(
                                                              'question_number',
                                                              FFAppState()
                                                                  .currentquestionno,
                                                            )
                                                            .eqOrNull(
                                                              'difficulty_level',
                                                              1,
                                                            )
                                                            .eqOrNull(
                                                              'lesson_number',
                                                              FFAppState()
                                                                  .currentlessonno,
                                                            )
                                                            .eqOrNull(
                                                              'course_id',
                                                              FFAppState()
                                                                  .courseid,
                                                            )
                                                            .eqOrNull(
                                                              'section_number',
                                                              FFAppState()
                                                                  .currentsectionno,
                                                            )
                                                            .eqOrNull(
                                                              'unit_number',
                                                              FFAppState()
                                                                  .currentunitno,
                                                            )
                                                            .eqOrNull(
                                                              'level_number',
                                                              FFAppState()
                                                                  .currentlevelno,
                                                            )
                                                            .eqOrNull(
                                                              'section_number',
                                                              FFAppState()
                                                                  .currentsectionno,
                                                            )
                                                            .order(
                                                                'question_number',
                                                                ascending:
                                                                    true),
                                                        limit: 10,
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
                                                        List<AnatomyQuestionDetailsRow>
                                                            listViewAnatomyQuestionDetailsRowList =
                                                            snapshot.data!;

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewAnatomyQuestionDetailsRowList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 10.0),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewAnatomyQuestionDetailsRow =
                                                                listViewAnatomyQuestionDetailsRowList[
                                                                    listViewIndex];
                                                            return Visibility(
                                                              visible: listViewAnatomyQuestionDetailsRow
                                                                      .questionType ==
                                                                  'conversation',
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (listViewAnatomyQuestionDetailsRow
                                                                            .questionType ==
                                                                        'conversation')
                                                                      Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          listViewAnatomyQuestionDetailsRow
                                                                              .characterImage!,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            10.0,
                                                                            5.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 3.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                10.0,
                                                                                10.0,
                                                                                10.0),
                                                                            child:
                                                                                custom_widgets.RozzoMarkdownViewer(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              content: listViewAnatomyQuestionDetailsRow.questionText!,
                                                                            ),
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (containertopmostAnatomyQuestionDetailsRow
                                              ?.questionType ==
                                          'multi_select')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Choose all the suitable options',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 20.0,
                                                          10.0, 20.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containertopmostAnatomyQuestionDetailsRow
                                                          ?.questionText,
                                                      'Multi Select Question not available',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
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
                                                          fontSize: 16.0,
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
                                                          lineHeight: 2.0,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final multiselect =
                                                          containertopmostAnatomyQuestionDetailsRow
                                                                  ?.options
                                                                  ?.toList() ??
                                                              [];

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            multiselect.length,
                                                            (multiselectIndex) {
                                                          final multiselectItem =
                                                              multiselect[
                                                                  multiselectIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
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
                                                                    'QUESTION_CLINICALCASES_Container_k048rcg');
                                                                if (_model
                                                                        .iscorrectanswer ==
                                                                    false) {
                                                                  if (_model
                                                                      .multiselectcorrectoptionids
                                                                      .contains(
                                                                          getJsonField(
                                                                    multiselectItem,
                                                                    r'''$.id''',
                                                                  ))) {
                                                                    if (_model
                                                                        .multiselectselectedoptionids
                                                                        .contains(
                                                                            getJsonField(
                                                                      multiselectItem,
                                                                      r'''$.id''',
                                                                    ))) {
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.removeFromMultiselectselectedoptionids(
                                                                          getJsonField(
                                                                        multiselectItem,
                                                                        r'''$.id''',
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.addToMultiselectselectedoptionids(
                                                                          getJsonField(
                                                                        multiselectItem,
                                                                        r'''$.id''',
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    if (_model
                                                                            .multiselectcorrectoptionids
                                                                            .length ==
                                                                        _model
                                                                            .multiselectselectedoptionids
                                                                            .length) {
                                                                      logFirebaseEvent(
                                                                          'Container_play_sound');
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
                                                                          'Container_update_page_state');
                                                                      _model.isanswerselected =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.iscorrectanswer =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.ischeckselected =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Container_play_sound');
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
                                                                        'Container_update_page_state');
                                                                    _model.addToMultiselectselectedoptionids(
                                                                        getJsonField(
                                                                      multiselectItem,
                                                                      r'''$.id''',
                                                                    ));
                                                                    _model.ischeckselected =
                                                                        true;
                                                                    _model.isanswerselected =
                                                                        true;
                                                                    _model.iscorrectanswer =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'Container_update_app_state');
                                                                    FFAppState()
                                                                            .noofhearts =
                                                                        FFAppState().noofhearts +
                                                                            -1;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                }
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: _model
                                                                            .multiselectselectedoptionids
                                                                            .contains(
                                                                                getJsonField(
                                                                      multiselectItem,
                                                                      r'''$.id''',
                                                                    ))
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .alternate
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    width: 3.0,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        multiselectItem,
                                                                        r'''$.label''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: _model.multiselectselectedoptionids.contains(getJsonField(
                                                                              multiselectItem,
                                                                              r'''$.id''',
                                                                            ))
                                                                                ? FlutterFlowTheme.of(context).alternate
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 10.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (containertopmostAnatomyQuestionDetailsRow
                                              ?.questionType ==
                                          'match_pairs')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: Text(
                                                      'Match the pairs:',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  20.0,
                                                                  10.0,
                                                                  20.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          containertopmostAnatomyQuestionDetailsRow
                                                              ?.questionText,
                                                          'Match the Pair Question is not available',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      2.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Builder(
                                                          builder: (context) {
                                                            final matchLeftOptions =
                                                                getJsonField(
                                                              containertopmostAnatomyQuestionDetailsRow
                                                                  ?.options,
                                                              r'''$.left''',
                                                            ).toList();

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  matchLeftOptions
                                                                      .length,
                                                                  (matchLeftOptionsIndex) {
                                                                final matchLeftOptionsItem =
                                                                    matchLeftOptions[
                                                                        matchLeftOptionsIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                        'QUESTION_CLINICALCASES_Container_hxr2ye5');
                                                                    if (_model
                                                                        .matchlockedleftids
                                                                        .contains(
                                                                            getJsonField(
                                                                      matchLeftOptionsItem,
                                                                      r'''$.id''',
                                                                    ))) {
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.matchselectedleftid =
                                                                          null;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.matchselectedleftid =
                                                                          getJsonField(
                                                                        matchLeftOptionsItem,
                                                                        r'''$.id''',
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      if (_model
                                                                              .matchselectedrightid !=
                                                                          null) {
                                                                        if (_model.matchselectedleftid ==
                                                                            _model.matchselectedrightid) {
                                                                          logFirebaseEvent(
                                                                              'Container_wait__delay');
                                                                          await Future
                                                                              .delayed(
                                                                            Duration(
                                                                              milliseconds: 300,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model
                                                                              .addToMatchlockedleftids(_model.matchselectedleftid!);
                                                                          _model
                                                                              .addToMatchlockedrightids(_model.matchselectedrightid!);
                                                                          safeSetState(
                                                                              () {});
                                                                          if (_model.matchlockedleftids.length ==
                                                                              3) {
                                                                            logFirebaseEvent('Container_update_page_state');
                                                                            _model.ischeckselected =
                                                                                true;
                                                                            _model.iscorrectanswer =
                                                                                true;
                                                                            _model.isanswerselected =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          }
                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model.matchselectedleftid =
                                                                              null;
                                                                          _model.matchselectedrightid =
                                                                              null;
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Container_wait__delay');
                                                                          await Future
                                                                              .delayed(
                                                                            Duration(
                                                                              milliseconds: 300,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Container_update_app_state');
                                                                          FFAppState().noofhearts =
                                                                              FFAppState().noofhearts + -1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model.matchselectedleftid =
                                                                              null;
                                                                          _model.matchselectedrightid =
                                                                              null;
                                                                          _model.wrongansweralreadyselected =
                                                                              true;
                                                                          _model.ischeckselected =
                                                                              true;
                                                                          safeSetState(
                                                                              () {});
                                                                          if (_model.wrongansweralreadyselected ==
                                                                              false) {
                                                                            logFirebaseEvent('Container_backend_call');
                                                                            await UserDetailsTable().update(
                                                                              data: {
                                                                                'total_hearts': FFAppState().noofhearts,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'user_id',
                                                                                currentUserUid,
                                                                              ),
                                                                            );
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color:
                                                                            () {
                                                                          if ((_model.matchselectedleftid ==
                                                                                  getJsonField(
                                                                                    matchLeftOptionsItem,
                                                                                    r'''$.id''',
                                                                                  )) &&
                                                                              (_model.matchselectedrightid == null)) {
                                                                            return FlutterFlowTheme.of(context).alternate;
                                                                          } else if ((_model.matchselectedleftid == _model.matchselectedrightid) &&
                                                                              (_model.matchselectedleftid ==
                                                                                  getJsonField(
                                                                                    matchLeftOptionsItem,
                                                                                    r'''$.id''',
                                                                                  ))) {
                                                                            return FlutterFlowTheme.of(context).primary;
                                                                          } else if ((_model.matchselectedleftid != _model.matchselectedrightid) &&
                                                                              (_model.matchselectedleftid ==
                                                                                  getJsonField(
                                                                                    matchLeftOptionsItem,
                                                                                    r'''$.id''',
                                                                                  ))) {
                                                                            return FlutterFlowTheme.of(context).tertiary;
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).secondaryBackground;
                                                                          }
                                                                        }(),
                                                                        width:
                                                                            3.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            10.0,
                                                                            5.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            matchLeftOptionsItem,
                                                                            r'''$.label''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                                color: valueOrDefault<Color>(
                                                                                  () {
                                                                                    if ((_model.matchselectedleftid ==
                                                                                            getJsonField(
                                                                                              matchLeftOptionsItem,
                                                                                              r'''$.id''',
                                                                                            )) &&
                                                                                        (_model.matchselectedrightid == null)) {
                                                                                      return FlutterFlowTheme.of(context).alternate;
                                                                                    } else if ((_model.matchselectedleftid == _model.matchselectedrightid) &&
                                                                                        (_model.matchselectedleftid ==
                                                                                            getJsonField(
                                                                                              matchLeftOptionsItem,
                                                                                              r'''$.id''',
                                                                                            ))) {
                                                                                      return FlutterFlowTheme.of(context).primary;
                                                                                    } else if (_model.matchlockedleftids.contains(getJsonField(
                                                                                      matchLeftOptionsItem,
                                                                                      r'''$.id''',
                                                                                    ))) {
                                                                                      return FlutterFlowTheme.of(context).secondaryBackground;
                                                                                    } else if ((_model.matchselectedleftid != _model.matchselectedrightid) &&
                                                                                        (_model.matchselectedleftid ==
                                                                                            getJsonField(
                                                                                              matchLeftOptionsItem,
                                                                                              r'''$.id''',
                                                                                            ))) {
                                                                                      return FlutterFlowTheme.of(context).tertiary;
                                                                                    } else {
                                                                                      return FlutterFlowTheme.of(context).primaryText;
                                                                                    }
                                                                                  }(),
                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).divide(SizedBox(
                                                                  height:
                                                                      20.0)),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Builder(
                                                          builder: (context) {
                                                            final matchRightOptions =
                                                                getJsonField(
                                                              containertopmostAnatomyQuestionDetailsRow
                                                                  ?.options,
                                                              r'''$.right''',
                                                            ).toList();

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  matchRightOptions
                                                                      .length,
                                                                  (matchRightOptionsIndex) {
                                                                final matchRightOptionsItem =
                                                                    matchRightOptions[
                                                                        matchRightOptionsIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
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
                                                                        'QUESTION_CLINICALCASES_Container_qe9axfq');
                                                                    if (!_model
                                                                        .matchlockedrightids
                                                                        .contains(
                                                                            getJsonField(
                                                                      matchRightOptionsItem,
                                                                      r'''$.id''',
                                                                    ))) {
                                                                      logFirebaseEvent(
                                                                          'Container_update_page_state');
                                                                      _model.matchselectedrightid =
                                                                          getJsonField(
                                                                        matchRightOptionsItem,
                                                                        r'''$.id''',
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      if (_model
                                                                              .matchselectedleftid !=
                                                                          null) {
                                                                        if (_model.matchselectedleftid ==
                                                                            _model.matchselectedrightid) {
                                                                          logFirebaseEvent(
                                                                              'Container_wait__delay');
                                                                          await Future
                                                                              .delayed(
                                                                            Duration(
                                                                              milliseconds: 1000,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model
                                                                              .addToMatchlockedleftids(_model.matchselectedleftid!);
                                                                          _model
                                                                              .addToMatchlockedrightids(_model.matchselectedrightid!);
                                                                          safeSetState(
                                                                              () {});
                                                                          if (_model.matchlockedrightids.length ==
                                                                              3) {
                                                                            logFirebaseEvent('Container_update_page_state');
                                                                            _model.ischeckselected =
                                                                                true;
                                                                            _model.iscorrectanswer =
                                                                                true;
                                                                            _model.isanswerselected =
                                                                                true;
                                                                            safeSetState(() {});
                                                                          }
                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model.matchselectedleftid =
                                                                              null;
                                                                          _model.matchselectedrightid =
                                                                              null;
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Container_wait__delay');
                                                                          await Future
                                                                              .delayed(
                                                                            Duration(
                                                                              milliseconds: 2000,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Container_update_app_state');
                                                                          FFAppState().noofhearts =
                                                                              FFAppState().noofhearts + -1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Container_update_page_state');
                                                                          _model.matchselectedleftid =
                                                                              null;
                                                                          _model.matchselectedrightid =
                                                                              null;
                                                                          _model.wrongansweralreadyselected =
                                                                              true;
                                                                          safeSetState(
                                                                              () {});
                                                                          if (_model.wrongansweralreadyselected ==
                                                                              false) {
                                                                            logFirebaseEvent('Container_backend_call');
                                                                            await UserDetailsTable().update(
                                                                              data: {
                                                                                'total_hearts': FFAppState().noofhearts,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'user_id',
                                                                                currentUserUid,
                                                                              ),
                                                                            );
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color:
                                                                            () {
                                                                          if ((_model.matchselectedrightid ==
                                                                                  getJsonField(
                                                                                    matchRightOptionsItem,
                                                                                    r'''$.id''',
                                                                                  )) &&
                                                                              (_model.matchselectedleftid == null)) {
                                                                            return FlutterFlowTheme.of(context).alternate;
                                                                          } else if ((_model.matchselectedleftid == _model.matchselectedrightid) &&
                                                                              (_model.matchselectedrightid ==
                                                                                  getJsonField(
                                                                                    matchRightOptionsItem,
                                                                                    r'''$.id''',
                                                                                  ))) {
                                                                            return FlutterFlowTheme.of(context).primary;
                                                                          } else if ((_model.matchselectedleftid != _model.matchselectedrightid) &&
                                                                              (_model.matchselectedrightid ==
                                                                                  getJsonField(
                                                                                    matchRightOptionsItem,
                                                                                    r'''$.id''',
                                                                                  ))) {
                                                                            return FlutterFlowTheme.of(context).tertiary;
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).secondaryBackground;
                                                                          }
                                                                        }(),
                                                                        width:
                                                                            3.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            10.0,
                                                                            5.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            matchRightOptionsItem,
                                                                            r'''$.label''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                                color: valueOrDefault<Color>(
                                                                                  () {
                                                                                    if ((_model.matchselectedrightid ==
                                                                                            getJsonField(
                                                                                              matchRightOptionsItem,
                                                                                              r'''$.id''',
                                                                                            )) &&
                                                                                        (_model.matchselectedleftid == null)) {
                                                                                      return FlutterFlowTheme.of(context).alternate;
                                                                                    } else if ((_model.matchselectedleftid == _model.matchselectedrightid) &&
                                                                                        (_model.matchselectedrightid ==
                                                                                            getJsonField(
                                                                                              matchRightOptionsItem,
                                                                                              r'''$.id''',
                                                                                            ))) {
                                                                                      return FlutterFlowTheme.of(context).primary;
                                                                                    } else if (_model.matchlockedrightids.contains(getJsonField(
                                                                                      matchRightOptionsItem,
                                                                                      r'''$.id''',
                                                                                    ))) {
                                                                                      return FlutterFlowTheme.of(context).secondaryBackground;
                                                                                    } else if ((_model.matchselectedleftid != _model.matchselectedrightid) &&
                                                                                        (_model.matchselectedrightid ==
                                                                                            getJsonField(
                                                                                              matchRightOptionsItem,
                                                                                              r'''$.id''',
                                                                                            ))) {
                                                                                      return FlutterFlowTheme.of(context).tertiary;
                                                                                    } else {
                                                                                      return FlutterFlowTheme.of(context).primaryText;
                                                                                    }
                                                                                  }(),
                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).divide(SizedBox(
                                                                  height:
                                                                      20.0)),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (containertopmostAnatomyQuestionDetailsRow
                                              ?.questionType ==
                                          'true_false')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Text(
                                                    'True or False ?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 20.0,
                                                          10.0, 20.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containertopmostAnatomyQuestionDetailsRow
                                                          ?.questionText,
                                                      'true or false question is not available',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
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
                                                          fontSize: 16.0,
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
                                                          lineHeight: 2.0,
                                                        ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final truefalse =
                                                        containertopmostAnatomyQuestionDetailsRow
                                                                ?.options
                                                                ?.toList() ??
                                                            [];

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          truefalse.length,
                                                          (truefalseIndex) {
                                                        final truefalseItem =
                                                            truefalse[
                                                                truefalseIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
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
                                                                  'QUESTION_CLINICALCASES_Container_vyicoej');
                                                              if (FFAppState()
                                                                      .DifficultyLevel ==
                                                                  1) {
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.mcqtruefalseselectedoptions =
                                                                    getJsonField(
                                                                  truefalseItem,
                                                                  r'''$.id''',
                                                                );
                                                                _model.isanswerselected =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.mcqtruefalseselectedoptions =
                                                                    getJsonField(
                                                                  truefalseItem,
                                                                  r'''$.id''',
                                                                );
                                                                _model.isanswerselected =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: _model
                                                                              .mcqtruefalseselectedoptions ==
                                                                          getJsonField(
                                                                            truefalseItem,
                                                                            r'''$.id''',
                                                                          )
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  width: 3.0,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      truefalseItem,
                                                                      r'''$.label''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color: _model.mcqtruefalseselectedoptions ==
                                                                                  getJsonField(
                                                                                    truefalseItem,
                                                                                    r'''$.id''',
                                                                                  )
                                                                              ? FlutterFlowTheme.of(context).alternate
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 20.0)),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (containertopmostAnatomyQuestionDetailsRow
                                              ?.questionType ==
                                          'mcq')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, -1.0),
                                                  child: Text(
                                                    'Answer the Question',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 20.0,
                                                          10.0, 20.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containertopmostAnatomyQuestionDetailsRow
                                                          ?.questionText,
                                                      'MCQ Question is not available',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
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
                                                          fontSize: 16.0,
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
                                                          lineHeight: 2.0,
                                                        ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final mcqOptions =
                                                        containertopmostAnatomyQuestionDetailsRow
                                                                ?.options
                                                                ?.toList() ??
                                                            [];

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          mcqOptions.length,
                                                          (mcqOptionsIndex) {
                                                        final mcqOptionsItem =
                                                            mcqOptions[
                                                                mcqOptionsIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
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
                                                                  'QUESTION_CLINICALCASES_Container_4mgovau');
                                                              if (FFAppState()
                                                                      .DifficultyLevel ==
                                                                  1) {
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.mcqtruefalseselectedoptions =
                                                                    getJsonField(
                                                                  mcqOptionsItem,
                                                                  r'''$.id''',
                                                                );
                                                                _model.isanswerselected =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.mcqtruefalseselectedoptions =
                                                                    getJsonField(
                                                                  mcqOptionsItem,
                                                                  r'''$.id''',
                                                                );
                                                                _model.isanswerselected =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: _model
                                                                              .mcqtruefalseselectedoptions ==
                                                                          getJsonField(
                                                                            mcqOptionsItem,
                                                                            r'''$.id''',
                                                                          )
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  width: 3.0,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      mcqOptionsItem,
                                                                      r'''$.label''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color: _model.mcqtruefalseselectedoptions ==
                                                                                  getJsonField(
                                                                                    mcqOptionsItem,
                                                                                    r'''$.id''',
                                                                                  )
                                                                              ? FlutterFlowTheme.of(context).alternate
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 20.0)),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (containertopmostAnatomyQuestionDetailsRow
                                              ?.difficultyLevel !=
                                          1)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 30.0, 10.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'QUESTION_CLINICALCASES_Container_8jgzrq3');
                                                logFirebaseEvent(
                                                    'Container_widget_animation');
                                                if (animationsMap[
                                                        'containerOnActionTriggerAnimation'] !=
                                                    null) {
                                                  animationsMap[
                                                          'containerOnActionTriggerAnimation']!
                                                      .controller
                                                      .forward(from: 0.0);
                                                }
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.showhint = true;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 350.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 30.0, 5.0, 30.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (_model.showhint ==
                                                          false)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .lightbulb_outline_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 24.0,
                                                              ),
                                                              Text(
                                                                'Hint',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Visibility(
                                                          visible:
                                                              _model.showhint ==
                                                                  true,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                containertopmostAnatomyQuestionDetailsRow
                                                                    ?.hints
                                                                    ?.toString(),
                                                                'Hint',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation']!,
                                            ),
                                          ),
                                        ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: FutureBuilder<
                                              List<
                                                  LeaderboardCollegeWeeklyRankRow>>(
                                            future:
                                                LeaderboardCollegeWeeklyRankTable()
                                                    .querySingleRow(
                                              queryFn: (q) => q
                                                  .eqOrNull(
                                                    'college_id',
                                                    questionPageClinicalcasesLeaderboardUserRankInTheGroupRow
                                                        ?.collegeId,
                                                  )
                                                  .eqOrNull(
                                                    'state_id',
                                                    questionPageClinicalcasesLeaderboardUserRankInTheGroupRow
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
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                children: [
                                                  if ((_model.iscorrectanswer ==
                                                          false) &&
                                                      (_model.ischeckselected ==
                                                          true))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 600.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            primary: false,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.warning,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                25.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Incorrect',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    fontSize: 25.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('QUESTION_CLINICALCASES_Icon_i6ghr5y7_ON_');
                                                                            logFirebaseEvent('Icon_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                      height: 500.0,
                                                                                      child: QuestionbasedfeedbackWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.flag_circle,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Correct Answer:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                        .courseid ==
                                                                    'neetpg')
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          50.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          columnAnatomyQuestionDetailsRow
                                                                              ?.correctOption,
                                                                          'correct answer',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              fontSize: 15.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
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
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).explanation,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          10.0))
                                                                  .addToEnd(SizedBox(
                                                                      height:
                                                                          40.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if ((_model.ischeckselected ==
                                                          true) &&
                                                      (_model.iscorrectanswer ==
                                                          true))
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
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
                                                                          50.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryButtonColour,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Great Job !',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryButtonColour,
                                                                                fontSize: 25.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'QUESTION_CLINICALCASES_Icon_cwq9636z_ON_');
                                                                        logFirebaseEvent(
                                                                            'Icon_bottom_sheet');
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                  height: 500.0,
                                                                                  child: QuestionbasedfeedbackWidget(),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .flag_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryButtonColour,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ]
                                                              .addToStart(
                                                                  SizedBox(
                                                                      height:
                                                                          10.0))
                                                              .addToEnd(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 380.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          30.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'QUESTION_CLINICALCASES_Container_ms1puql');
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
                                                                              child: TheoryWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .lightbulb_outline_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((containertopmostAnatomyQuestionDetailsRow
                                                                          ?.questionType !=
                                                                      'multi_select') ||
                                                                  (containertopmostAnatomyQuestionDetailsRow
                                                                          ?.questionType !=
                                                                      'match_pairs'))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'QUESTION_CLINICALCASES_CHECK_BTN_ON_TAP');
                                                                        if (containertopmostAnatomyQuestionDetailsRow?.questionType ==
                                                                            'mcq') {
                                                                          if (_model.mcqtruefalseselectedoptions ==
                                                                              containertopmostAnatomyQuestionDetailsRow?.correctAnswer) {
                                                                            logFirebaseEvent('Button_play_sound');
                                                                            _model.soundPlayer3 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer3!.playing) {
                                                                              await _model.soundPlayer3!.stop();
                                                                            }
                                                                            _model.soundPlayer3!.setVolume(1.0);
                                                                            _model.soundPlayer3!.setAsset('assets/audios/mixkit-quick-win-video-game-notification-269.wav').then((_) =>
                                                                                _model.soundPlayer3!.play());

                                                                            logFirebaseEvent('Button_update_page_state');
                                                                            _model.iscorrectanswer =
                                                                                true;
                                                                            _model.ischeckselected =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Button_update_app_state');
                                                                            FFAppState().correctanswersinarow =
                                                                                FFAppState().correctanswersinarow + 1;
                                                                            FFAppState().totalnoofcorrectanswers =
                                                                                FFAppState().totalnoofcorrectanswers + 1;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            logFirebaseEvent('Button_play_sound');
                                                                            _model.soundPlayer4 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer4!.playing) {
                                                                              await _model.soundPlayer4!.stop();
                                                                            }
                                                                            _model.soundPlayer4!.setVolume(1.0);
                                                                            _model.soundPlayer4!.setAsset('assets/audios/mixkit-tech-break-fail-2947.wav').then((_) =>
                                                                                _model.soundPlayer4!.play());

                                                                            logFirebaseEvent('Button_update_page_state');
                                                                            _model.iscorrectanswer =
                                                                                false;
                                                                            _model.ischeckselected =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Button_widget_animation');
                                                                            if (animationsMap['iconOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              await animationsMap['iconOnActionTriggerAnimation']!.controller.forward(from: 0.0).whenComplete(animationsMap['iconOnActionTriggerAnimation']!.controller.reverse);
                                                                            }
                                                                            logFirebaseEvent('Button_update_app_state');
                                                                            FFAppState().correctanswersinarow =
                                                                                0;
                                                                            FFAppState().noofhearts =
                                                                                FFAppState().noofhearts + -1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Button_backend_call');
                                                                            await UserDetailsTable().update(
                                                                              data: {
                                                                                'total_hearts': FFAppState().noofhearts,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'user_id',
                                                                                currentUserUid,
                                                                              ),
                                                                            );
                                                                          }
                                                                        } else if (containertopmostAnatomyQuestionDetailsRow?.questionType ==
                                                                            'true_false') {
                                                                          if (_model.mcqtruefalseselectedoptions ==
                                                                              containertopmostAnatomyQuestionDetailsRow?.correctAnswer) {
                                                                            logFirebaseEvent('Button_play_sound');
                                                                            _model.soundPlayer5 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer5!.playing) {
                                                                              await _model.soundPlayer5!.stop();
                                                                            }
                                                                            _model.soundPlayer5!.setVolume(1.0);
                                                                            _model.soundPlayer5!.setAsset('assets/audios/mixkit-quick-win-video-game-notification-269.wav').then((_) =>
                                                                                _model.soundPlayer5!.play());

                                                                            logFirebaseEvent('Button_update_page_state');
                                                                            _model.iscorrectanswer =
                                                                                true;
                                                                            _model.ischeckselected =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Button_update_app_state');
                                                                            FFAppState().correctanswersinarow =
                                                                                FFAppState().correctanswersinarow + 1;
                                                                            FFAppState().totalnoofcorrectanswers =
                                                                                FFAppState().totalnoofcorrectanswers + 1;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            logFirebaseEvent('Button_play_sound');
                                                                            _model.soundPlayer6 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer6!.playing) {
                                                                              await _model.soundPlayer6!.stop();
                                                                            }
                                                                            _model.soundPlayer6!.setVolume(1.0);
                                                                            _model.soundPlayer6!.setAsset('assets/audios/mixkit-tech-break-fail-2947.wav').then((_) =>
                                                                                _model.soundPlayer6!.play());

                                                                            logFirebaseEvent('Button_update_page_state');
                                                                            _model.iscorrectanswer =
                                                                                false;
                                                                            _model.ischeckselected =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Button_widget_animation');
                                                                            if (animationsMap['iconOnActionTriggerAnimation'] !=
                                                                                null) {
                                                                              await animationsMap['iconOnActionTriggerAnimation']!.controller.forward(from: 0.0).whenComplete(animationsMap['iconOnActionTriggerAnimation']!.controller.reverse);
                                                                            }
                                                                            logFirebaseEvent('Button_update_app_state');
                                                                            FFAppState().correctanswersinarow =
                                                                                0;
                                                                            FFAppState().noofhearts =
                                                                                FFAppState().noofhearts + -1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Button_backend_call');
                                                                            await UserDetailsTable().update(
                                                                              data: {
                                                                                'total_hearts': FFAppState().noofhearts,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'user_id',
                                                                                currentUserUid,
                                                                              ),
                                                                            );
                                                                          }
                                                                        } else if (containertopmostAnatomyQuestionDetailsRow?.questionType ==
                                                                            'match_pairs') {
                                                                          if (_model.matchlockedleftids.length ==
                                                                              3) {
                                                                            if (_model.multiselectcorrectoptionids.length ==
                                                                                1) {
                                                                              if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.firstOrNull)) {
                                                                                logFirebaseEvent('Button_update_page_state');
                                                                                _model.iscorrectanswer = true;
                                                                                _model.ischeckselected = true;
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                logFirebaseEvent('Button_update_page_state');
                                                                                _model.iscorrectanswer = false;
                                                                                safeSetState(() {});
                                                                              }
                                                                            } else if (_model.multiselectcorrectoptionids.length ==
                                                                                2) {
                                                                              if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.firstOrNull)) {
                                                                                if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.elementAtOrNull(1))) {
                                                                                  logFirebaseEvent('Button_update_page_state');
                                                                                  _model.iscorrectanswer = true;
                                                                                  _model.ischeckselected = true;
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  logFirebaseEvent('Button_update_page_state');
                                                                                  _model.iscorrectanswer = false;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              } else {
                                                                                logFirebaseEvent('Button_update_page_state');
                                                                                _model.iscorrectanswer = false;
                                                                                safeSetState(() {});
                                                                              }
                                                                            } else if (_model.multiselectcorrectoptionids.length ==
                                                                                3) {
                                                                              if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.firstOrNull)) {
                                                                                if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.elementAtOrNull(1))) {
                                                                                  if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.elementAtOrNull(2))) {
                                                                                    logFirebaseEvent('Button_update_page_state');
                                                                                    _model.iscorrectanswer = true;
                                                                                    _model.ischeckselected = true;
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    logFirebaseEvent('Button_update_page_state');
                                                                                    _model.iscorrectanswer = false;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                } else {
                                                                                  logFirebaseEvent('Button_update_page_state');
                                                                                  _model.iscorrectanswer = false;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              } else {
                                                                                logFirebaseEvent('Button_update_page_state');
                                                                                _model.iscorrectanswer = false;
                                                                                safeSetState(() {});
                                                                              }
                                                                            } else {
                                                                              if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.firstOrNull)) {
                                                                                if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.elementAtOrNull(1))) {
                                                                                  if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.elementAtOrNull(2))) {
                                                                                    if (_model.multiselectcorrectoptionids.contains(_model.multiselectselectedoptionids.elementAtOrNull(3))) {
                                                                                      logFirebaseEvent('Button_update_page_state');
                                                                                      _model.iscorrectanswer = true;
                                                                                      _model.ischeckselected = true;
                                                                                      safeSetState(() {});
                                                                                    } else {
                                                                                      logFirebaseEvent('Button_update_page_state');
                                                                                      _model.iscorrectanswer = false;
                                                                                      safeSetState(() {});
                                                                                    }
                                                                                  } else {
                                                                                    logFirebaseEvent('Button_update_page_state');
                                                                                    _model.iscorrectanswer = false;
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                } else {
                                                                                  logFirebaseEvent('Button_update_page_state');
                                                                                  _model.iscorrectanswer = false;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      },
                                                                      text:
                                                                          'CHECK',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            270.0,
                                                                        height:
                                                                            46.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            10.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: _model.isanswerselected
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
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
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: FutureBuilder<
                                                        List<UserProgressRow>>(
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
                                                              FFAppState()
                                                                  .currentunitno,
                                                            )
                                                            .eqOrNull(
                                                              'level_no',
                                                              FFAppState()
                                                                  .currentlevelno,
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
                                                              FFAppState()
                                                                  .courseid,
                                                            )
                                                            .eqOrNull(
                                                              'subcourse_id',
                                                              FFAppState()
                                                                  .subcourseid,
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
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: (_model
                                                                        .ischeckselected ==
                                                                    true) ||
                                                                (containertopmostAnatomyQuestionDetailsRow
                                                                        ?.questionNumber ==
                                                                    10),
                                                            child: FutureBuilder<
                                                                List<
                                                                    UserDetailsRow>>(
                                                              future: UserDetailsTable()
                                                                  .querySingleRow(
                                                                queryFn: (q) =>
                                                                    q.eqOrNull(
                                                                  'user_id',
                                                                  currentUserUid,
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
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
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
                                                                    buttondialogueUserDetailsRowList =
                                                                    snapshot
                                                                        .data!;

                                                                final buttondialogueUserDetailsRow =
                                                                    buttondialogueUserDetailsRowList
                                                                            .isNotEmpty
                                                                        ? buttondialogueUserDetailsRowList
                                                                            .first
                                                                        : null;

                                                                return FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'QUESTION_CLINICALCASES_Buttondialogue_ON');
                                                                    if (FFAppState()
                                                                            .currentquestionno ==
                                                                        10) {
                                                                      if (FFAppState()
                                                                              .currentlessonno ==
                                                                          5) {
                                                                        logFirebaseEvent(
                                                                            'Buttondialogue_backend_call');
                                                                        _model.checkcurrentlevelnoistotalnooflevelsdialogue =
                                                                            await AnatomyUnitDetailTable().queryRows(
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
                                                                        if (_model.checkcurrentlevelnoistotalnooflevelsdialogue !=
                                                                                null &&
                                                                            (_model.checkcurrentlevelnoistotalnooflevelsdialogue)!.isNotEmpty) {
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
                                                                          _model.checknoofunitsanatomyDialogueCopy =
                                                                              await SectionDetailTable().queryRows(
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
                                                                          if (_model.checknoofunitsanatomyDialogueCopy != null &&
                                                                              (_model.checknoofunitsanatomyDialogueCopy)!.isNotEmpty) {
                                                                            if (FFAppState().isreview ==
                                                                                true) {
                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().reviewnumber = containerUserProgressRow!.reviewNumber!;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().lessonendtime = getCurrentTimestamp.secondsSinceEpoch;
                                                                              FFAppState().xpearned = 15;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().reviewnumber = FFAppState().reviewnumber + 1;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_update_page_state');
                                                                              _model.isanswerselected = false;
                                                                              _model.ischeckselected = false;
                                                                              _model.iscorrectanswer = false;
                                                                              _model.selectedoption = 'option selected';
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
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
                                                                                          'difficulty_level',
                                                                                          FFAppState().DifficultyLevel,
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
                                                                              logFirebaseEvent('Buttondialogue_navigate_to');

                                                                              context.goNamed(
                                                                                LessonCompletedPageWidget.routeName,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.rightToLeft,
                                                                                  ),
                                                                                },
                                                                              );

                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().currentquestionno = 1;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              await LeaderboardUserRankInTheGroupTable().update(
                                                                                data: {
                                                                                  'weekly_xp': (questionPageClinicalcasesLeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                ),
                                                                              );
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              await LeaderboardCollegeWeeklyRankTable().update(
                                                                                data: {
                                                                                  'weekly_xp': (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'college_id',
                                                                                      questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'state_id',
                                                                                      questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.stateId,
                                                                                    ),
                                                                              );
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              await UserDetailsTable().update(
                                                                                data: {
                                                                                  'total_xp': (buttondialogueUserDetailsRow!.totalXp!) + 15,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().lessonendtime = getCurrentTimestamp.secondsSinceEpoch;
                                                                              FFAppState().xpearned = 60;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_update_page_state');
                                                                              _model.isanswerselected = false;
                                                                              _model.ischeckselected = false;
                                                                              _model.iscorrectanswer = false;
                                                                              _model.selectedoption = 'option selected';
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              _model.activeandcompletesectionCopy1 = await UserProgressTable().update(
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
                                                                                      'difficulty_level',
                                                                                      FFAppState().DifficultyLevel,
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
                                                                              logFirebaseEvent('Buttondialogue_navigate_to');

                                                                              context.goNamed(LessonCompletedPageWidget.routeName);

                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().currentsectionno = FFAppState().currentsectionno + 1;
                                                                              FFAppState().currentunitno = 1;
                                                                              FFAppState().currentlevelno = 1;
                                                                              FFAppState().currentlessonno = 1;
                                                                              FFAppState().currentquestionno = 1;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              _model.querytoupdatesectionxpCopy1 = await UserDetailsTable().update(
                                                                                data: {
                                                                                  'weekly_xp': (buttondialogueUserDetailsRow!.weeklyXp!) + 15,
                                                                                  'total_xp': (buttondialogueUserDetailsRow!.totalXp!) + 15,
                                                                                  'current_section_no': FFAppState().currentsectionno,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                ),
                                                                                returnRows: true,
                                                                              );
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              await UserProgressTable().insert({
                                                                                'user_id': currentUserUid,
                                                                                'section_no': FFAppState().currentsectionno,
                                                                                'unit_no': FFAppState().currentunitno,
                                                                                'level_no': FFAppState().currentlevelno,
                                                                                'lesson_no': FFAppState().currentlessonno,
                                                                                'is_active': true,
                                                                                'activated_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                'is_completed': false,
                                                                                'course_id': FFAppState().courseid,
                                                                                'subcourse_id': FFAppState().subcourseid,
                                                                                'difficulty_level': FFAppState().DifficultyLevel,
                                                                              });
                                                                            }
                                                                          } else {
                                                                            if (FFAppState().isreview ==
                                                                                true) {
                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().reviewnumber = containerUserProgressRow!.reviewNumber!;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().lessonendtime = getCurrentTimestamp.secondsSinceEpoch;
                                                                              FFAppState().xpearned = 15;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().reviewnumber = FFAppState().reviewnumber + 1;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_update_page_state');
                                                                              _model.isanswerselected = false;
                                                                              _model.ischeckselected = false;
                                                                              _model.iscorrectanswer = false;
                                                                              _model.selectedoption = 'option selected';
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
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
                                                                                        )
                                                                                        .eqOrNull(
                                                                                          'difficulty_level',
                                                                                          FFAppState().DifficultyLevel,
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
                                                                              logFirebaseEvent('Buttondialogue_navigate_to');

                                                                              context.goNamed(
                                                                                LessonCompletedPageWidget.routeName,
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.rightToLeft,
                                                                                  ),
                                                                                },
                                                                              );

                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().currentquestionno = 1;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              await LeaderboardUserRankInTheGroupTable().update(
                                                                                data: {
                                                                                  'weekly_xp': (questionPageClinicalcasesLeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                ),
                                                                              );
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              await LeaderboardCollegeWeeklyRankTable().update(
                                                                                data: {
                                                                                  'weekly_xp': (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                                },
                                                                                matchingRows: (rows) => rows
                                                                                    .eqOrNull(
                                                                                      'college_id',
                                                                                      questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'state_id',
                                                                                      questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.stateId,
                                                                                    ),
                                                                              );
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              await UserDetailsTable().update(
                                                                                data: {
                                                                                  'total_xp': (buttondialogueUserDetailsRow!.totalXp!) + 15,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().lessonendtime = getCurrentTimestamp.secondsSinceEpoch;
                                                                              FFAppState().xpearned = 45;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_update_page_state');
                                                                              _model.isanswerselected = false;
                                                                              _model.ischeckselected = false;
                                                                              _model.iscorrectanswer = false;
                                                                              _model.selectedoption = 'option selected';
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              unawaited(
                                                                                () async {
                                                                                  _model.activebutnotcompletesectionCopy1 = await UserProgressTable().update(
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
                                                                                        )
                                                                                        .eqOrNull(
                                                                                          'difficulty_level',
                                                                                          FFAppState().DifficultyLevel,
                                                                                        ),
                                                                                    returnRows: true,
                                                                                  );
                                                                                }(),
                                                                              );
                                                                              logFirebaseEvent('Buttondialogue_navigate_to');

                                                                              context.goNamed(LessonCompletedPageWidget.routeName);

                                                                              logFirebaseEvent('Buttondialogue_update_app_state');
                                                                              FFAppState().currentunitno = FFAppState().currentunitno + 1;
                                                                              FFAppState().currentlevelno = 1;
                                                                              FFAppState().currentlessonno = 1;
                                                                              FFAppState().currentquestionno = 1;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              await UserProgressTable().insert({
                                                                                'user_id': currentUserUid,
                                                                                'section_no': FFAppState().currentsectionno,
                                                                                'unit_no': FFAppState().currentunitno,
                                                                                'level_no': FFAppState().currentlevelno,
                                                                                'lesson_no': FFAppState().currentlessonno,
                                                                                'is_active': true,
                                                                                'activated_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                'is_completed': false,
                                                                                'course_id': FFAppState().courseid,
                                                                                'subcourse_id': FFAppState().subcourseid,
                                                                                'difficulty_level': FFAppState().DifficultyLevel,
                                                                              });
                                                                              logFirebaseEvent('Buttondialogue_backend_call');
                                                                              _model.querytoupdateunitxpCopy1 = await UserDetailsTable().update(
                                                                                data: {
                                                                                  'weekly_xp': (buttondialogueUserDetailsRow!.weeklyXp!) + 15,
                                                                                  'total_xp': (buttondialogueUserDetailsRow!.totalXp!) + 15,
                                                                                  'current_unit_no': FFAppState().currentunitno,
                                                                                  'current_level_no': FFAppState().currentlevelno,
                                                                                  'current_lesson_no': FFAppState().currentlessonno,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'user_id',
                                                                                  currentUserUid,
                                                                                ),
                                                                                returnRows: true,
                                                                              );
                                                                            }
                                                                          }
                                                                        } else {
                                                                          if (FFAppState().isreview ==
                                                                              true) {
                                                                            logFirebaseEvent('Buttondialogue_update_app_state');
                                                                            FFAppState().reviewnumber =
                                                                                containerUserProgressRow!.reviewNumber!;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Buttondialogue_update_app_state');
                                                                            FFAppState().lessonendtime =
                                                                                getCurrentTimestamp.secondsSinceEpoch;
                                                                            FFAppState().xpearned =
                                                                                15;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Buttondialogue_update_app_state');
                                                                            FFAppState().reviewnumber =
                                                                                FFAppState().reviewnumber + 1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Buttondialogue_update_page_state');
                                                                            _model.isanswerselected =
                                                                                false;
                                                                            _model.ischeckselected =
                                                                                false;
                                                                            _model.iscorrectanswer =
                                                                                false;
                                                                            _model.selectedoption =
                                                                                'option selected';
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Buttondialogue_backend_call');
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
                                                                                      )
                                                                                      .eqOrNull(
                                                                                        'difficulty_level',
                                                                                        FFAppState().DifficultyLevel,
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
                                                                            logFirebaseEvent('Buttondialogue_navigate_to');

                                                                            context.goNamed(
                                                                              LessonCompletedPageWidget.routeName,
                                                                              extra: <String, dynamic>{
                                                                                kTransitionInfoKey: TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.rightToLeft,
                                                                                ),
                                                                              },
                                                                            );

                                                                            logFirebaseEvent('Buttondialogue_update_app_state');
                                                                            FFAppState().currentquestionno =
                                                                                1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Buttondialogue_backend_call');
                                                                            await LeaderboardUserRankInTheGroupTable().update(
                                                                              data: {
                                                                                'weekly_xp': (questionPageClinicalcasesLeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'user_id',
                                                                                currentUserUid,
                                                                              ),
                                                                            );
                                                                            logFirebaseEvent('Buttondialogue_backend_call');
                                                                            await LeaderboardCollegeWeeklyRankTable().update(
                                                                              data: {
                                                                                'weekly_xp': (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                              },
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'college_id',
                                                                                    questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'state_id',
                                                                                    questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.stateId,
                                                                                  ),
                                                                            );
                                                                            logFirebaseEvent('Buttondialogue_backend_call');
                                                                            await UserDetailsTable().update(
                                                                              data: {
                                                                                'total_xp': (buttondialogueUserDetailsRow!.totalXp!) + 15,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'user_id',
                                                                                currentUserUid,
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            logFirebaseEvent('Buttondialogue_update_app_state');
                                                                            FFAppState().lessonendtime =
                                                                                getCurrentTimestamp.secondsSinceEpoch;
                                                                            FFAppState().xpearned =
                                                                                30;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Buttondialogue_update_page_state');
                                                                            _model.isanswerselected =
                                                                                false;
                                                                            _model.ischeckselected =
                                                                                false;
                                                                            _model.iscorrectanswer =
                                                                                false;
                                                                            _model.selectedoption =
                                                                                'option selected';
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Buttondialogue_backend_call');
                                                                            unawaited(
                                                                              () async {
                                                                                _model.activebutnotcompleteunitCopy1 = await UserProgressTable().update(
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
                                                                                      )
                                                                                      .eqOrNull(
                                                                                        'difficulty_level',
                                                                                        FFAppState().DifficultyLevel,
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
                                                                                  returnRows: true,
                                                                                );
                                                                              }(),
                                                                            );
                                                                            logFirebaseEvent('Buttondialogue_navigate_to');

                                                                            context.goNamed(LessonCompletedPageWidget.routeName);

                                                                            logFirebaseEvent('Buttondialogue_update_app_state');
                                                                            FFAppState().currentlevelno =
                                                                                FFAppState().currentlevelno + 1;
                                                                            FFAppState().currentlessonno =
                                                                                1;
                                                                            FFAppState().currentquestionno =
                                                                                1;
                                                                            safeSetState(() {});
                                                                            logFirebaseEvent('Buttondialogue_backend_call');
                                                                            _model.querytoupdatlevelexpCopy1 =
                                                                                await UserDetailsTable().update(
                                                                              data: {
                                                                                'weekly_xp': (buttondialogueUserDetailsRow!.weeklyXp!) + 15,
                                                                                'total_xp': (buttondialogueUserDetailsRow!.totalXp!) + 15,
                                                                                'current_level_no': FFAppState().currentlevelno,
                                                                                'current_lesson_no': FFAppState().currentlessonno,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'user_id',
                                                                                currentUserUid,
                                                                              ),
                                                                              returnRows: true,
                                                                            );
                                                                            logFirebaseEvent('Buttondialogue_backend_call');
                                                                            await UserProgressTable().insert({
                                                                              'user_id': currentUserUid,
                                                                              'section_no': FFAppState().currentsectionno,
                                                                              'unit_no': FFAppState().currentunitno,
                                                                              'level_no': FFAppState().currentlevelno,
                                                                              'lesson_no': FFAppState().currentlessonno,
                                                                              'is_active': true,
                                                                              'activated_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                              'is_completed': false,
                                                                              'course_id': FFAppState().courseid,
                                                                              'subcourse_id': FFAppState().subcourseid,
                                                                              'difficulty_level': FFAppState().DifficultyLevel,
                                                                            });
                                                                          }
                                                                        }
                                                                      } else {
                                                                        if (FFAppState().isreview ==
                                                                            true) {
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              15;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              containerUserProgressRow!.reviewNumber!;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_navigate_to');

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
                                                                              'Buttondialogue_update_app_state');
                                                                          FFAppState().reviewnumber =
                                                                              FFAppState().reviewnumber + 1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_update_page_state');
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
                                                                              'Buttondialogue_backend_call');
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
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'course_id',
                                                                                      FFAppState().courseid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'subcourse_id',
                                                                                      FFAppState().subcourseid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'difficulty_level',
                                                                                      FFAppState().DifficultyLevel,
                                                                                    ),
                                                                              );
                                                                            }(),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_update_app_state');
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
                                                                          await LeaderboardUserRankInTheGroupTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (questionPageClinicalcasesLeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
                                                                          await LeaderboardCollegeWeeklyRankTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'college_id',
                                                                                  questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'state_id',
                                                                                  questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.stateId,
                                                                                ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
                                                                          await UserDetailsTable()
                                                                              .update(
                                                                            data: {
                                                                              'total_xp': (buttondialogueUserDetailsRow!.totalXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_update_app_state');
                                                                          FFAppState().lessonendtime =
                                                                              getCurrentTimestamp.secondsSinceEpoch;
                                                                          FFAppState().xpearned =
                                                                              15;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_update_page_state');
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
                                                                          if (containertopmostAnatomyQuestionDetailsRow?.questionType ==
                                                                              'conversation') {
                                                                            logFirebaseEvent('Buttondialogue_update_app_state');
                                                                            FFAppState().totalnoofcorrectanswers =
                                                                                FFAppState().totalnoofcorrectanswers + 1;
                                                                            safeSetState(() {});
                                                                          }
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
                                                                          unawaited(
                                                                            () async {
                                                                              _model.updateuserprogressCopy2 = await UserProgressTable().update(
                                                                                data: {
                                                                                  'is_completed': true,
                                                                                  'completed_at': supaSerialize<DateTime>(getCurrentTimestamp),
                                                                                  'accuracy': functions.calculateaccuracy(FFAppState().totalnoofcorrectanswers),
                                                                                  'time_taken': functions.timetakenforlessoncompletion(FFAppState().lessonstarttime, FFAppState().lessonendtime),
                                                                                  'xp_earned': 15,
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
                                                                                      FFAppState().courseid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'subcourse_id',
                                                                                      FFAppState().subcourseid,
                                                                                    )
                                                                                    .eqOrNull(
                                                                                      'difficulty_level',
                                                                                      FFAppState().DifficultyLevel,
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
                                                                                returnRows: true,
                                                                              );
                                                                            }(),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_navigate_to');

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
                                                                              'Buttondialogue_update_app_state');
                                                                          FFAppState().currentlessonno =
                                                                              FFAppState().currentlessonno + 1;
                                                                          FFAppState().currentquestionno =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
                                                                          await LeaderboardUserRankInTheGroupTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (questionPageClinicalcasesLeaderboardUserRankInTheGroupRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
                                                                          await LeaderboardCollegeWeeklyRankTable()
                                                                              .update(
                                                                            data: {
                                                                              'weekly_xp': (stackLeaderboardCollegeWeeklyRankRow!.weeklyXp!) + 15,
                                                                            },
                                                                            matchingRows: (rows) => rows
                                                                                .eqOrNull(
                                                                                  'college_id',
                                                                                  questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.collegeId,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'state_id',
                                                                                  questionPageClinicalcasesLeaderboardUserRankInTheGroupRow?.stateId,
                                                                                ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
                                                                          await UserDetailsTable()
                                                                              .update(
                                                                            data: {
                                                                              'total_xp': (buttondialogueUserDetailsRow!.totalXp!) + 15,
                                                                              'current_lesson_no': FFAppState().currentlessonno,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'user_id',
                                                                              currentUserUid,
                                                                            ),
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'Buttondialogue_backend_call');
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
                                                                            'difficulty_level':
                                                                                FFAppState().DifficultyLevel,
                                                                          });
                                                                        }
                                                                      }
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Buttondialogue_update_app_state');
                                                                      FFAppState()
                                                                              .currentquestionno =
                                                                          FFAppState().currentquestionno +
                                                                              1;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Buttondialogue_update_page_state');
                                                                      _model.questiontype =
                                                                          containertopmostAnatomyQuestionDetailsRow
                                                                              ?.questionType;
                                                                      _model.mcqtruefalseselectedoptions =
                                                                          null;
                                                                      _model.iscorrectanswer =
                                                                          false;
                                                                      _model.ischeckselected =
                                                                          false;
                                                                      _model.isanswerselected =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Buttondialogue_update_page_state');
                                                                      _model.refreshpage =
                                                                          'page updated';
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text:
                                                                      'CONTINUE',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        350.0,
                                                                    height:
                                                                        50.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Visibility(
                                                        visible: (FFAppState()
                                                                    .DifficultyLevel ==
                                                                1) &&
                                                            (containertopmostAnatomyQuestionDetailsRow
                                                                    ?.questionNumber !=
                                                                10) &&
                                                            (containertopmostAnatomyQuestionDetailsRow
                                                                    ?.questionType ==
                                                                'conversation'),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'QUESTION_CLINICALCASES_ButtondialogueDL1');
                                                            if ((_model.isanswerselected ==
                                                                    true) ||
                                                                (containertopmostAnatomyQuestionDetailsRow
                                                                        ?.questionType ==
                                                                    'conversation')) {
                                                              if (FFAppState()
                                                                      .currentquestionno !=
                                                                  10) {
                                                                logFirebaseEvent(
                                                                    'ButtondialogueDL1_update_app_state');
                                                                FFAppState()
                                                                        .currentquestionno =
                                                                    FFAppState()
                                                                            .currentquestionno +
                                                                        1;
                                                                FFAppState()
                                                                        .totalnoofcorrectanswers =
                                                                    FFAppState()
                                                                            .totalnoofcorrectanswers +
                                                                        1;
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'ButtondialogueDL1_update_page_state');
                                                                _model.questiontype =
                                                                    containertopmostAnatomyQuestionDetailsRow
                                                                        ?.questionType;
                                                                _model.mcqtruefalseselectedoptions =
                                                                    null;
                                                                _model.iscorrectanswer =
                                                                    false;
                                                                _model.ischeckselected =
                                                                    false;
                                                                _model.isanswerselected =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                logFirebaseEvent(
                                                                    'ButtondialogueDL1_update_page_state');
                                                                _model.refreshpage =
                                                                    'page updated';
                                                                safeSetState(
                                                                    () {});
                                                                if (containertopmostAnatomyQuestionDetailsRow
                                                                        ?.questionType ==
                                                                    'multi_select') {
                                                                } else if (containertopmostAnatomyQuestionDetailsRow
                                                                        ?.questionType ==
                                                                    'true_false') {
                                                                  if (_model
                                                                          .mcqtruefalseselectedoptions ==
                                                                      containertopmostAnatomyQuestionDetailsRow
                                                                          ?.correctAnswer) {
                                                                    logFirebaseEvent(
                                                                        'ButtondialogueDL1_update_page_state');
                                                                    _model.iscorrectanswer =
                                                                        true;
                                                                    _model.ischeckselected =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'ButtondialogueDL1_update_page_state');
                                                                    _model.iscorrectanswer =
                                                                        false;
                                                                    _model.ischeckselected =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                } else if (containertopmostAnatomyQuestionDetailsRow
                                                                        ?.questionType ==
                                                                    'mcq') {
                                                                  if (_model
                                                                          .mcqtruefalseselectedoptions ==
                                                                      containertopmostAnatomyQuestionDetailsRow
                                                                          ?.correctAnswer) {
                                                                    logFirebaseEvent(
                                                                        'ButtondialogueDL1_update_page_state');
                                                                    _model.iscorrectanswer =
                                                                        true;
                                                                    _model.ischeckselected =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'ButtondialogueDL1_update_page_state');
                                                                    _model.iscorrectanswer =
                                                                        false;
                                                                    _model.ischeckselected =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          },
                                                          text: 'CONTINUE1',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 350.0,
                                                            height: 50.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: (_model.isanswerselected ==
                                                                        true) ||
                                                                    (containertopmostAnatomyQuestionDetailsRow
                                                                            ?.questionType ==
                                                                        'conversation')
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
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
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
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
