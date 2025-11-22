import '../database.dart';

class FlashcardDecksTable extends SupabaseTable<FlashcardDecksRow> {
  @override
  String get tableName => 'flashcard_decks';

  @override
  FlashcardDecksRow createRow(Map<String, dynamic> data) =>
      FlashcardDecksRow(data);
}

class FlashcardDecksRow extends SupabaseDataRow {
  FlashcardDecksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FlashcardDecksTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get subject => getField<String>('subject')!;
  set subject(String value) => setField<String>('subject', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
