import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'question_page_review_model.dart';
export 'question_page_review_model.dart';

class QuestionPageReviewWidget extends StatefulWidget {
  const QuestionPageReviewWidget({super.key});

  static String routeName = 'QuestionPageReview';
  static String routePath = '/questionPageReview';

  @override
  State<QuestionPageReviewWidget> createState() =>
      _QuestionPageReviewWidgetState();
}

class _QuestionPageReviewWidgetState extends State<QuestionPageReviewWidget> {
  late QuestionPageReviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionPageReviewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QuestionPageReview'});
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
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
                      children: [
                        if (_model.correctanswer == true)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                '${FFAppState().correctanswersinarow.toString()} IN A ROW',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'QUESTION_REVIEW_Icon_9myq4125_ON_TAP');
                                    logFirebaseEvent('Icon_update_page_state');
                                    _model.isanswerselected = false;
                                    _model.ischeckselected = false;
                                    _model.correctanswer = false;
                                    _model.selectedoption = 'selcted_option';
                                    _model.questionnunmber = 1;
                                    safeSetState(() {});
                                    logFirebaseEvent('Icon_navigate_to');

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
                                  },
                                  child: Icon(
                                    Icons.close_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 35.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: LinearPercentIndicator(
                                    percent: 0.5,
                                    width: 260.0,
                                    lineHeight: 16.0,
                                    animation: true,
                                    animateFromLastPercent: true,
                                    progressColor:
                                        FlutterFlowTheme.of(context).primary,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    barRadius: Radius.circular(25.0),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.favorite_sharp,
                                    color: Color(0xFFFF4B4B),
                                    size: 35.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
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
                                        textUserDetailsRowList = snapshot.data!;

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
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFF4B4B),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
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
                                      fontStyle: FlutterFlowTheme.of(context)
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 15.0, 0.0),
                          child: Text(
                            'Which structure is present in the anatomical snuff box?\n',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
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
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'QUESTION_REVIEW_ULNAR_ARTERY_BTN_ON_TAP');
                              logFirebaseEvent('Button_update_page_state');
                              _model.isanswerselected = true;
                              _model.selectedoption = _model.selectedoption;
                              safeSetState(() {});
                            },
                            text: 'Ulnar artery\n',
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsets.all(0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 1.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'QUESTION_REVIEW_RADIAL_ARTERY_BTN_ON_TAP');
                              logFirebaseEvent('Button_update_page_state');
                              _model.isanswerselected = true;
                              _model.selectedoption = _model.selectedoption;
                              safeSetState(() {});
                            },
                            text: 'Radial artery',
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 1.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'QUESTION_REVIEW_MEDIAN_NERVE_BTN_ON_TAP');
                              logFirebaseEvent('Button_update_page_state');
                              _model.isanswerselected = true;
                              _model.selectedoption = _model.selectedoption;
                              safeSetState(() {});
                            },
                            text: 'Median nerve',
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 1.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'QUESTION_REVIEW_RADIAL_NERVE_BTN_ON_TAP');
                              logFirebaseEvent('Button_update_page_state');
                              _model.isanswerselected = true;
                              _model.selectedoption = _model.selectedoption;
                              safeSetState(() {});
                            },
                            text: 'Radial nerve',
                            options: FFButtonOptions(
                              width: 350.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 1.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 90.0, 0.0, 0.0),
                            child: Container(
                              height: 100.0,
                              child: Stack(
                                children: [
                                  if (_model.ischeckselected == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.02, 0.38),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'QUESTION_REVIEW_CONTINUE_BTN_ON_TAP');
                                          if (FFAppState().currentquestionno ==
                                              15) {
                                            if (FFAppState().reviewlessonno ==
                                                5) {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.isanswerselected = false;
                                              _model.ischeckselected = false;
                                              _model.selectedoption =
                                                  'selcted_option';
                                              _model.refreshpage =
                                                  'Page Updated';
                                              _model.correctanswer = false;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState().reviewlessonno = 1;
                                              FFAppState().currentquestionno =
                                                  1;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed(
                                                  LessonCompletedPageWidget
                                                      .routeName);
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.isanswerselected = false;
                                              _model.ischeckselected = false;
                                              _model.selectedoption =
                                                  'selcted_option';
                                              _model.refreshpage =
                                                  'Page Updated';
                                              _model.correctanswer = false;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState().reviewlessonno =
                                                  FFAppState().reviewlessonno +
                                                      1;
                                              FFAppState().currentquestionno =
                                                  1;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed(
                                                  LessonCompletedPageWidget
                                                      .routeName);
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.isanswerselected = false;
                                            _model.ischeckselected = false;
                                            _model.selectedoption =
                                                'selcted_option';
                                            _model.refreshpage = 'Page Updated';
                                            _model.correctanswer = false;
                                            safeSetState(() {});
                                          }
                                        },
                                        text: 'CONTINUE',
                                        options: FFButtonOptions(
                                          width: 350.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
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
                                                fontSize: 18.0,
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
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                  if (_model.ischeckselected == false)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.16, 0.41),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'QUESTION_REVIEW_CHECK_BTN_ON_TAP');
                                          if (_model.isanswerselected == true) {
                                            logFirebaseEvent(
                                                'Button_update_page_state');
                                            _model.ischeckselected = true;
                                            safeSetState(() {});
                                            if (_model.selectedoption ==
                                                columnAnatomyQuestionDetailsRow
                                                    ?.correctOption) {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.correctanswer = true;
                                              safeSetState(() {});
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
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Correct',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'Button_update_page_state');
                                              _model.correctanswer = false;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              FFAppState()
                                                  .correctanswersinarow = 0;
                                              FFAppState()
                                                      .totalnoofcorrectanswers =
                                                  FFAppState()
                                                          .totalnoofcorrectanswers +
                                                      1;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Wrong',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        text: 'CHECK',
                                        options: FFButtonOptions(
                                          width: 350.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: _model.isanswerselected
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
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
                                                fontSize: 18.0,
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
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
