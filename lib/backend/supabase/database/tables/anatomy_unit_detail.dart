import '../database.dart';

class AnatomyUnitDetailTable extends SupabaseTable<AnatomyUnitDetailRow> {
  @override
  String get tableName => 'anatomy_unit_detail';

  @override
  AnatomyUnitDetailRow createRow(Map<String, dynamic> data) =>
      AnatomyUnitDetailRow(data);
}

class AnatomyUnitDetailRow extends SupabaseDataRow {
  AnatomyUnitDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnatomyUnitDetailTable();

  int get unitId => getField<int>('unit_id')!;
  set unitId(int value) => setField<int>('unit_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get unitNumber => getField<int>('Unit_Number');
  set unitNumber(int? value) => setField<int>('Unit_Number', value);

  String? get unitName => getField<String>('Unit_Name');
  set unitName(String? value) => setField<String>('Unit_Name', value);

  int? get noOfLevels => getField<int>('No_of_Levels');
  set noOfLevels(int? value) => setField<int>('No_of_Levels', value);

  int? get sectionId => getField<int>('section_id');
  set sectionId(int? value) => setField<int>('section_id', value);

  String? get leftCartoonCharacterUrl =>
      getField<String>('left cartoon character url');
  set leftCartoonCharacterUrl(String? value) =>
      setField<String>('left cartoon character url', value);

  String? get rightCartoonCharacterUrl =>
      getField<String>('right cartoon character url');
  set rightCartoonCharacterUrl(String? value) =>
      setField<String>('right cartoon character url', value);
}
