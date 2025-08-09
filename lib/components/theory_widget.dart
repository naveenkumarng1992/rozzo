import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'theory_model.dart';
export 'theory_model.dart';

class TheoryWidget extends StatefulWidget {
  const TheoryWidget({super.key});

  @override
  State<TheoryWidget> createState() => _TheoryWidgetState();
}

class _TheoryWidgetState extends State<TheoryWidget> {
  late TheoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TheoryModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: 220.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      valueOrDefault<String>(
                                        columnAnatomyQuestionDetailsRow
                                            ?.lessonName,
                                        'Lesson Name',
                                      ),
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
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
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
                                        'THEORY_COMP_Icon_4mt5eq2d_ON_TAP');
                                    logFirebaseEvent('Icon_navigate_back');
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    if (columnAnatomyQuestionDetailsRow?.image1Url != null &&
                        columnAnatomyQuestionDetailsRow?.image1Url != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (columnAnatomyQuestionDetailsRow
                                              ?.image1Url !=
                                          null &&
                                      columnAnatomyQuestionDetailsRow
                                              ?.image1Url !=
                                          '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'THEORY_COMP_Image_08t25xuf_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                columnAnatomyQuestionDetailsRow
                                                    .image1Url!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: true,
                                              tag:
                                                  columnAnatomyQuestionDetailsRow
                                                      .image1Url!,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: columnAnatomyQuestionDetailsRow!
                                            .image1Url!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            columnAnatomyQuestionDetailsRow
                                                .image1Url!,
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'THEORY_COMP_Image_9ckmq6mr_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                columnAnatomyQuestionDetailsRow
                                                    .image1Url!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: true,
                                              tag:
                                                  columnAnatomyQuestionDetailsRow
                                                      .image1Url!,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: columnAnatomyQuestionDetailsRow!
                                            .image1Url!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            columnAnatomyQuestionDetailsRow
                                                .image1Url!,
                                            width: 200.0,
                                            height: 200.0,
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'THEORY_COMP_Image_0yqcyxei_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                columnAnatomyQuestionDetailsRow
                                                    .image1Url!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: true,
                                              tag:
                                                  columnAnatomyQuestionDetailsRow
                                                      .image1Url!,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: columnAnatomyQuestionDetailsRow!
                                            .image1Url!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            columnAnatomyQuestionDetailsRow
                                                .image1Url!,
                                            width: 200.0,
                                            height: 200.0,
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'THEORY_COMP_Image_5sewrxdw_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                columnAnatomyQuestionDetailsRow
                                                    .image1Url!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: true,
                                              tag:
                                                  columnAnatomyQuestionDetailsRow
                                                      .image1Url!,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: columnAnatomyQuestionDetailsRow!
                                            .image1Url!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            columnAnatomyQuestionDetailsRow
                                                .image1Url!,
                                            width: 200.0,
                                            height: 200.0,
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'THEORY_COMP_Image_tfisb3bz_ON_TAP');
                                        logFirebaseEvent('Image_expand_image');
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                columnAnatomyQuestionDetailsRow
                                                    .image1Url!,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: true,
                                              tag:
                                                  columnAnatomyQuestionDetailsRow
                                                      .image1Url!,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: columnAnatomyQuestionDetailsRow!
                                            .image1Url!,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            columnAnatomyQuestionDetailsRow
                                                .image1Url!,
                                            width: 200.0,
                                            height: 200.0,
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
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 50.0, 15.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            columnAnatomyQuestionDetailsRow?.theory,
                            'Theory not available for this question.',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
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
    );
  }
}
