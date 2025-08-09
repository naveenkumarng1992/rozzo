import '../database.dart';

class StreakUserStreakTable extends SupabaseTable<StreakUserStreakRow> {
  @override
  String get tableName => 'streak_user_streak';

  @override
  StreakUserStreakRow createRow(Map<String, dynamic> data) =>
      StreakUserStreakRow(data);
}

class StreakUserStreakRow extends SupabaseDataRow {
  StreakUserStreakRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StreakUserStreakTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get currentStreak => getField<int>('current_streak');
  set currentStreak(int? value) => setField<int>('current_streak', value);

  int? get longestStreak => getField<int>('longest_streak');
  set longestStreak(int? value) => setField<int>('longest_streak', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);

  DateTime? get lastActiveDate => getField<DateTime>('last_active_date');
  set lastActiveDate(DateTime? value) =>
      setField<DateTime>('last_active_date', value);

  int? get streakResetCount => getField<int>('streak_reset_count');
  set streakResetCount(int? value) =>
      setField<int>('streak_reset_count', value);

  bool get streakFreeze => getField<bool>('streak_freeze')!;
  set streakFreeze(bool value) => setField<bool>('streak_freeze', value);

  PostgresTime? get lastActiveTime =>
      getField<PostgresTime>('last_active_time');
  set lastActiveTime(PostgresTime? value) =>
      setField<PostgresTime>('last_active_time', value);
}
