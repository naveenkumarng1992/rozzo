import '../database.dart';

class FeedbackTable extends SupabaseTable<FeedbackRow> {
  @override
  String get tableName => 'feedback';

  @override
  FeedbackRow createRow(Map<String, dynamic> data) => FeedbackRow(data);
}

class FeedbackRow extends SupabaseDataRow {
  FeedbackRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeedbackTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get feedback => getField<String>('feedback');
  set feedback(String? value) => setField<String>('feedback', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get lessonId => getField<String>('lesson_id');
  set lessonId(String? value) => setField<String>('lesson_id', value);
}
