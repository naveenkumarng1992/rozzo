import '../database.dart';

class StateListTable extends SupabaseTable<StateListRow> {
  @override
  String get tableName => 'state_list';

  @override
  StateListRow createRow(Map<String, dynamic> data) => StateListRow(data);
}

class StateListRow extends SupabaseDataRow {
  StateListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StateListTable();

  int get stateId => getField<int>('state_id')!;
  set stateId(int value) => setField<int>('state_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get countryId => getField<int>('country_id');
  set countryId(int? value) => setField<int>('country_id', value);

  String? get nameOfTheState => getField<String>('name_of_the_state');
  set nameOfTheState(String? value) =>
      setField<String>('name_of_the_state', value);

  int? get stateNumber => getField<int>('state_number');
  set stateNumber(int? value) => setField<int>('state_number', value);
}
