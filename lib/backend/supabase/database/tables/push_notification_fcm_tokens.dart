import '../database.dart';

class PushNotificationFcmTokensTable
    extends SupabaseTable<PushNotificationFcmTokensRow> {
  @override
  String get tableName => 'push_notification_fcm_tokens';

  @override
  PushNotificationFcmTokensRow createRow(Map<String, dynamic> data) =>
      PushNotificationFcmTokensRow(data);
}

class PushNotificationFcmTokensRow extends SupabaseDataRow {
  PushNotificationFcmTokensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PushNotificationFcmTokensTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  String? get deviceId => getField<String>('device_id');
  set deviceId(String? value) => setField<String>('device_id', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
