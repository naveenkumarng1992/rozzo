import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RozzoExplainmodeAIchatCall {
  static Future<ApiCallResponse> call({
    String? aiReply = 'Stores assistant message',
    String? userId = '',
    String? chatsessionId = '',
    String? userPrompt = '',
    String? systemName = '',
    String? topicName = '',
    String? mode = 'quick_revise',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "session_id": "${escapeStringForJson(chatsessionId)}",
  "new_message": "${escapeStringForJson(userPrompt)}",
  "system_name": "${escapeStringForJson(systemName)}",
  "topic_name": "${escapeStringForJson(topicName)}",
  "mode": "${escapeStringForJson(mode)}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'RozzoExplainmodeAIchat',
      apiUrl:
          'https://wynwfipbypahdzczidep.supabase.co/functions/v1/bright-task',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind5bndmaXBieXBhaGR6Y3ppZGVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI0MDU4NjUsImV4cCI6MjAzNzk4MTg2NX0.eg2DIELJmUcXhJoGTC1hSuquSGmZtjJj4WTPOiaXyio',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AIchatfollowupquestionsCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? sessionId = '',
    String? userAnswer = '',
    String? mode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}",
  "session_id": "${escapeStringForJson(sessionId)}",
  "user_answer": "${escapeStringForJson(userAnswer)}",
  "mode": "${escapeStringForJson(mode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AIchatfollowupquestions',
      apiUrl:
          'https://wynwfipbypahdzczidep.supabase.co/functions/v1/ai_chat_conversation_follow_up_questions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind5bndmaXBieXBhaGR6Y3ppZGVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI0MDU4NjUsImV4cCI6MjAzNzk4MTg2NX0.eg2DIELJmUcXhJoGTC1hSuquSGmZtjJj4WTPOiaXyio',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
