import '../database.dart';

class PushNotificationTemplateTable
    extends SupabaseTable<PushNotificationTemplateRow> {
  @override
  String get tableName => 'push_notification_template';

  @override
  PushNotificationTemplateRow createRow(Map<String, dynamic> data) =>
      PushNotificationTemplateRow(data);
}

class PushNotificationTemplateRow extends SupabaseDataRow {
  PushNotificationTemplateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PushNotificationTemplateTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get condition => getField<String>('condition');
  set condition(String? value) => setField<String>('condition', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get body => getField<String>('body');
  set body(String? value) => setField<String>('body', value);
}
