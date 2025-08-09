import '../database.dart';

class LeaderboardUserRankInTheGroupTable
    extends SupabaseTable<LeaderboardUserRankInTheGroupRow> {
  @override
  String get tableName => 'leaderboard_user_rank_in_the_group';

  @override
  LeaderboardUserRankInTheGroupRow createRow(Map<String, dynamic> data) =>
      LeaderboardUserRankInTheGroupRow(data);
}

class LeaderboardUserRankInTheGroupRow extends SupabaseDataRow {
  LeaderboardUserRankInTheGroupRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeaderboardUserRankInTheGroupTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get leagueNumber => getField<int>('league_number');
  set leagueNumber(int? value) => setField<int>('league_number', value);

  int? get championshipNumber => getField<int>('championship_number');
  set championshipNumber(int? value) =>
      setField<int>('championship_number', value);

  int? get collegeId => getField<int>('college_id');
  set collegeId(int? value) => setField<int>('college_id', value);

  int? get stateId => getField<int>('state_id');
  set stateId(int? value) => setField<int>('state_id', value);

  int? get countryId => getField<int>('country_id');
  set countryId(int? value) => setField<int>('country_id', value);

  String? get groupId => getField<String>('group_id');
  set groupId(String? value) => setField<String>('group_id', value);

  int? get rankInGroup => getField<int>('rank_in_group');
  set rankInGroup(int? value) => setField<int>('rank_in_group', value);

  int? get weeklyXp => getField<int>('weekly_xp');
  set weeklyXp(int? value) => setField<int>('weekly_xp', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  int? get todaysXp => getField<int>('today\'s xp');
  set todaysXp(int? value) => setField<int>('today\'s xp', value);

  int? get todaysNumberOfLessonsCompleted =>
      getField<int>('today\'s number of lessons completed');
  set todaysNumberOfLessonsCompleted(int? value) =>
      setField<int>('today\'s number of lessons completed', value);

  String? get year => getField<String>('year');
  set year(String? value) => setField<String>('year', value);

  int? get batch => getField<int>('batch');
  set batch(int? value) => setField<int>('batch', value);

  bool? get isFrozen => getField<bool>('is_frozen');
  set isFrozen(bool? value) => setField<bool>('is_frozen', value);

  String? get profilePicture => getField<String>('profile_picture');
  set profilePicture(String? value) =>
      setField<String>('profile_picture', value);
}
