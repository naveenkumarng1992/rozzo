import '../database.dart';

class LeaderboardCollegeWeeklyRankTable
    extends SupabaseTable<LeaderboardCollegeWeeklyRankRow> {
  @override
  String get tableName => 'leaderboard_college_weekly_rank';

  @override
  LeaderboardCollegeWeeklyRankRow createRow(Map<String, dynamic> data) =>
      LeaderboardCollegeWeeklyRankRow(data);
}

class LeaderboardCollegeWeeklyRankRow extends SupabaseDataRow {
  LeaderboardCollegeWeeklyRankRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeaderboardCollegeWeeklyRankTable();

  int get collegeId => getField<int>('college_id')!;
  set collegeId(int value) => setField<int>('college_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get stateId => getField<int>('state_id');
  set stateId(int? value) => setField<int>('state_id', value);

  int? get stateNumber => getField<int>('state_number');
  set stateNumber(int? value) => setField<int>('state_number', value);

  int? get collegeNumber => getField<int>('college_number');
  set collegeNumber(int? value) => setField<int>('college_number', value);

  String? get collegeName => getField<String>('college_name');
  set collegeName(String? value) => setField<String>('college_name', value);

  int? get weeklyXp => getField<int>('weekly_xp');
  set weeklyXp(int? value) => setField<int>('weekly_xp', value);

  int? get collegeRank => getField<int>('college_rank');
  set collegeRank(int? value) => setField<int>('college_rank', value);
}
