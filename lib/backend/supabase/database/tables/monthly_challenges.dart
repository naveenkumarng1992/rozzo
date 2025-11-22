import '../database.dart';

class MonthlyChallengesTable extends SupabaseTable<MonthlyChallengesRow> {
  @override
  String get tableName => 'monthly_challenges';

  @override
  MonthlyChallengesRow createRow(Map<String, dynamic> data) =>
      MonthlyChallengesRow(data);
}

class MonthlyChallengesRow extends SupabaseDataRow {
  MonthlyChallengesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MonthlyChallengesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nameOfTheMonth => getField<String>('name_of_the_month');
  set nameOfTheMonth(String? value) =>
      setField<String>('name_of_the_month', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  int? get numberOfChallengesToBeCompleted =>
      getField<int>('number_of_challenges_to_be_completed');
  set numberOfChallengesToBeCompleted(int? value) =>
      setField<int>('number_of_challenges_to_be_completed', value);
}
