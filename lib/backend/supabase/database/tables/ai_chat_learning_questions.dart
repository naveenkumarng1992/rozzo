import '../database.dart';

class AiChatLearningQuestionsTable
    extends SupabaseTable<AiChatLearningQuestionsRow> {
  @override
  String get tableName => 'ai_chat_learning_questions';

  @override
  AiChatLearningQuestionsRow createRow(Map<String, dynamic> data) =>
      AiChatLearningQuestionsRow(data);
}

class AiChatLearningQuestionsRow extends SupabaseDataRow {
  AiChatLearningQuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiChatLearningQuestionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get mode => getField<String>('mode')!;
  set mode(String value) => setField<String>('mode', value);

  String get topicName => getField<String>('topic_name')!;
  set topicName(String value) => setField<String>('topic_name', value);

  dynamic get questionData => getField<dynamic>('question_data')!;
  set questionData(dynamic value) => setField<dynamic>('question_data', value);

  String? get difficulty => getField<String>('difficulty');
  set difficulty(String? value) => setField<String>('difficulty', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get modelUsed => getField<String>('model_used');
  set modelUsed(String? value) => setField<String>('model_used', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get sessionId => getField<String>('session_id');
  set sessionId(String? value) => setField<String>('session_id', value);

  String? get generationId => getField<String>('generation_id');
  set generationId(String? value) => setField<String>('generation_id', value);

  bool get answered => getField<bool>('answered')!;
  set answered(bool value) => setField<bool>('answered', value);
}
