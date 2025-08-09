import '../database.dart';

class PushNotificationUserNotificationCollegeLeaderboardTable
    extends SupabaseTable<
        PushNotificationUserNotificationCollegeLeaderboardRow> {
  @override
  String get tableName =>
      'push_notification_user_notification_college_leaderboard';

  @override
  PushNotificationUserNotificationCollegeLeaderboardRow createRow(
          Map<String, dynamic> data) =>
      PushNotificationUserNotificationCollegeLeaderboardRow(data);
}

class PushNotificationUserNotificationCollegeLeaderboardRow
    extends SupabaseDataRow {
  PushNotificationUserNotificationCollegeLeaderboardRow(
      Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table =>
      PushNotificationUserNotificationCollegeLeaderboardTable();

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
