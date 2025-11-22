import '../database.dart';

class AnatomyQuestionsTopicsTable
    extends SupabaseTable<AnatomyQuestionsTopicsRow> {
  @override
  String get tableName => 'anatomy_questions_topics';

  @override
  AnatomyQuestionsTopicsRow createRow(Map<String, dynamic> data) =>
      AnatomyQuestionsTopicsRow(data);
}

class AnatomyQuestionsTopicsRow extends SupabaseDataRow {
  AnatomyQuestionsTopicsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnatomyQuestionsTopicsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get slug => getField<String>('slug');
  set slug(String? value) => setField<String>('slug', value);

  String? get subject => getField<String>('subject');
  set subject(String? value) => setField<String>('subject', value);

  String? get parentId => getField<String>('parent_id');
  set parentId(String? value) => setField<String>('parent_id', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
