import '../database.dart';

class CollegeListTable extends SupabaseTable<CollegeListRow> {
  @override
  String get tableName => 'college_list';

  @override
  CollegeListRow createRow(Map<String, dynamic> data) => CollegeListRow(data);
}

class CollegeListRow extends SupabaseDataRow {
  CollegeListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CollegeListTable();

  int get collegeId => getField<int>('college_id')!;
  set collegeId(int value) => setField<int>('college_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get stateId => getField<int>('state_id');
  set stateId(int? value) => setField<int>('state_id', value);

  int? get stateNumber => getField<int>('state_number');
  set stateNumber(int? value) => setField<int>('state_number', value);

  int? get collegeNumber => getField<int>('college_number');
  set collegeNumber(int? value) => setField<int>('college_number', value);

  String? get collegeName => getField<String>('college_name');
  set collegeName(String? value) => setField<String>('college_name', value);
}
