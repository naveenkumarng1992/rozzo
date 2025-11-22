import '../database.dart';

class SectionDetailTable extends SupabaseTable<SectionDetailRow> {
  @override
  String get tableName => 'section_detail';

  @override
  SectionDetailRow createRow(Map<String, dynamic> data) =>
      SectionDetailRow(data);
}

class SectionDetailRow extends SupabaseDataRow {
  SectionDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SectionDetailTable();

  int get sectionId => getField<int>('section_id')!;
  set sectionId(int value) => setField<int>('section_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get sectionNumber => getField<int>('Section_Number');
  set sectionNumber(int? value) => setField<int>('Section_Number', value);

  String? get sectionName => getField<String>('Section_Name');
  set sectionName(String? value) => setField<String>('Section_Name', value);

  int? get noOfUnits => getField<int>('No_of_Units');
  set noOfUnits(int? value) => setField<int>('No_of_Units', value);

  String? get imageURL => getField<String>('Image URL');
  set imageURL(String? value) => setField<String>('Image URL', value);

  String? get subjects => getField<String>('subjects');
  set subjects(String? value) => setField<String>('subjects', value);
}
