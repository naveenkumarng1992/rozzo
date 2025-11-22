import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'testpageformultiquestions_model.dart';
export 'testpageformultiquestions_model.dart';

class TestpageformultiquestionsWidget extends StatefulWidget {
  const TestpageformultiquestionsWidget({super.key});

  static String routeName = 'testpageformultiquestions';
  static String routePath = '/testpageformultiquestions';

  @override
  State<TestpageformultiquestionsWidget> createState() =>
      _TestpageformultiquestionsWidgetState();
}

class _TestpageformultiquestionsWidgetState
    extends State<TestpageformultiquestionsWidget> {
  late TestpageformultiquestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestpageformultiquestionsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'testpageformultiquestions'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TESTPAGEFORMULTIQUESTIONS_testpageformul');
      logFirebaseEvent('testpageformultiquestions_backend_call');
      _model.left1 = await QuestionsTestTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'question_number',
          2,
        ),
      );
      logFirebaseEvent('testpageformultiquestions_update_page_st');
      _model.multiselectoptionstest =
          _model.multiselectoptionstest.firstOrNull!.toList().cast<dynamic>();
      safeSetState(() {});
      logFirebaseEvent('testpageformultiquestions_update_page_st');
      _model.matchleftoptions = getJsonField(
        _model.left1!.firstOrNull!.options,
        r'''$.left''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.matchrightoptions = getJsonField(
        _model.left1!.firstOrNull!.options,
        r'''$.right''',
        true,
      )!
          .toList()
          .cast<dynamic>();
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Text(
                                'Match the pairs:',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Text(
                                'Question',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final left2 =
                                          _model.matchleftoptions.toList();

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(left2.length,
                                            (left2Index) {
                                          final left2Item = left2[left2Index];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TESTPAGEFORMULTIQUESTIONS_Container_6aar');
                                              if (!_model.matchlockedleftids
                                                  .contains(getJsonField(
                                                left2Item,
                                                r'''$.id''',
                                              ))) {
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.matchselectedleftid =
                                                    getJsonField(
                                                  left2Item,
                                                  r'''$.id''',
                                                );
                                                safeSetState(() {});
                                                if (!_model.matchlockedleftids
                                                    .contains(_model
                                                        .matchselectedleftid)) {
                                                  if (_model
                                                          .matchselectedleftid ==
                                                      _model
                                                          .matchselectedrightid) {
                                                    logFirebaseEvent(
                                                        'Container_wait__delay');
                                                    await Future.delayed(
                                                      Duration(
                                                        milliseconds: 5000,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Container_update_page_state');
                                                    _model.addToMatchlockedleftids(
                                                        _model
                                                            .matchselectedleftid!);
                                                    _model.addToMatchlockedrightids(
                                                        _model
                                                            .matchselectedrightid!);
                                                    safeSetState(() {});
                                                  }
                                                }
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: (_model.matchselectedleftid ==
                                                              _model
                                                                  .matchselectedrightid) &&
                                                          (_model.matchselectedleftid !=
                                                              null) &&
                                                          (_model.matchselectedrightid !=
                                                              null)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    getJsonField(
                                                      left2Item,
                                                      r'''$.label''',
                                                    ).toString(),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                              color: !_model
                                                                      .matchlockedleftids
                                                                      .contains(
                                                                          getJsonField(
                                                                left2Item,
                                                                r'''$.id''',
                                                              ))
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final right1 =
                                          _model.matchrightoptions.toList();

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(right1.length,
                                            (right1Index) {
                                          final right1Item =
                                              right1[right1Index];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TESTPAGEFORMULTIQUESTIONS_Container_unj4');
                                              if (!_model.matchlockedrightids
                                                  .contains(getJsonField(
                                                right1Item,
                                                r'''$.id''',
                                              ))) {
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.matchselectedrightid =
                                                    getJsonField(
                                                  right1Item,
                                                  r'''$.id''',
                                                );
                                                safeSetState(() {});
                                                if (!_model.matchlockedrightids
                                                    .contains(_model
                                                        .matchselectedrightid)) {
                                                  if (_model
                                                          .matchselectedleftid ==
                                                      _model
                                                          .matchselectedrightid) {
                                                    logFirebaseEvent(
                                                        'Container_update_page_state');
                                                    _model.addToMatchlockedleftids(
                                                        _model
                                                            .matchselectedleftid!);
                                                    _model.addToMatchlockedrightids(
                                                        _model
                                                            .matchselectedrightid!);
                                                    safeSetState(() {});
                                                  }
                                                  logFirebaseEvent(
                                                      'Container_update_page_state');
                                                  _model.matchselectedleftid =
                                                      null;
                                                  _model.matchselectedrightid =
                                                      null;
                                                  safeSetState(() {});
                                                }
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    getJsonField(
                                                      right1Item,
                                                      r'''$.label''',
                                                    ).toString(),
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                              color: !_model
                                                                      .matchlockedleftids
                                                                      .contains(
                                                                          getJsonField(
                                                                right1Item,
                                                                r'''$.id''',
                                                              ))
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
