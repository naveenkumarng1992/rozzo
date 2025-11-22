import '../database.dart';

class ChallengeUserChallengeTable
    extends SupabaseTable<ChallengeUserChallengeRow> {
  @override
  String get tableName => 'challenge_user_challenge';

  @override
  ChallengeUserChallengeRow createRow(Map<String, dynamic> data) =>
      ChallengeUserChallengeRow(data);
}

class ChallengeUserChallengeRow extends SupabaseDataRow {
  ChallengeUserChallengeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChallengeUserChallengeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get challengeName => getField<String>('challenge_name');
  set challengeName(String? value) => setField<String>('challenge_name', value);

  int? get challengeType => getField<int>('challenge_type');
  set challengeType(int? value) => setField<int>('challenge_type', value);

  int? get challengeId => getField<int>('challenge_id');
  set challengeId(int? value) => setField<int>('challenge_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get progress => getField<int>('progress');
  set progress(int? value) => setField<int>('progress', value);

  int? get target => getField<int>('target');
  set target(int? value) => setField<int>('target', value);

  int? get challengeNumber => getField<int>('challenge_number');
  set challengeNumber(int? value) => setField<int>('challenge_number', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);
}
