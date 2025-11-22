import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/needdiamondtoask_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_i_chat_page_model.dart';
export 'a_i_chat_page_model.dart';

class AIChatPageWidget extends StatefulWidget {
  const AIChatPageWidget({super.key});

  static String routeName = 'AIChatPage';
  static String routePath = '/aIChatPage';

  @override
  State<AIChatPageWidget> createState() => _AIChatPageWidgetState();
}

class _AIChatPageWidgetState extends State<AIChatPageWidget> {
  late AIChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AIChatPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AIChatPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('A_I_CHAT_AIChatPage_ON_INIT_STATE');
      logFirebaseEvent('AIChatPage_backend_call');
      _model.sessionidupdate = await ChatSessionsTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .order('updated_at'),
      );
      if (FFAppState().chatsessionid == null ||
          FFAppState().chatsessionid == '') {
        logFirebaseEvent('AIChatPage_update_app_state');
        FFAppState().chatsessionid = _model.sessionidupdate!.firstOrNull!.id;
        safeSetState(() {});
      }
      if (FFAppState().chatsessionid == null ||
          FFAppState().chatsessionid == '') {
        logFirebaseEvent('AIChatPage_drawer');
        scaffoldKey.currentState!.openDrawer();
      }
      logFirebaseEvent('AIChatPage_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 100,
        ),
      );
      logFirebaseEvent('AIChatPage_scroll_to');
      await _model.listViewController?.animateTo(
        _model.listViewController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ChatSessionsRow>>(
      future: ChatSessionsTable().querySingleRow(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .order('created_at'),
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
        List<ChatSessionsRow> aIChatPageChatSessionsRowList = snapshot.data!;

        final aIChatPageChatSessionsRow =
            aIChatPageChatSessionsRowList.isNotEmpty
                ? aIChatPageChatSessionsRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Visibility(
              visible: FFAppState().chatsessionid != null &&
                  FFAppState().chatsessionid != '',
              child: Opacity(
                opacity: 0.8,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                  child: FloatingActionButton(
                    onPressed: () async {
                      logFirebaseEvent(
                          'A_I_CHAT_FloatingActionButton_qhf2z5wo_O');
                      logFirebaseEvent('FloatingActionButton_scroll_to');
                      await _model.listViewController?.animateTo(
                        _model.listViewController!.position.maxScrollExtent,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.ease,
                      );
                    },
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    elevation: 8.0,
                    child: Icon(
                      Icons.keyboard_double_arrow_down_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
            ),
            drawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Drawer(
                elevation: 16.0,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UserDetailsRow> columnUserDetailsRowList =
                          snapshot.data!;

                      final columnUserDetailsRow =
                          columnUserDetailsRowList.isNotEmpty
                              ? columnUserDetailsRowList.first
                              : null;

                      return SingleChildScrollView(
                        controller: _model.columnController1,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: StreamBuilder<List<ChatSessionsRow>>(
                                stream: _model.buttonSupabaseStream ??= SupaFlow
                                    .client
                                    .from("chat_sessions")
                                    .stream(primaryKey: ['id'])
                                    .eqOrNull(
                                      'user_id',
                                      currentUserUid,
                                    )
                                    .order('created_at')
                                    .map((list) => list
                                        .map((item) => ChatSessionsRow(item))
                                        .toList()),
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
                                  List<ChatSessionsRow>
                                      buttonChatSessionsRowList =
                                      snapshot.data!;

                                  final buttonChatSessionsRow =
                                      buttonChatSessionsRowList.isNotEmpty
                                          ? buttonChatSessionsRowList.first
                                          : null;

                                  return FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'A_I_CHAT_PAGE_PAGE_NEW_CHAT_BTN_ON_TAP');
                                      if (columnUserDetailsRow!.gems! >= 1) {
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().newaipage = true;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().noofgems =
                                            columnUserDetailsRow!.gems!;
                                        safeSetState(() {});
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().noofgems =
                                            FFAppState().noofgems + -2;
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_backend_call');
                                        await UserDetailsTable().update(
                                          data: {
                                            'gems': FFAppState().noofgems,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'user_id',
                                            currentUserUid,
                                          ),
                                        );
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                            ChoosAIModeWidget.routeName);
                                      } else {
                                        logFirebaseEvent('Button_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: 170.0,
                                                  child:
                                                      NeeddiamondtoaskWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    text: 'New Chat',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: FutureBuilder<List<ChatSessionsRow>>(
                                future: ChatSessionsTable().queryRows(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'user_id',
                                        currentUserUid,
                                      )
                                      .order('updated_at'),
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
                                  List<ChatSessionsRow>
                                      columnChatSessionsRowList =
                                      snapshot.data!;

                                  return SingleChildScrollView(
                                    controller: _model.columnController2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                          columnChatSessionsRowList.length,
                                          (columnIndex) {
                                        final columnChatSessionsRow =
                                            columnChatSessionsRowList[
                                                columnIndex];
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'A_I_CHAT_PAGE_PAGE_Text_3mg5w6va_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_update_app_state');
                                                FFAppState().chatsessionid =
                                                    columnChatSessionsRow.id;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Text_update_app_state');
                                                FFAppState().aichatmode =
                                                    columnChatSessionsRow.mode;
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Text_close_dialog_drawer_etc');
                                                Navigator.pop(context);
                                                logFirebaseEvent(
                                                    'Text_navigate_to');

                                                context.pushNamed(
                                                    AIChatPageWidget.routeName);
                                              },
                                              child: Text(
                                                valueOrDefault<String>(
                                                  columnChatSessionsRow
                                                      .topicName,
                                                  'Name of Chat',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: columnChatSessionsRow
                                                                  .id ==
                                                              FFAppState()
                                                                  .chatsessionid
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).divide(SizedBox(height: 20.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: FutureBuilder<List<AiChatModesRow>>(
                        future: AiChatModesTable().querySingleRow(
                          queryFn: (q) => q.eqOrNull(
                            'mode_id',
                            FFAppState().aichatmode,
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
                          List<AiChatModesRow> textAiChatModesRowList =
                              snapshot.data!;

                          final textAiChatModesRow =
                              textAiChatModesRowList.isNotEmpty
                                  ? textAiChatModesRowList.first
                                  : null;

                          return Text(
                            valueOrDefault<String>(
                              textAiChatModesRow?.modeName,
                              'Chat Mode',
                            ),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 60.0),
                    child: StreamBuilder<List<ChatMessagesRow>>(
                      stream: _model.listViewSupabaseStream ??= SupaFlow.client
                          .from("chat_messages")
                          .stream(primaryKey: ['id'])
                          .eqOrNull(
                            'session_id',
                            FFAppState().chatsessionid,
                          )
                          .order('created_at', ascending: true)
                          .map((list) => list
                              .map((item) => ChatMessagesRow(item))
                              .toList()),
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
                        List<ChatMessagesRow> listViewChatMessagesRowList =
                            snapshot.data!;

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewChatMessagesRowList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 20.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewChatMessagesRow =
                                listViewChatMessagesRowList[listViewIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: listViewChatMessagesRow.role == 'user'
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: custom_widgets.RozzoMarkdownViewer(
                                    width: double.infinity,
                                    height: 10.0,
                                    content: listViewChatMessagesRow.message,
                                  ),
                                ),
                              ),
                            );
                          },
                          controller: _model.listViewController,
                        );
                      },
                    ),
                  ),
                  if (FFAppState().chatsessionid == null ||
                      FFAppState().chatsessionid == '')
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        height: 500.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/802776b71db4507f26c221496299fb2c-removebg-preview.png',
                                width: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  if (FFAppState().chatsessionid != null &&
                      FFAppState().chatsessionid != '')
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        hintText:
                                            'Ask anything related to your studies',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                                      maxLines: null,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      enableInteractiveSelection: true,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
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
                                      buttonUserDetailsRowList = snapshot.data!;

                                  final buttonUserDetailsRow =
                                      buttonUserDetailsRowList.isNotEmpty
                                          ? buttonUserDetailsRowList.first
                                          : null;

                                  return FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'A_I_CHAT_PAGE_PAGE_SEND_BTN_ON_TAP');
                                      if (buttonUserDetailsRow!.gems! > 1) {
                                        logFirebaseEvent(
                                            'Button_update_page_state');
                                        _model.userPromptText =
                                            _model.textController.text;
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_backend_call');
                                        await AIchatfollowupquestionsCall.call(
                                          userId: currentUserUid,
                                          sessionId: FFAppState().chatsessionid,
                                          userAnswer: _model.userPromptText,
                                          mode: FFAppState().aichatmode,
                                        );

                                        logFirebaseEvent('Button_backend_call');
                                        await ChatSessionsTable().update(
                                          data: {
                                            'updated_at':
                                                supaSerialize<DateTime>(
                                                    getCurrentTimestamp),
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'id',
                                            FFAppState().chatsessionid,
                                          ),
                                        );
                                      } else {
                                        logFirebaseEvent('Button_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: 170.0,
                                                  child:
                                                      NeeddiamondtoaskWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      }
                                    },
                                    text: 'Send',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (FFAppState().chatsessionid == null ||
                      FFAppState().chatsessionid == '')
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 15.0, 10.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                                Text(
                                  'Start your new chat 👋',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 25.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'A_I_CHAT_PAGE_PAGE_Icon_kwg04lor_ON_TAP');
                          logFirebaseEvent('Icon_drawer');
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
