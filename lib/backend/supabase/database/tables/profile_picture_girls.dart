import '../database.dart';

class ProfilePictureGirlsTable extends SupabaseTable<ProfilePictureGirlsRow> {
  @override
  String get tableName => 'profile_picture_girls';

  @override
  ProfilePictureGirlsRow createRow(Map<String, dynamic> data) =>
      ProfilePictureGirlsRow(data);
}

class ProfilePictureGirlsRow extends SupabaseDataRow {
  ProfilePictureGirlsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilePictureGirlsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get profileImageGirls => getField<String>('profile_image_girls');
  set profileImageGirls(String? value) =>
      setField<String>('profile_image_girls', value);
}
