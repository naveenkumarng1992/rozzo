import '../database.dart';

class PushNotificationUserNotificationUserLeaderboardTable
    extends SupabaseTable<PushNotificationUserNotificationUserLeaderboardRow> {
  @override
  String get tableName =>
      'push_notification_user_notification_user_leaderboard';

  @override
  PushNotificationUserNotificationUserLeaderboardRow createRow(
          Map<String, dynamic> data) =>
      PushNotificationUserNotificationUserLeaderboardRow(data);
}

class PushNotificationUserNotificationUserLeaderboardRow
    extends SupabaseDataRow {
  PushNotificationUserNotificationUserLeaderboardRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table =>
      PushNotificationUserNotificationUserLeaderboardTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get templateId => getField<String>('template_id');
  set templateId(String? value) => setField<String>('template_id', value);

  bool? get sent => getField<bool>('sent');
  set sent(bool? value) => setField<bool>('sent', value);

  DateTime? get sendTime => getField<DateTime>('send_time');
  set sendTime(DateTime? value) => setField<DateTime>('send_time', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
