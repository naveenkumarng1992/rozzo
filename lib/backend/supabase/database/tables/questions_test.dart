import '../database.dart';

class QuestionsTestTable extends SupabaseTable<QuestionsTestRow> {
  @override
  String get tableName => 'questions_test';

  @override
  QuestionsTestRow createRow(Map<String, dynamic> data) =>
      QuestionsTestRow(data);
}

class QuestionsTestRow extends SupabaseDataRow {
  QuestionsTestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionsTestTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int get questionNumber => getField<int>('question_number')!;
  set questionNumber(int value) => setField<int>('question_number', value);

  String get questionText => getField<String>('question_text')!;
  set questionText(String value) => setField<String>('question_text', value);

  dynamic get options => getField<dynamic>('options')!;
  set options(dynamic value) => setField<dynamic>('options', value);

  dynamic get correctAnswer => getField<dynamic>('correct_answer')!;
  set correctAnswer(dynamic value) =>
      setField<dynamic>('correct_answer', value);

  String? get explanation => getField<String>('explanation');
  set explanation(String? value) => setField<String>('explanation', value);

  String get questionType => getField<String>('question_type')!;
  set questionType(String value) => setField<String>('question_type', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
