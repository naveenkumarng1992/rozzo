import '../database.dart';

class AnatomyQuestionDetailsTable
    extends SupabaseTable<AnatomyQuestionDetailsRow> {
  @override
  String get tableName => 'anatomy_question_details';

  @override
  AnatomyQuestionDetailsRow createRow(Map<String, dynamic> data) =>
      AnatomyQuestionDetailsRow(data);
}

class AnatomyQuestionDetailsRow extends SupabaseDataRow {
  AnatomyQuestionDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnatomyQuestionDetailsTable();

  int? get oldId => getField<int>('old_id');
  set oldId(int? value) => setField<int>('old_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

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

  String? get lessonName => getField<String>('lesson_name');
  set lessonName(String? value) => setField<String>('lesson_name', value);

  String? get topicsCovered => getField<String>('topics_covered');
  set topicsCovered(String? value) => setField<String>('topics_covered', value);

  int? get questionNumber => getField<int>('question_number');
  set questionNumber(int? value) => setField<int>('question_number', value);

  String? get theory => getField<String>('theory');
  set theory(String? value) => setField<String>('theory', value);

  String? get questionText => getField<String>('question_text');
  set questionText(String? value) => setField<String>('question_text', value);

  String? get optionA => getField<String>('option_A');
  set optionA(String? value) => setField<String>('option_A', value);

  String? get optionB => getField<String>('option_B');
  set optionB(String? value) => setField<String>('option_B', value);

  String? get optionC => getField<String>('option_C');
  set optionC(String? value) => setField<String>('option_C', value);

  String? get optionD => getField<String>('option_D');
  set optionD(String? value) => setField<String>('option_D', value);

  String? get correctOption => getField<String>('correct_option');
  set correctOption(String? value) => setField<String>('correct_option', value);

  String? get explanation => getField<String>('explanation');
  set explanation(String? value) => setField<String>('explanation', value);

  String? get image1Url => getField<String>('image1_url');
  set image1Url(String? value) => setField<String>('image1_url', value);

  String? get image2Url => getField<String>('image2_url');
  set image2Url(String? value) => setField<String>('image2_url', value);

  String? get image3Url => getField<String>('image3_url');
  set image3Url(String? value) => setField<String>('image3_url', value);

  String? get image4Url => getField<String>('image4_url');
  set image4Url(String? value) => setField<String>('image4_url', value);

  String? get image5Url => getField<String>('image5_url');
  set image5Url(String? value) => setField<String>('image5_url', value);

  int? get lessonNumber => getField<int>('lesson_number');
  set lessonNumber(int? value) => setField<int>('lesson_number', value);

  String get courseId => getField<String>('course_id')!;
  set courseId(String value) => setField<String>('course_id', value);

  String get subcourseId => getField<String>('subcourse_id')!;
  set subcourseId(String value) => setField<String>('subcourse_id', value);

  int? get year => getField<int>('year');
  set year(int? value) => setField<int>('year', value);

  String? get tags => getField<String>('tags');
  set tags(String? value) => setField<String>('tags', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get leftSpace => getField<int>('left_space');
  set leftSpace(int? value) => setField<int>('left_space', value);

  int? get rightSpace => getField<int>('right_space');
  set rightSpace(int? value) => setField<int>('right_space', value);

  String? get leftCartoonCharacterUrl =>
      getField<String>('left_cartoon_character_url');
  set leftCartoonCharacterUrl(String? value) =>
      setField<String>('left_cartoon_character_url', value);

  String? get rightCartoonCharacterUrl =>
      getField<String>('right_cartoon_character_url');
  set rightCartoonCharacterUrl(String? value) =>
      setField<String>('right_cartoon_character_url', value);
}
