import '../database.dart';

class AnatomyLevelDetail1Table extends SupabaseTable<AnatomyLevelDetail1Row> {
  @override
  String get tableName => 'anatomy_level_detail1';

  @override
  AnatomyLevelDetail1Row createRow(Map<String, dynamic> data) =>
      AnatomyLevelDetail1Row(data);
}

class AnatomyLevelDetail1Row extends SupabaseDataRow {
  AnatomyLevelDetail1Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnatomyLevelDetail1Table();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get sectionNumber => getField<int>('section_number');
  set sectionNumber(int? value) => setField<int>('section_number', value);

  String? get subjectName => getField<String>('subject_name');
  set subjectName(String? value) => setField<String>('subject_name', value);

  int? get unitId => getField<int>('unit_id');
  set unitId(int? value) => setField<int>('unit_id', value);

  int? get unitNumber => getField<int>('unit_number');
  set unitNumber(int? value) => setField<int>('unit_number', value);

  String? get unitName => getField<String>('unit_name');
  set unitName(String? value) => setField<String>('unit_name', value);

  int? get levelNumber => getField<int>('level_number');
  set levelNumber(int? value) => setField<int>('level_number', value);

  String? get levelName => getField<String>('level_name');
  set levelName(String? value) => setField<String>('level_name', value);

  int? get leftPosition => getField<int>('left_position');
  set leftPosition(int? value) => setField<int>('left_position', value);

  String? get sectionName => getField<String>('section_name');
  set sectionName(String? value) => setField<String>('section_name', value);

  int? get rightPosition => getField<int>('right_position');
  set rightPosition(int? value) => setField<int>('right_position', value);
}
