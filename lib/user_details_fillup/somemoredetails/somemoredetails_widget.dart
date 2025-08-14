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
import 'somemoredetails_model.dart';
export 'somemoredetails_model.dart';

class SomemoredetailsWidget extends StatefulWidget {
  const SomemoredetailsWidget({super.key});

  static String routeName = 'Somemoredetails';
  static String routePath = '/somemoredetails';

  @override
  State<SomemoredetailsWidget> createState() => _SomemoredetailsWidgetState();
}

class _SomemoredetailsWidgetState extends State<SomemoredetailsWidget>
    with TickerProviderStateMixin {
  late SomemoredetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SomemoredetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Somemoredetails'});
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1120.0.ms,
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
    return FutureBuilder<List<ChallengeDailyChallengeRow>>(
      future: ChallengeDailyChallengeTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'challenge_number',
          4,
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
        List<ChallengeDailyChallengeRow>
            somemoredetailsChallengeDailyChallengeRowList = snapshot.data!;

        final somemoredetailsChallengeDailyChallengeRow =
            somemoredetailsChallengeDailyChallengeRowList.isNotEmpty
                ? somemoredetailsChallengeDailyChallengeRowList.first
                : null;

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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FutureBuilder<List<ChallengeDailyChallengeRow>>(
                  future: ChallengeDailyChallengeTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'challenge_number',
                      3,
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
                    List<ChallengeDailyChallengeRow>
                        stackChallengeDailyChallengeRowList = snapshot.data!;

                    final stackChallengeDailyChallengeRow =
                        stackChallengeDailyChallengeRowList.isNotEmpty
                            ? stackChallengeDailyChallengeRowList.first
                            : null;

                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/802776b71db4507f26c221496299fb2c-removebg-preview.png',
                                width: 118.0,
                                height: 162.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 200.0),
                              child: Container(
                                width: 250.0,
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
                                      5.0, 0.0, 5.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              'Can you give me some more details about you?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        )
                                      ],
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
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.02, 0.65),
                            child:
                                FutureBuilder<List<ChallengeDailyChallengeRow>>(
                              future:
                                  ChallengeDailyChallengeTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'challenge_number',
                                  2,
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
                                List<ChallengeDailyChallengeRow>
                                    buttonChallengeDailyChallengeRowList =
                                    snapshot.data!;

                                final buttonChallengeDailyChallengeRow =
                                    buttonChallengeDailyChallengeRowList
                                            .isNotEmpty
                                        ? buttonChallengeDailyChallengeRowList
                                            .first
                                        : null;

                                return FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SOMEMOREDETAILS_PAGE_SURE_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.goNamed(
                                      UserCountryListWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                        ),
                                      },
                                    );

                                    logFirebaseEvent('Button_backend_call');
                                    await ChallengeUserChallengeTable().insert({
                                      'challenge_number':
                                          buttonChallengeDailyChallengeRow
                                              ?.challengeNumber,
                                      'challenge_type':
                                          buttonChallengeDailyChallengeRow
                                              ?.challengeType,
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'user_id': currentUserUid,
                                      'challenge_id':
                                          buttonChallengeDailyChallengeRow
                                              ?.challengeId,
                                      'target': buttonChallengeDailyChallengeRow
                                          ?.target,
                                      'challenge_name':
                                          buttonChallengeDailyChallengeRow
                                              ?.challengeName,
                                    });
                                    logFirebaseEvent('Button_backend_call');
                                    await ChallengeUserChallengeTable().insert({
                                      'challenge_number':
                                          stackChallengeDailyChallengeRow
                                              ?.challengeNumber,
                                      'challenge_type':
                                          stackChallengeDailyChallengeRow
                                              ?.challengeType,
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'user_id': currentUserUid,
                                      'challenge_id':
                                          stackChallengeDailyChallengeRow
                                              ?.challengeId,
                                      'target': stackChallengeDailyChallengeRow
                                          ?.target,
                                      'challenge_name':
                                          stackChallengeDailyChallengeRow
                                              ?.challengeName,
                                    });
                                    logFirebaseEvent('Button_backend_call');
                                    await ChallengeUserChallengeTable().insert({
                                      'challenge_number':
                                          somemoredetailsChallengeDailyChallengeRow
                                              ?.challengeNumber,
                                      'challenge_type':
                                          somemoredetailsChallengeDailyChallengeRow
                                              ?.challengeType,
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'user_id': currentUserUid,
                                      'challenge_id':
                                          somemoredetailsChallengeDailyChallengeRow
                                              ?.challengeId,
                                      'target':
                                          somemoredetailsChallengeDailyChallengeRow
                                              ?.target,
                                      'challenge_name':
                                          somemoredetailsChallengeDailyChallengeRow
                                              ?.challengeName,
                                    });
                                  },
                                  text: 'Sure!',
                                  options: FFButtonOptions(
                                    width: 300.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
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
                                          color: Colors.white,
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
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                );
                              },
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
        );
      },
    );
  }
}
