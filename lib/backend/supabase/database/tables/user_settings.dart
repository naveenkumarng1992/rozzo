import '../database.dart';

class UserSettingsTable extends SupabaseTable<UserSettingsRow> {
  @override
  String get tableName => 'user_settings';

  @override
  UserSettingsRow createRow(Map<String, dynamic> data) => UserSettingsRow(data);
}

class UserSettingsRow extends SupabaseDataRow {
  UserSettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserSettingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get settingName => getField<String>('setting_name');
  set settingName(String? value) => setField<String>('setting_name', value);

  int? get settingValue => getField<int>('setting_value');
  set settingValue(int? value) => setField<int>('setting_value', value);
}
