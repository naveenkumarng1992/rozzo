import '../database.dart';

class NeetpgPyqTable extends SupabaseTable<NeetpgPyqRow> {
  @override
  String get tableName => 'neetpg_pyq';

  @override
  NeetpgPyqRow createRow(Map<String, dynamic> data) => NeetpgPyqRow(data);
}

class NeetpgPyqRow extends SupabaseDataRow {
  NeetpgPyqRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NeetpgPyqTable();

  int get oldId => getField<int>('old_id')!;
  set oldId(int value) => setField<int>('old_id', value);

  String? get year => getField<String>('year');
  set year(String? value) => setField<String>('year', value);

  int? get pdfQuestionNumber => getField<int>('pdf_question_number');
  set pdfQuestionNumber(int? value) =>
      setField<int>('pdf_question_number', value);

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

  int? get questionNumber => getField<int>('question_number');
  set questionNumber(int? value) => setField<int>('question_number', value);

  String? get questionText => getField<String>('question_text');
  set questionText(String? value) => setField<String>('question_text', value);

  String? get optionA => getField<String>('option_a');
  set optionA(String? value) => setField<String>('option_a', value);

  String? get optionB => getField<String>('option_b');
  set optionB(String? value) => setField<String>('option_b', value);

  String? get optionC => getField<String>('option_c');
  set optionC(String? value) => setField<String>('option_c', value);

  String? get optionD => getField<String>('option_d');
  set optionD(String? value) => setField<String>('option_d', value);

  String? get correctOption => getField<String>('correct_option');
  set correctOption(String? value) => setField<String>('correct_option', value);

  String? get explanation => getField<String>('explanation');
  set explanation(String? value) => setField<String>('explanation', value);

  String? get image1Url => getField<String>('image1_url');
  set image1Url(String? value) => setField<String>('image1_url', value);

  String? get image2Url => getField<String>('image2_url');
  set image2Url(String? value) => setField<String>('image2_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get leftDistance => getField<int>('left_distance');
  set leftDistance(int? value) => setField<int>('left_distance', value);

  int? get rightDistance => getField<int>('right_distance');
  set rightDistance(int? value) => setField<int>('right_distance', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get newId => getField<String>('new_id');
  set newId(String? value) => setField<String>('new_id', value);
}
