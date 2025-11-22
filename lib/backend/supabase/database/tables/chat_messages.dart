import '../database.dart';

class ChatMessagesTable extends SupabaseTable<ChatMessagesRow> {
  @override
  String get tableName => 'chat_messages';

  @override
  ChatMessagesRow createRow(Map<String, dynamic> data) => ChatMessagesRow(data);
}

class ChatMessagesRow extends SupabaseDataRow {
  ChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMessagesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get sessionId => getField<String>('session_id');
  set sessionId(String? value) => setField<String>('session_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get tokensPrompt => getField<int>('tokens_prompt');
  set tokensPrompt(int? value) => setField<int>('tokens_prompt', value);

  int? get tokensCompletion => getField<int>('tokens_completion');
  set tokensCompletion(int? value) => setField<int>('tokens_completion', value);

  int? get totalTokens => getField<int>('total_tokens');
  set totalTokens(int? value) => setField<int>('total_tokens', value);
}
