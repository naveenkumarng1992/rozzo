import '../database.dart';

class PushNotificationUserNotificationsTotalHeartsTable
    extends SupabaseTable<PushNotificationUserNotificationsTotalHeartsRow> {
  @override
  String get tableName => 'push_notification_user_notifications_total_hearts';

  @override
  PushNotificationUserNotificationsTotalHeartsRow createRow(
          Map<String, dynamic> data) =>
      PushNotificationUserNotificationsTotalHeartsRow(data);
}

class PushNotificationUserNotificationsTotalHeartsRow extends SupabaseDataRow {
  PushNotificationUserNotificationsTotalHeartsRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table =>
      PushNotificationUserNotificationsTotalHeartsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get templateId => getField<String>('template_id');
  set templateId(String? value) => setField<String>('template_id', value);

  DateTime? get sendTime => getField<DateTime>('send_time');
  set sendTime(DateTime? value) => setField<DateTime>('send_time', value);

  bool? get sent => getField<bool>('sent');
  set sent(bool? value) => setField<bool>('sent', value);
}
