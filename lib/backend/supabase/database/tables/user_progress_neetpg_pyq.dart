import '../database.dart';

class UserProgressNeetpgPyqTable
    extends SupabaseTable<UserProgressNeetpgPyqRow> {
  @override
  String get tableName => 'user_progress_neetpg_pyq';

  @override
  UserProgressNeetpgPyqRow createRow(Map<String, dynamic> data) =>
      UserProgressNeetpgPyqRow(data);
}

class UserProgressNeetpgPyqRow extends SupabaseDataRow {
  UserProgressNeetpgPyqRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserProgressNeetpgPyqTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get sectionNo => getField<int>('section_no');
  set sectionNo(int? value) => setField<int>('section_no', value);

  int? get unitNo => getField<int>('unit_no');
  set unitNo(int? value) => setField<int>('unit_no', value);

  int? get levelNo => getField<int>('level_no');
  set levelNo(int? value) => setField<int>('level_no', value);

  int? get lessonNo => getField<int>('lesson_no');
  set lessonNo(int? value) => setField<int>('lesson_no', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get activatedAt => getField<DateTime>('activated_at');
  set activatedAt(DateTime? value) => setField<DateTime>('activated_at', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);

  int? get accuracy => getField<int>('accuracy');
  set accuracy(int? value) => setField<int>('accuracy', value);

  String? get timeTaken => getField<String>('time_taken');
  set timeTaken(String? value) => setField<String>('time_taken', value);

  int? get xpEarned => getField<int>('xp_earned');
  set xpEarned(int? value) => setField<int>('xp_earned', value);

  int? get reviewNumber => getField<int>('review_number');
  set reviewNumber(int? value) => setField<int>('review_number', value);

  int? get subcourseId => getField<int>('subcourse_id');
  set subcourseId(int? value) => setField<int>('subcourse_id', value);
}
