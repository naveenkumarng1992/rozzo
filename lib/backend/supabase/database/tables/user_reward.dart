import '../database.dart';

class UserRewardTable extends SupabaseTable<UserRewardRow> {
  @override
  String get tableName => 'user_reward';

  @override
  UserRewardRow createRow(Map<String, dynamic> data) => UserRewardRow(data);
}

class UserRewardRow extends SupabaseDataRow {
  UserRewardRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserRewardTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get rewardType => getField<String>('reward_type');
  set rewardType(String? value) => setField<String>('reward_type', value);

  int? get xpEarned => getField<int>('xp_earned');
  set xpEarned(int? value) => setField<int>('xp_earned', value);

  String? get lessonId => getField<String>('lesson_id');
  set lessonId(String? value) => setField<String>('lesson_id', value);

  String? get eventType => getField<String>('event_type');
  set eventType(String? value) => setField<String>('event_type', value);
}
