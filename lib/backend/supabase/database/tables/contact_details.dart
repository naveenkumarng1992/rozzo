import '../database.dart';

class ContactDetailsTable extends SupabaseTable<ContactDetailsRow> {
  @override
  String get tableName => 'contact_details';

  @override
  ContactDetailsRow createRow(Map<String, dynamic> data) =>
      ContactDetailsRow(data);
}

class ContactDetailsRow extends SupabaseDataRow {
  ContactDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContactDetailsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get contactNumber => getField<String>('contact_number');
  set contactNumber(String? value) => setField<String>('contact_number', value);
}
