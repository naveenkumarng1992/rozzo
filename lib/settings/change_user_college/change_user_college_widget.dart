import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'change_user_college_model.dart';
export 'change_user_college_model.dart';

class ChangeUserCollegeWidget extends StatefulWidget {
  const ChangeUserCollegeWidget({
    super.key,
    int? statechosen,
  }) : this.statechosen = statechosen ?? 1;

  final int statechosen;

  static String routeName = 'Change_User_College';
  static String routePath = '/changeUserCollege';

  @override
  State<ChangeUserCollegeWidget> createState() =>
      _ChangeUserCollegeWidgetState();
}

class _ChangeUserCollegeWidgetState extends State<ChangeUserCollegeWidget>
    with TickerProviderStateMixin {
  late ChangeUserCollegeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeUserCollegeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Change_User_College'});
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1480.0.ms,
            begin: Offset(-3.0, -3.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'CHANGE_USER_COLLEGE_Icon_p2ghd4rn_ON_TAP');
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed(
                          ProfileWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                            ),
                          },
                        );
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).alternate,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/file_(4).png',
                          width: 70.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 3.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Choose your college',
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
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3.0,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                FutureBuilder<List<UserDetailsRow>>(
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<UserDetailsRow> containerUserDetailsRowList =
                        snapshot.data!;

                    final containerUserDetailsRow =
                        containerUserDetailsRowList.isNotEmpty
                            ? containerUserDetailsRowList.first
                            : null;

                    return Container(
                      width: 370.0,
                      height: 500.0,
                      decoration: BoxDecoration(),
                      child: FutureBuilder<List<CollegeListRow>>(
                        future: CollegeListTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'state_id',
                            containerUserDetailsRow?.state,
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
                          List<CollegeListRow> listViewCollegeListRowList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            primary: false,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewCollegeListRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewCollegeListRow =
                                  listViewCollegeListRowList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CHANGE_USER_COLLEGE_Container_7uhcvn8y_O');
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.college =
                                        listViewCollegeListRow.collegeId;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 75.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: _model.college ==
                                                listViewCollegeListRow.collegeId
                                            ? FlutterFlowTheme.of(context)
                                                .alternate
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          listViewCollegeListRow.collegeName,
                                          'college name',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: _model.college ==
                                                      listViewCollegeListRow
                                                          .collegeId
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
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
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                Divider(
                  thickness: 3.0,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'CHANGE_USER_COLLEGE_CONTINUE_BTN_ON_TAP');
                      if (_model.college != null) {
                        logFirebaseEvent('Button_backend_call');
                        await UserDetailsTable().update(
                          data: {
                            'college_id': _model.college,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'user_id',
                            currentUserUid,
                          ),
                        );
                        logFirebaseEvent('Button_backend_call');
                        await LeaderboardUserRankInTheGroupTable().update(
                          data: {
                            'college_id': _model.college,
                          },
                          matchingRows: (rows) => rows.eqOrNull(
                            'user_id',
                            currentUserUid,
                          ),
                        );
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          ProfileWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.leftToRight,
                            ),
                          },
                        );
                      }

                      safeSetState(() {});
                    },
                    text: 'CONTINUE',
                    options: FFButtonOptions(
                      width: 350.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 18.0,
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
