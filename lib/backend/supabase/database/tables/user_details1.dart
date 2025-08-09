import '../database.dart';

class UserDetails1Table extends SupabaseTable<UserDetails1Row> {
  @override
  String get tableName => 'user_details1';

  @override
  UserDetails1Row createRow(Map<String, dynamic> data) => UserDetails1Row(data);
}

class UserDetails1Row extends SupabaseDataRow {
  UserDetails1Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserDetails1Table();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  DateTime? get editedDate => getField<DateTime>('edited_date');
  set editedDate(DateTime? value) => setField<DateTime>('edited_date', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  int? get country => getField<int>('country');
  set country(int? value) => setField<int>('country', value);

  int? get state => getField<int>('state');
  set state(int? value) => setField<int>('state', value);

  int? get college => getField<int>('college');
  set college(int? value) => setField<int>('college', value);

  String? get yearOfStudy => getField<String>('year_of_study');
  set yearOfStudy(String? value) => setField<String>('year_of_study', value);

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

  int? get streakResetCount => getField<int>('streak_reset_count');
  set streakResetCount(int? value) =>
      setField<int>('streak_reset_count', value);

  int? get longestStreak => getField<int>('longest_streak');
  set longestStreak(int? value) => setField<int>('longest_streak', value);

  int? get currentStreak => getField<int>('current_streak');
  set currentStreak(int? value) => setField<int>('current_streak', value);

  int? get currentLeague => getField<int>('current_league');
  set currentLeague(int? value) => setField<int>('current_league', value);

  int? get top3Finishes => getField<int>('top_3_finishes');
  set top3Finishes(int? value) => setField<int>('top_3_finishes', value);

  int? get noOfLessonsCompletedThisWeek =>
      getField<int>('no_of_lessons_completed_this_week');
  set noOfLessonsCompletedThisWeek(int? value) =>
      setField<int>('no_of_lessons_completed_this_week', value);

  int? get totalLessonsCompleted => getField<int>('total_lessons_completed');
  set totalLessonsCompleted(int? value) =>
      setField<int>('total_lessons_completed', value);

  int? get mostXpInADay => getField<int>('most_xp_in_a_day');
  set mostXpInADay(int? value) => setField<int>('most_xp_in_a_day', value);

  int? get mostChallengesDay => getField<int>('most_challenges_day');
  set mostChallengesDay(int? value) =>
      setField<int>('most_challenges_day', value);

  String? get badgesEarned => getField<String>('badges_earned');
  set badgesEarned(String? value) => setField<String>('badges_earned', value);

  bool? get isInLeaderboard => getField<bool>('is_in_leaderboard');
  set isInLeaderboard(bool? value) =>
      setField<bool>('is_in_leaderboard', value);

  bool? get hasCompletedFirstLevel =>
      getField<bool>('has_completed_first_level');
  set hasCompletedFirstLevel(bool? value) =>
      setField<bool>('has_completed_first_level', value);

  int? get userScore => getField<int>('user_score');
  set userScore(int? value) => setField<int>('user_score', value);

  int? get sessionDurationThisWeek =>
      getField<int>('session_duration_this_week');
  set sessionDurationThisWeek(int? value) =>
      setField<int>('session_duration_this_week', value);

  bool? get streakFreeze => getField<bool>('streak_freeze');
  set streakFreeze(bool? value) => setField<bool>('streak_freeze', value);

  bool? get inactive => getField<bool>('inactive');
  set inactive(bool? value) => setField<bool>('inactive', value);

  int? get gems => getField<int>('gems');
  set gems(int? value) => setField<int>('gems', value);

  int? get collegeId => getField<int>('college_id');
  set collegeId(int? value) => setField<int>('college_id', value);

  int? get numberOfChallengesCompletedThisWeek =>
      getField<int>('number_of_challenges_completed_this_week');
  set numberOfChallengesCompletedThisWeek(int? value) =>
      setField<int>('number_of_challenges_completed_this_week', value);

  int? get leagueId => getField<int>('league_id');
  set leagueId(int? value) => setField<int>('league_id', value);

  int? get championshipId => getField<int>('championship_id');
  set championshipId(int? value) => setField<int>('championship_id', value);

  int? get groupId => getField<int>('group_id');
  set groupId(int? value) => setField<int>('group_id', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);

  bool? get leaderboardPaused => getField<bool>('leaderboard_paused');
  set leaderboardPaused(bool? value) =>
      setField<bool>('leaderboard_paused', value);

  bool? get isInGroup => getField<bool>('is_in_group');
  set isInGroup(bool? value) => setField<bool>('is_in_group', value);

  String? get batch => getField<String>('batch');
  set batch(String? value) => setField<String>('batch', value);

  String? get countryCode => getField<String>('country_code');
  set countryCode(String? value) => setField<String>('country_code', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  DateTime? get lastActiveAt => getField<DateTime>('last_active_at');
  set lastActiveAt(DateTime? value) =>
      setField<DateTime>('last_active_at', value);
}
