import '../database.dart';

class SessionLogTable extends SupabaseTable<SessionLogRow> {
  @override
  String get tableName => 'session_log';

  @override
  SessionLogRow createRow(Map<String, dynamic> data) => SessionLogRow(data);
}

class SessionLogRow extends SupabaseDataRow {
  SessionLogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SessionLogTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get sessionStart => getField<DateTime>('session_start');
  set sessionStart(DateTime? value) =>
      setField<DateTime>('session_start', value);

  DateTime? get sessionEnd => getField<DateTime>('session_end');
  set sessionEnd(DateTime? value) => setField<DateTime>('session_end', value);

  String? get deviceInfo => getField<String>('device_info');
  set deviceInfo(String? value) => setField<String>('device_info', value);
}
