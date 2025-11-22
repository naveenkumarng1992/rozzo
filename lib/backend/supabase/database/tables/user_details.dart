import '../database.dart';

class UserDetailsTable extends SupabaseTable<UserDetailsRow> {
  @override
  String get tableName => 'user_details';

  @override
  UserDetailsRow createRow(Map<String, dynamic> data) => UserDetailsRow(data);
}

class UserDetailsRow extends SupabaseDataRow {
  UserDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserDetailsTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  int? get country => getField<int>('country');
  set country(int? value) => setField<int>('country', value);

  int? get state => getField<int>('state');
  set state(int? value) => setField<int>('state', value);

  int? get totalXp => getField<int>('total_xp');
  set totalXp(int? value) => setField<int>('total_xp', value);

  int? get weeklyXp => getField<int>('weekly_xp');
  set weeklyXp(int? value) => setField<int>('weekly_xp', value);

  int? get totalHearts => getField<int>('total_hearts');
  set totalHearts(int? value) => setField<int>('total_hearts', value);

  int? get currentSectionNo => getField<int>('current_section_no');
  set currentSectionNo(int? value) =>
      setField<int>('current_section_no', value);

  int? get currentUnitNo => getField<int>('current_unit_no');
  set currentUnitNo(int? value) => setField<int>('current_unit_no', value);

  int? get currentLevelNo => getField<int>('current_level_no');
  set currentLevelNo(int? value) => setField<int>('current_level_no', value);

  int? get currentLessonNo => getField<int>('current_lesson_no');
  set currentLessonNo(int? value) => setField<int>('current_lesson_no', value);

  int? get leagueId => getField<int>('league_id');
  set leagueId(int? value) => setField<int>('league_id', value);

  bool? get isInLeaderboard => getField<bool>('is_in_leaderboard');
  set isInLeaderboard(bool? value) =>
      setField<bool>('is_in_leaderboard', value);

  bool? get hasCompletedFirstLevel =>
      getField<bool>('has_completed_first_level');
  set hasCompletedFirstLevel(bool? value) =>
      setField<bool>('has_completed_first_level', value);

  int? get userScore => getField<int>('user_score');
  set userScore(int? value) => setField<int>('user_score', value);

  bool? get inactive => getField<bool>('inactive');
  set inactive(bool? value) => setField<bool>('inactive', value);

  int? get collegeId => getField<int>('college_id');
  set collegeId(int? value) => setField<int>('college_id', value);

  int? get championshipId => getField<int>('championship_id');
  set championshipId(int? value) => setField<int>('championship_id', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  bool? get leaderboardPaused => getField<bool>('leaderboard_paused');
  set leaderboardPaused(bool? value) =>
      setField<bool>('leaderboard_paused', value);

  bool? get isInGroup => getField<bool>('is_in_group');
  set isInGroup(bool? value) => setField<bool>('is_in_group', value);

  int? get gems => getField<int>('gems');
  set gems(int? value) => setField<int>('gems', value);

  String? get groupId => getField<String>('group_id');
  set groupId(String? value) => setField<String>('group_id', value);

  String? get batch => getField<String>('batch');
  set batch(String? value) => setField<String>('batch', value);

  String? get countryCode => getField<String>('country_code');
  set countryCode(String? value) => setField<String>('country_code', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  DateTime? get lastActiveAt => getField<DateTime>('last_active_at');
  set lastActiveAt(DateTime? value) =>
      setField<DateTime>('last_active_at', value);

  String? get profilePictureUrl => getField<String>('profile_picture_url');
  set profilePictureUrl(String? value) =>
      setField<String>('profile_picture_url', value);

  String get courseId => getField<String>('course_id')!;
  set courseId(String value) => setField<String>('course_id', value);

  String get subcourseId => getField<String>('subcourse_id')!;
  set subcourseId(String value) => setField<String>('subcourse_id', value);
}
