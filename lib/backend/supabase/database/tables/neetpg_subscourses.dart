import '../database.dart';

class NeetpgSubscoursesTable extends SupabaseTable<NeetpgSubscoursesRow> {
  @override
  String get tableName => 'neetpg_subscourses';

  @override
  NeetpgSubscoursesRow createRow(Map<String, dynamic> data) =>
      NeetpgSubscoursesRow(data);
}

class NeetpgSubscoursesRow extends SupabaseDataRow {
  NeetpgSubscoursesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NeetpgSubscoursesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get subcourseId => getField<int>('subcourse_id');
  set subcourseId(int? value) => setField<int>('subcourse_id', value);

  String? get subcourseName => getField<String>('subcourse_name');
  set subcourseName(String? value) => setField<String>('subcourse_name', value);
}
