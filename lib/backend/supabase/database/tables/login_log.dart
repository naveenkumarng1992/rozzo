import '../database.dart';

class LoginLogTable extends SupabaseTable<LoginLogRow> {
  @override
  String get tableName => 'login_log';

  @override
  LoginLogRow createRow(Map<String, dynamic> data) => LoginLogRow(data);
}

class LoginLogRow extends SupabaseDataRow {
  LoginLogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoginLogTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get loginTime => getField<DateTime>('login_time');
  set loginTime(DateTime? value) => setField<DateTime>('login_time', value);

  String? get ipAddress => getField<String>('ip_address');
  set ipAddress(String? value) => setField<String>('ip_address', value);

  String? get deviceInfo => getField<String>('device_info');
  set deviceInfo(String? value) => setField<String>('device_info', value);

  bool? get successful => getField<bool>('successful');
  set successful(bool? value) => setField<bool>('successful', value);
}
