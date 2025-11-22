import '../database.dart';

class AiChatLearningSessionSummaryTable
    extends SupabaseTable<AiChatLearningSessionSummaryRow> {
  @override
  String get tableName => 'ai_chat_learning_session_summary';

  @override
  AiChatLearningSessionSummaryRow createRow(Map<String, dynamic> data) =>
      AiChatLearningSessionSummaryRow(data);
}

class AiChatLearningSessionSummaryRow extends SupabaseDataRow {
  AiChatLearningSessionSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiChatLearningSessionSummaryTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get mode => getField<String>('mode')!;
  set mode(String value) => setField<String>('mode', value);

  String get topicName => getField<String>('topic_name')!;
  set topicName(String value) => setField<String>('topic_name', value);

  int get totalQuestions => getField<int>('total_questions')!;
  set totalQuestions(int value) => setField<int>('total_questions', value);

  int get correctAnswers => getField<int>('correct_answers')!;
  set correctAnswers(int value) => setField<int>('correct_answers', value);

  double get accuracy => getField<double>('accuracy')!;
  set accuracy(double value) => setField<double>('accuracy', value);

  List<String> get weakTopics => getListField<String>('weak_topics');
  set weakTopics(List<String>? value) =>
      setListField<String>('weak_topics', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
