import '../database.dart';

class PushNotificationUserNotificationsDemotionAlertTable
    extends SupabaseTable<PushNotificationUserNotificationsDemotionAlertRow> {
  @override
  String get tableName => 'push_notification_user_notifications_demotion_alert';

  @override
  PushNotificationUserNotificationsDemotionAlertRow createRow(
          Map<String, dynamic> data) =>
      PushNotificationUserNotificationsDemotionAlertRow(data);
}

class PushNotificationUserNotificationsDemotionAlertRow
    extends SupabaseDataRow {
  PushNotificationUserNotificationsDemotionAlertRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table =>
      PushNotificationUserNotificationsDemotionAlertTable();

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

  bool? get delivered => getField<bool>('delivered');
  set delivered(bool? value) => setField<bool>('delivered', value);

  bool? get opened => getField<bool>('opened');
  set opened(bool? value) => setField<bool>('opened', value);
}
