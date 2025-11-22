import '../database.dart';

class ChallengeDailyChallengeTable
    extends SupabaseTable<ChallengeDailyChallengeRow> {
  @override
  String get tableName => 'challenge_daily_challenge';

  @override
  ChallengeDailyChallengeRow createRow(Map<String, dynamic> data) =>
      ChallengeDailyChallengeRow(data);
}

class ChallengeDailyChallengeRow extends SupabaseDataRow {
  ChallengeDailyChallengeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChallengeDailyChallengeTable();

  int get challengeId => getField<int>('challenge_id')!;
  set challengeId(int value) => setField<int>('challenge_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get challengeTypeDescription =>
      getField<String>('challenge_type_description');
  set challengeTypeDescription(String? value) =>
      setField<String>('challenge_type_description', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int get target => getField<int>('target')!;
  set target(int value) => setField<int>('target', value);

  int? get xpReward => getField<int>('xp_reward');
  set xpReward(int? value) => setField<int>('xp_reward', value);

  DateTime? get validFrom => getField<DateTime>('valid_from');
  set validFrom(DateTime? value) => setField<DateTime>('valid_from', value);

  String? get challengeName => getField<String>('challenge_name');
  set challengeName(String? value) => setField<String>('challenge_name', value);

  DateTime? get validUntil => getField<DateTime>('valid_until');
  set validUntil(DateTime? value) => setField<DateTime>('valid_until', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  int? get gemsReward => getField<int>('gems_reward');
  set gemsReward(int? value) => setField<int>('gems_reward', value);

  int? get challengeNumber => getField<int>('challenge_number');
  set challengeNumber(int? value) => setField<int>('challenge_number', value);

  int? get challengeType => getField<int>('challenge_type');
  set challengeType(int? value) => setField<int>('challenge_type', value);
}
