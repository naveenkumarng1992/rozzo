import '../database.dart';

class ChooseSubcourseTable extends SupabaseTable<ChooseSubcourseRow> {
  @override
  String get tableName => 'choose_subcourse';

  @override
  ChooseSubcourseRow createRow(Map<String, dynamic> data) =>
      ChooseSubcourseRow(data);
}

class ChooseSubcourseRow extends SupabaseDataRow {
  ChooseSubcourseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChooseSubcourseTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get courseId => getField<String>('course_id');
  set courseId(String? value) => setField<String>('course_id', value);

  String? get subcourseId => getField<String>('subcourse_id');
  set subcourseId(String? value) => setField<String>('subcourse_id', value);

  String? get subcourseName => getField<String>('subcourse_name');
  set subcourseName(String? value) => setField<String>('subcourse_name', value);
}
