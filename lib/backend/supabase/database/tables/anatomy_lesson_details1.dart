import '../database.dart';

class AnatomyLessonDetails1Table
    extends SupabaseTable<AnatomyLessonDetails1Row> {
  @override
  String get tableName => 'anatomy_lesson_details1';

  @override
  AnatomyLessonDetails1Row createRow(Map<String, dynamic> data) =>
      AnatomyLessonDetails1Row(data);
}

class AnatomyLessonDetails1Row extends SupabaseDataRow {
  AnatomyLessonDetails1Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnatomyLessonDetails1Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get sectionNumber => getField<int>('section_number');
  set sectionNumber(int? value) => setField<int>('section_number', value);

  String? get sectionName => getField<String>('section_name');
  set sectionName(String? value) => setField<String>('section_name', value);

  String? get subjectName => getField<String>('subject_name');
  set subjectName(String? value) => setField<String>('subject_name', value);

  int? get unitNumber => getField<int>('unit_number');
  set unitNumber(int? value) => setField<int>('unit_number', value);

  String? get unitName => getField<String>('unit_name');
  set unitName(String? value) => setField<String>('unit_name', value);

  int? get levelNumber => getField<int>('level_number');
  set levelNumber(int? value) => setField<int>('level_number', value);

  String? get levelName => getField<String>('level_name');
  set levelName(String? value) => setField<String>('level_name', value);

  int? get lessonNumber => getField<int>('lesson_number');
  set lessonNumber(int? value) => setField<int>('lesson_number', value);

  String? get lessonName => getField<String>('lesson_name');
  set lessonName(String? value) => setField<String>('lesson_name', value);

  int? get xpPoints => getField<int>('xp_points');
  set xpPoints(int? value) => setField<int>('xp_points', value);
}
