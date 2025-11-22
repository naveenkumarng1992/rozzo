import '../database.dart';

class CountryListTable extends SupabaseTable<CountryListRow> {
  @override
  String get tableName => 'country_list';

  @override
  CountryListRow createRow(Map<String, dynamic> data) => CountryListRow(data);
}

class CountryListRow extends SupabaseDataRow {
  CountryListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountryListTable();

  int get countryId => getField<int>('country_id')!;
  set countryId(int value) => setField<int>('country_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameOfTheCountry => getField<String>('name_of_the _country');
  set nameOfTheCountry(String? value) =>
      setField<String>('name_of_the _country', value);

  String? get countryCode => getField<String>('country_code');
  set countryCode(String? value) => setField<String>('country_code', value);
}
