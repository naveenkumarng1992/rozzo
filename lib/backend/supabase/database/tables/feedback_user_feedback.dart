import '../database.dart';

class FeedbackUserFeedbackTable extends SupabaseTable<FeedbackUserFeedbackRow> {
  @override
  String get tableName => 'feedback_user_feedback';

  @override
  FeedbackUserFeedbackRow createRow(Map<String, dynamic> data) =>
      FeedbackUserFeedbackRow(data);
}

class FeedbackUserFeedbackRow extends SupabaseDataRow {
  FeedbackUserFeedbackRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedbackUserFeedbackTable();

  int get feedbackId => getField<int>('feedback_id')!;
  set feedbackId(int value) => setField<int>('feedback_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get feedbackType => getField<int>('feedback_type');
  set feedbackType(int? value) => setField<int>('feedback_type', value);

  String? get feedbackText => getField<String>('feedback_text');
  set feedbackText(String? value) => setField<String>('feedback_text', value);

  int? get questionNumber => getField<int>('question_number');
  set questionNumber(int? value) => setField<int>('question_number', value);

  int? get lessonNumber => getField<int>('lesson_number');
  set lessonNumber(int? value) => setField<int>('lesson_number', value);

  int? get levelNumber => getField<int>('level_number');
  set levelNumber(int? value) => setField<int>('level_number', value);

  int? get unitNumber => getField<int>('unit_number');
  set unitNumber(int? value) => setField<int>('unit_number', value);

  int? get sectionNumber => getField<int>('section_number');
  set sectionNumber(int? value) => setField<int>('section_number', value);
}
