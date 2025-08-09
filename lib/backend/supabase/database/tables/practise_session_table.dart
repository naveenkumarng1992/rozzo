import '../database.dart';

class PractiseSessionTableTable extends SupabaseTable<PractiseSessionTableRow> {
  @override
  String get tableName => 'practise_session_table';

  @override
  PractiseSessionTableRow createRow(Map<String, dynamic> data) =>
      PractiseSessionTableRow(data);
}

class PractiseSessionTableRow extends SupabaseDataRow {
  PractiseSessionTableRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PractiseSessionTableTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get sessionDate => getField<DateTime>('session_date');
  set sessionDate(DateTime? value) => setField<DateTime>('session_date', value);

  int? get xpEarned => getField<int>('xp_earned');
  set xpEarned(int? value) => setField<int>('xp_earned', value);

  int? get questionsAnswered => getField<int>('questions_answered');
  set questionsAnswered(int? value) =>
      setField<int>('questions_answered', value);

  int? get correctAnswers => getField<int>('correct_answers');
  set correctAnswers(int? value) => setField<int>('correct_answers', value);
}
