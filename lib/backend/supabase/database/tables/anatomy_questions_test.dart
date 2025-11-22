import '../database.dart';

class AnatomyQuestionsTestTable extends SupabaseTable<AnatomyQuestionsTestRow> {
  @override
  String get tableName => 'anatomy_questions_test';

  @override
  AnatomyQuestionsTestRow createRow(Map<String, dynamic> data) =>
      AnatomyQuestionsTestRow(data);
}

class AnatomyQuestionsTestRow extends SupabaseDataRow {
  AnatomyQuestionsTestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnatomyQuestionsTestTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get courseId => getField<String>('course_id');
  set courseId(String? value) => setField<String>('course_id', value);

  String get subcourseId => getField<String>('subcourse_id')!;
  set subcourseId(String value) => setField<String>('subcourse_id', value);

  int? get year => getField<int>('year');
  set year(int? value) => setField<int>('year', value);

  int? get sectionNumber => getField<int>('section_number');
  set sectionNumber(int? value) => setField<int>('section_number', value);

  String? get sectionName => getField<String>('section_name');
  set sectionName(String? value) => setField<String>('section_name', value);

  int? get unitNumber => getField<int>('unit_number');
  set unitNumber(int? value) => setField<int>('unit_number', value);

  String? get unitName => getField<String>('unit_name');
  set unitName(String? value) => setField<String>('unit_name', value);

  int? get levelNumber => getField<int>('level_number');
  set levelNumber(int? value) => setField<int>('level_number', value);

  String? get levelName => getField<String>('level_name');
  set levelName(String? value) => setField<String>('level_name', value);

  int? get lessonNumber => getField<int>('lesson_number');
  set lessonNumber(int? value) => setField<int>('lesson_number', value);

  String? get lessonName => getField<String>('lesson_name');
  set lessonName(String? value) => setField<String>('lesson_name', value);

  int get questionNumber => getField<int>('question_number')!;
  set questionNumber(int value) => setField<int>('question_number', value);

  String get questionText => getField<String>('question_text')!;
  set questionText(String value) => setField<String>('question_text', value);

  String? get theory => getField<String>('theory');
  set theory(String? value) => setField<String>('theory', value);

  dynamic? get options => getField<dynamic>('options');
  set options(dynamic? value) => setField<dynamic>('options', value);

  dynamic? get correctAnswer => getField<dynamic>('correct_answer');
  set correctAnswer(dynamic? value) =>
      setField<dynamic>('correct_answer', value);

  String? get explanation => getField<String>('explanation');
  set explanation(String? value) => setField<String>('explanation', value);

  String? get questionType => getField<String>('question_type');
  set questionType(String? value) => setField<String>('question_type', value);

  String? get subjectName => getField<String>('subject_name');
  set subjectName(String? value) => setField<String>('subject_name', value);

  String? get subjectId => getField<String>('subject_id');
  set subjectId(String? value) => setField<String>('subject_id', value);

  String? get topicName => getField<String>('topic_name');
  set topicName(String? value) => setField<String>('topic_name', value);

  String? get topicId => getField<String>('topic_id');
  set topicId(String? value) => setField<String>('topic_id', value);

  String? get conceptName => getField<String>('concept_name');
  set conceptName(String? value) => setField<String>('concept_name', value);

  String? get conceptId => getField<String>('concept_id');
  set conceptId(String? value) => setField<String>('concept_id', value);

  dynamic? get hints => getField<dynamic>('hints');
  set hints(dynamic? value) => setField<dynamic>('hints', value);

  int? get homeIconLeftSpace => getField<int>('home_icon_left_space');
  set homeIconLeftSpace(int? value) =>
      setField<int>('home_icon_left_space', value);

  int? get homeIconRightSpace => getField<int>('home_icon_right_space');
  set homeIconRightSpace(int? value) =>
      setField<int>('home_icon_right_space', value);

  String? get leftCartoonCharacterUrl =>
      getField<String>('left_cartoon_character_url');
  set leftCartoonCharacterUrl(String? value) =>
      setField<String>('left_cartoon_character_url', value);

  String? get rightCartoonCharacterUrl =>
      getField<String>('right_cartoon_character_url');
  set rightCartoonCharacterUrl(String? value) =>
      setField<String>('right_cartoon_character_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get speaker => getField<String>('speaker');
  set speaker(String? value) => setField<String>('speaker', value);

  String? get characterName => getField<String>('character_name');
  set characterName(String? value) => setField<String>('character_name', value);

  int get difficultyLevel => getField<int>('difficulty_level')!;
  set difficultyLevel(int value) => setField<int>('difficulty_level', value);

  String? get characterImage => getField<String>('character_image');
  set characterImage(String? value) =>
      setField<String>('character_image', value);
}
