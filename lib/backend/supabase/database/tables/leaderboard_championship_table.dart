import '../database.dart';

class LeaderboardChampionshipTableTable
    extends SupabaseTable<LeaderboardChampionshipTableRow> {
  @override
  String get tableName => 'leaderboard_championship_table';

  @override
  LeaderboardChampionshipTableRow createRow(Map<String, dynamic> data) =>
      LeaderboardChampionshipTableRow(data);
}

class LeaderboardChampionshipTableRow extends SupabaseDataRow {
  LeaderboardChampionshipTableRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeaderboardChampionshipTableTable();

  int get championshipId => getField<int>('championship_id')!;
  set championshipId(int value) => setField<int>('championship_id', value);

  String get level => getField<String>('level')!;
  set level(String value) => setField<String>('level', value);

  String get nameOfTheChampionship =>
      getField<String>('name_of_the_championship')!;
  set nameOfTheChampionship(String value) =>
      setField<String>('name_of_the_championship', value);

  int get rank => getField<int>('rank')!;
  set rank(int value) => setField<int>('rank', value);
}
