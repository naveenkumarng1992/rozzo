import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choosecourse_model.dart';
export 'choosecourse_model.dart';

class ChoosecourseWidget extends StatefulWidget {
  const ChoosecourseWidget({super.key});

  @override
  State<ChoosecourseWidget> createState() => _ChoosecourseWidgetState();
}

class _ChoosecourseWidgetState extends State<ChoosecourseWidget> {
  late ChoosecourseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoosecourseModel());
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
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/802776b71db4507f26c221496299fb2c-removebg-preview.png',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, -1.0),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      width: 280.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Choose your course',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 21.0,
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
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: FutureBuilder<List<ChooseCourseRow>>(
                  future: ChooseCourseTable().queryRows(
                    queryFn: (q) => q,
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
                    List<ChooseCourseRow> columnChooseCourseRowList =
                        snapshot.data!;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(columnChooseCourseRowList.length,
                          (columnIndex) {
                        final columnChooseCourseRow =
                            columnChooseCourseRowList[columnIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 10.0, 15.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CHOOSECOURSE_COMP_NOT_NOW_BTN_ON_TAP');
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().courseid =
                                    columnChooseCourseRow.courseId;
                                FFAppState().subcourseid =
                                    columnChooseCourseRow.subcourseId!;
                                safeSetState(() {});
                                logFirebaseEvent('Button_backend_call');
                                await UserDetailsTable().update(
                                  data: {
                                    'course_id': columnChooseCourseRow.courseId,
                                    'subcourse_id': FFAppState().subcourseid,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'user_id',
                                    currentUserUid,
                                  ),
                                );
                                if (FFAppState().courseid == 'neetpg') {
                                  logFirebaseEvent('Button_backend_call');
                                  _model.checkifneetpgpyquserprogressexists =
                                      await UserProgressTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'user_id',
                                          currentUserUid,
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
                                  if ((_model.checkifneetpgpyquserprogressexists !=
                                              null &&
                                          (_model.checkifneetpgpyquserprogressexists)!
                                              .isNotEmpty) !=
                                      true) {
                                    logFirebaseEvent('Button_backend_call');
                                    await UserProgressTable().insert({
                                      'user_id': currentUserUid,
                                      'section_no':
                                          FFAppState().currentsectionno,
                                      'unit_no': FFAppState().currentunitno,
                                      'level_no': FFAppState().currentlevelno,
                                      'lesson_no': FFAppState().currentlessonno,
                                      'is_active': true,
                                      'activated_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'is_completed': false,
                                      'course_id': FFAppState().courseid,
                                      'subcourse_id': FFAppState().subcourseid,
                                    });
                                  }
                                }
                                logFirebaseEvent('Button_bottom_sheet');
                                Navigator.pop(context);
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(HomePageWidget.routeName);

                                safeSetState(() {});
                              },
                              text: columnChooseCourseRow.courseName!,
                              options: FFButtonOptions(
                                width: 270.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: _model.notnowselected == true
                                    ? FlutterFlowTheme.of(context).alternate
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: _model.notnowselected == true
                                          ? FlutterFlowTheme.of(context)
                                              .primaryText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
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
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                            ),
                          ),
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
  }
}
