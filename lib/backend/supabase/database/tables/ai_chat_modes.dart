import '../database.dart';

class AiChatModesTable extends SupabaseTable<AiChatModesRow> {
  @override
  String get tableName => 'ai_chat_modes';

  @override
  AiChatModesRow createRow(Map<String, dynamic> data) => AiChatModesRow(data);
}

class AiChatModesRow extends SupabaseDataRow {
  AiChatModesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiChatModesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get modeId => getField<String>('mode_id');
  set modeId(String? value) => setField<String>('mode_id', value);

  String? get modeName => getField<String>('mode_name');
  set modeName(String? value) => setField<String>('mode_name', value);
}
