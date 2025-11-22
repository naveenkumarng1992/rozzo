import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_lesson_model.dart';
export 'review_lesson_model.dart';

class ReviewLessonWidget extends StatefulWidget {
  const ReviewLessonWidget({super.key});

  @override
  State<ReviewLessonWidget> createState() => _ReviewLessonWidgetState();
}

class _ReviewLessonWidgetState extends State<ReviewLessonWidget> {
  late ReviewLessonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewLessonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 0.0, 0.0),
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
                  'course_id',
                  FFAppState().courseid,
                )
                .eqOrNull(
                  'subcourse_id',
                  FFAppState().subcourseid,
                )
                .eqOrNull(
                  'question_number',
                  1,
                )
                .eqOrNull(
                  'difficulty_level',
                  1,
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

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Container(
                          width: 280.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                columnAnatomyQuestionDetailsRow?.levelName,
                                'Level Name',
                              ),
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Lesson Number',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    FutureBuilder<List<AnatomyQuestionDetailsRow>>(
                      future: AnatomyQuestionDetailsTable().queryRows(
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
                              'course_id',
                              FFAppState().courseid,
                            )
                            .eqOrNull(
                              'subcourse_id',
                              FFAppState().subcourseid,
                            )
                            .eqOrNull(
                              'question_number',
                              1,
                            )
                            .eqOrNull(
                              'difficulty_level',
                              1,
                            )
                            .order('lesson_number', ascending: true),
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
                            rowAnatomyQuestionDetailsRowList = snapshot.data!;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              rowAnatomyQuestionDetailsRowList.length,
                              (rowIndex) {
                            final rowAnatomyQuestionDetailsRow =
                                rowAnatomyQuestionDetailsRowList[rowIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'REVIEW_LESSON_Container_cuwo78qt_ON_TAP');
                                logFirebaseEvent(
                                    'Container_update_component_state');
                                _model.reviewlessonnumber =
                                    rowAnatomyQuestionDetailsRow.lessonNumber;
                                safeSetState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: rowAnatomyQuestionDetailsRow
                                              .lessonNumber ==
                                          _model.reviewlessonnumber
                                      ? FlutterFlowTheme.of(context).greenShade
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        rowAnatomyQuestionDetailsRow
                                            .lessonNumber
                                            ?.toString(),
                                        '1',
                                      ),
                                      textAlign: TextAlign.center,
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
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).divide(SizedBox(width: 10.0)),
                        );
                      },
                    ),
                  ].divide(SizedBox(width: 30.0)),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'REVIEW_LESSON_NEXT_LESSON_BTN_ON_TAP');
                        if (FFAppState().courseid == 'mbbs') {
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().currentlessonno =
                              _model.reviewlessonnumber!;
                          safeSetState(() {});
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().lessonstarttime =
                              getCurrentTimestamp.secondsSinceEpoch;
                          safeSetState(() {});
                          logFirebaseEvent('Button_navigate_to');

                          context.goNamed(
                            QuestionPageClinicalcasesWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 100),
                              ),
                            },
                          );
                        } else {
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().lessonstarttime =
                              getCurrentTimestamp.secondsSinceEpoch;
                          safeSetState(() {});
                          logFirebaseEvent('Button_navigate_to');

                          context.goNamed(
                            QuestionPage1Widget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 100),
                              ),
                            },
                          );
                        }
                      },
                      text: 'Next Lesson',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            );
          },
        ),
      ),
    );
  }
}
