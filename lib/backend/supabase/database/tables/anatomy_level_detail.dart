import '../database.dart';

class AnatomyLevelDetailTable extends SupabaseTable<AnatomyLevelDetailRow> {
  @override
  String get tableName => 'anatomy_level_detail';

  @override
  AnatomyLevelDetailRow createRow(Map<String, dynamic> data) =>
      AnatomyLevelDetailRow(data);
}

class AnatomyLevelDetailRow extends SupabaseDataRow {
  AnatomyLevelDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnatomyLevelDetailTable();

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

  int? get rightPosition => getField<int>('right_position');
  set rightPosition(int? value) => setField<int>('right_position', value);
}
