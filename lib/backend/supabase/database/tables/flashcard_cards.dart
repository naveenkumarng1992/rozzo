import '../database.dart';

class FlashcardCardsTable extends SupabaseTable<FlashcardCardsRow> {
  @override
  String get tableName => 'flashcard_cards';

  @override
  FlashcardCardsRow createRow(Map<String, dynamic> data) =>
      FlashcardCardsRow(data);
}

class FlashcardCardsRow extends SupabaseDataRow {
  FlashcardCardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FlashcardCardsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get deckId => getField<String>('deck_id');
  set deckId(String? value) => setField<String>('deck_id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String get prompt => getField<String>('prompt')!;
  set prompt(String value) => setField<String>('prompt', value);

  String get answer => getField<String>('answer')!;
  set answer(String value) => setField<String>('answer', value);

  String? get extra => getField<String>('extra');
  set extra(String? value) => setField<String>('extra', value);

  String? get mediaUrl => getField<String>('media_url');
  set mediaUrl(String? value) => setField<String>('media_url', value);

  List<String> get tags => getListField<String>('tags');
  set tags(List<String>? value) => setListField<String>('tags', value);

  int? get difficultyHint => getField<int>('difficulty_hint');
  set difficultyHint(int? value) => setField<int>('difficulty_hint', value);

  String? get clinicalDepth => getField<String>('clinical_depth');
  set clinicalDepth(String? value) => setField<String>('clinical_depth', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get deckName => getField<String>('deck_name');
  set deckName(String? value) => setField<String>('deck_name', value);

  String get subject => getField<String>('subject')!;
  set subject(String value) => setField<String>('subject', value);
}
