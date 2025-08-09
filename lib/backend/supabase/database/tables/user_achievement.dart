import '../database.dart';

class UserAchievementTable extends SupabaseTable<UserAchievementRow> {
  @override
  String get tableName => 'user_achievement';

  @override
  UserAchievementRow createRow(Map<String, dynamic> data) =>
      UserAchievementRow(data);
}

class UserAchievementRow extends SupabaseDataRow {
  UserAchievementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserAchievementTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get achievementType => getField<String>('achievement_type');
  set achievementType(String? value) =>
      setField<String>('achievement_type', value);

  String? get achievementName => getField<String>('achievement_name');
  set achievementName(String? value) =>
      setField<String>('achievement_name', value);

  String? get achievementDescription =>
      getField<String>('achievement_description');
  set achievementDescription(String? value) =>
      setField<String>('achievement_description', value);

  int? get xpEarned => getField<int>('xp_earned');
  set xpEarned(int? value) => setField<int>('xp_earned', value);
}
