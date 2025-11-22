import '../database.dart';

class AiChatLearningUserAttemptsTable
    extends SupabaseTable<AiChatLearningUserAttemptsRow> {
  @override
  String get tableName => 'ai_chat_learning_user_attempts';

  @override
  AiChatLearningUserAttemptsRow createRow(Map<String, dynamic> data) =>
      AiChatLearningUserAttemptsRow(data);
}

class AiChatLearningUserAttemptsRow extends SupabaseDataRow {
  AiChatLearningUserAttemptsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiChatLearningUserAttemptsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  String get questionId => getField<String>('question_id')!;
  set questionId(String value) => setField<String>('question_id', value);

  String get mode => getField<String>('mode')!;
  set mode(String value) => setField<String>('mode', value);

  String get userAnswer => getField<String>('user_answer')!;
  set userAnswer(String value) => setField<String>('user_answer', value);

  bool? get isCorrect => getField<bool>('is_correct');
  set isCorrect(bool? value) => setField<bool>('is_correct', value);

  int? get timeTakenSeconds => getField<int>('time_taken_seconds');
  set timeTakenSeconds(int? value) =>
      setField<int>('time_taken_seconds', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get stepIndex => getField<int>('step_index');
  set stepIndex(int? value) => setField<int>('step_index', value);

  String? get generationId => getField<String>('generation_id');
  set generationId(String? value) => setField<String>('generation_id', value);
}
