import '../database.dart';

class ChatSessionsTable extends SupabaseTable<ChatSessionsRow> {
  @override
  String get tableName => 'chat_sessions';

  @override
  ChatSessionsRow createRow(Map<String, dynamic> data) => ChatSessionsRow(data);
}

class ChatSessionsRow extends SupabaseDataRow {
  ChatSessionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatSessionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get mode => getField<String>('mode')!;
  set mode(String value) => setField<String>('mode', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get sessionName => getField<String>('session_name');
  set sessionName(String? value) => setField<String>('session_name', value);

  String? get topicName => getField<String>('topic_name');
  set topicName(String? value) => setField<String>('topic_name', value);

  String? get systemName => getField<String>('system_name');
  set systemName(String? value) => setField<String>('system_name', value);

  int? get currentStepIndex => getField<int>('current_step_index');
  set currentStepIndex(int? value) =>
      setField<int>('current_step_index', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
