import '../database.dart';

class ProfilePictureBoysTable extends SupabaseTable<ProfilePictureBoysRow> {
  @override
  String get tableName => 'profile_picture_boys';

  @override
  ProfilePictureBoysRow createRow(Map<String, dynamic> data) =>
      ProfilePictureBoysRow(data);
}

class ProfilePictureBoysRow extends SupabaseDataRow {
  ProfilePictureBoysRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilePictureBoysTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get profileImageBoys => getField<String>('profile_image_boys');
  set profileImageBoys(String? value) =>
      setField<String>('profile_image_boys', value);
}
