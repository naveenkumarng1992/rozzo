import '../database.dart';

class ChooseCourseTable extends SupabaseTable<ChooseCourseRow> {
  @override
  String get tableName => 'choose_course';

  @override
  ChooseCourseRow createRow(Map<String, dynamic> data) => ChooseCourseRow(data);
}

class ChooseCourseRow extends SupabaseDataRow {
  ChooseCourseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChooseCourseTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get courseId => getField<String>('course_id');
  set courseId(String? value) => setField<String>('course_id', value);

  String? get courseName => getField<String>('course_name');
  set courseName(String? value) => setField<String>('course_name', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get subcourseId => getField<String>('subcourse_id');
  set subcourseId(String? value) => setField<String>('subcourse_id', value);
}
