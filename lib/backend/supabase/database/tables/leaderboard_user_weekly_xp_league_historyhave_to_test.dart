import '../database.dart';

class LeaderboardUserWeeklyXpLeagueHistoryhaveToTestTable
    extends SupabaseTable<LeaderboardUserWeeklyXpLeagueHistoryhaveToTestRow> {
  @override
  String get tableName =>
      'leaderboard_user_weekly_xp_league_history(have to test)';

  @override
  LeaderboardUserWeeklyXpLeagueHistoryhaveToTestRow createRow(
          Map<String, dynamic> data) =>
      LeaderboardUserWeeklyXpLeagueHistoryhaveToTestRow(data);
}

class LeaderboardUserWeeklyXpLeagueHistoryhaveToTestRow
    extends SupabaseDataRow {
  LeaderboardUserWeeklyXpLeagueHistoryhaveToTestRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table =>
      LeaderboardUserWeeklyXpLeagueHistoryhaveToTestTable();

  int get historyId => getField<int>('history_id')!;
  set historyId(int value) => setField<int>('history_id', value);

  DateTime get createdAtweekStartDate =>
      getField<DateTime>('created_at(week_start_date)')!;
  set createdAtweekStartDate(DateTime value) =>
      setField<DateTime>('created_at(week_start_date)', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get weekStartDate => getField<DateTime>('week_start_date');
  set weekStartDate(DateTime? value) =>
      setField<DateTime>('week_start_date', value);

  int? get weeklyXpInOldGroup => getField<int>('weekly_xp_in_old_group');
  set weeklyXpInOldGroup(int? value) =>
      setField<int>('weekly_xp_in_old_group', value);

  int? get oldGroupId => getField<int>('old_group_id');
  set oldGroupId(int? value) => setField<int>('old_group_id', value);

  int? get rankInTheOldGroup => getField<int>('rank_in_the_old_group');
  set rankInTheOldGroup(int? value) =>
      setField<int>('rank_in_the_old_group', value);

  int? get newGroupId => getField<int>('new_group_id');
  set newGroupId(int? value) => setField<int>('new_group_id', value);
}
