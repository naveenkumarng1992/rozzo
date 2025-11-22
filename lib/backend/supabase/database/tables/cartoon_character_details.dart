import '../database.dart';

class CartoonCharacterDetailsTable
    extends SupabaseTable<CartoonCharacterDetailsRow> {
  @override
  String get tableName => 'cartoon_character_details';

  @override
  CartoonCharacterDetailsRow createRow(Map<String, dynamic> data) =>
      CartoonCharacterDetailsRow(data);
}

class CartoonCharacterDetailsRow extends SupabaseDataRow {
  CartoonCharacterDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CartoonCharacterDetailsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String get slug => getField<String>('slug')!;
  set slug(String value) => setField<String>('slug', value);
}
