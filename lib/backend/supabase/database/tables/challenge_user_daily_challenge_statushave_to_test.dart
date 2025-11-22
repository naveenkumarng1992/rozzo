import '../database.dart';

class ChallengeUserDailyChallengeStatushaveToTestTable
    extends SupabaseTable<ChallengeUserDailyChallengeStatushaveToTestRow> {
  @override
  String get tableName => 'challenge_user_daily_challenge_status(have to test)';

  @override
  ChallengeUserDailyChallengeStatushaveToTestRow createRow(
          Map<String, dynamic> data) =>
      ChallengeUserDailyChallengeStatushaveToTestRow(data);
}

class ChallengeUserDailyChallengeStatushaveToTestRow extends SupabaseDataRow {
  ChallengeUserDailyChallengeStatushaveToTestRow(Map<String, dynamic> data)
      : super(data);

  @override
  SupabaseTable get table => ChallengeUserDailyChallengeStatushaveToTestTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get challengeId => getField<String>('challenge_id');
  set challengeId(String? value) => setField<String>('challenge_id', value);

  int? get progress => getField<int>('progress');
  set progress(int? value) => setField<int>('progress', value);

  bool? get completed => getField<bool>('completed');
  set completed(bool? value) => setField<bool>('completed', value);
}
