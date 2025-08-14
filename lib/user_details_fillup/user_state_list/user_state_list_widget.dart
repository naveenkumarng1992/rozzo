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
import 'user_state_list_model.dart';
export 'user_state_list_model.dart';

class UserStateListWidget extends StatefulWidget {
  const UserStateListWidget({
    super.key,
    int? countrychosen,
  }) : this.countrychosen = countrychosen ?? 1;

  final int countrychosen;

  static String routeName = 'User_State_List';
  static String routePath = '/userStateList';

  @override
  State<UserStateListWidget> createState() => _UserStateListWidgetState();
}

class _UserStateListWidgetState extends State<UserStateListWidget>
    with TickerProviderStateMixin {
  late UserStateListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserStateListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'User_State_List'});
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('USER_STATE_LIST_Column_4bnr8fw1_ON_TAP');
                logFirebaseEvent('Column_backend_call');
                _model.updatestateofuser = await UserDetailsTable().update(
                  data: {
                    'state': _model.stateidchosen,
                  },
                  matchingRows: (rows) => rows.eqOrNull(
                    'user_id',
                    currentUserUid,
                  ),
                  returnRows: true,
                );

                safeSetState(() {});
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/802776b71db4507f26c221496299fb2c-removebg-preview.png',
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
                                  'Choose your state(College)',
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
                    Container(
                      height: 470.0,
                      decoration: BoxDecoration(),
                      child: FutureBuilder<List<StateListRow>>(
                        future: StateListTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'country_id',
                            widget.countrychosen,
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
                          List<StateListRow> listViewStateListRowList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            primary: false,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewStateListRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewStateListRow =
                                  listViewStateListRowList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 30.0, 20.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'USER_STATE_LIST_ULNAR_ARTERY_BTN_ON_TAP');
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    _model.stateidchosen =
                                        listViewStateListRow.stateId;
                                    safeSetState(() {});
                                  },
                                  text: listViewStateListRow.nameOfTheState!,
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
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: _model.stateidchosen ==
                                                  listViewStateListRow.stateId
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
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
                                    elevation: 4.0,
                                    borderSide: BorderSide(
                                      color: _model.stateidchosen ==
                                              listViewStateListRow.stateId
                                          ? FlutterFlowTheme.of(context)
                                              .alternate
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
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
                              'USER_STATE_LIST_PAGE_CONTINUE_BTN_ON_TAP');
                          if (_model.stateidchosen != null) {
                            logFirebaseEvent('Button_backend_call');
                            await UserDetailsTable().update(
                              data: {
                                'state': _model.stateidchosen,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'user_id',
                                currentUserUid,
                              ),
                            );
                            logFirebaseEvent('Button_backend_call');
                            await LeaderboardUserRankInTheGroupTable().update(
                              data: {
                                'state_id': _model.stateidchosen,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'user_id',
                                currentUserUid,
                              ),
                            );
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              UserCollegeListWidget.routeName,
                              queryParameters: {
                                'statechosen': serializeParam(
                                  _model.stateidchosen,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        },
                        text: 'CONTINUE',
                        options: FFButtonOptions(
                          width: 350.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
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
        ),
      ),
    );
  }
}
