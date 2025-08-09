import '../database.dart';

class LeaderboardLeagueTableTable
    extends SupabaseTable<LeaderboardLeagueTableRow> {
  @override
  String get tableName => 'leaderboard_league_table';

  @override
  LeaderboardLeagueTableRow createRow(Map<String, dynamic> data) =>
      LeaderboardLeagueTableRow(data);
}

class LeaderboardLeagueTableRow extends SupabaseDataRow {
  LeaderboardLeagueTableRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeaderboardLeagueTableTable();

  int get leagueId => getField<int>('league_id')!;
  set leagueId(int value) => setField<int>('league_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get leagueNumber => getField<int>('league_number');
  set leagueNumber(int? value) => setField<int>('league_number', value);

  String? get nameOfTheLeague => getField<String>('name_of_the_league');
  set nameOfTheLeague(String? value) =>
      setField<String>('name_of_the_league', value);

  int? get championshipId => getField<int>('championship_id');
  set championshipId(int? value) => setField<int>('championship_id', value);

  int? get rank => getField<int>('rank');
  set rank(int? value) => setField<int>('rank', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);
}
