import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProgressRecord extends FirestoreRecord {
  UserProgressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_reference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  // "completion_status" field.
  bool? _completionStatus;
  bool get completionStatus => _completionStatus ?? false;
  bool hasCompletionStatus() => _completionStatus != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "DocumentID" field.
  String? _documentID;
  String get documentID => _documentID ?? '';
  bool hasDocumentID() => _documentID != null;

  // "section_no" field.
  int? _sectionNo;
  int get sectionNo => _sectionNo ?? 0;
  bool hasSectionNo() => _sectionNo != null;

  // "unit_no" field.
  int? _unitNo;
  int get unitNo => _unitNo ?? 0;
  bool hasUnitNo() => _unitNo != null;

  // "level_no" field.
  int? _levelNo;
  int get levelNo => _levelNo ?? 0;
  bool hasLevelNo() => _levelNo != null;

  // "lesson_no" field.
  int? _lessonNo;
  int get lessonNo => _lessonNo ?? 0;
  bool hasLessonNo() => _lessonNo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userReference = snapshotData['user_reference'] as DocumentReference?;
    _completionStatus = snapshotData['completion_status'] as bool?;
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _documentID = snapshotData['DocumentID'] as String?;
    _sectionNo = castToType<int>(snapshotData['section_no']);
    _unitNo = castToType<int>(snapshotData['unit_no']);
    _levelNo = castToType<int>(snapshotData['level_no']);
    _lessonNo = castToType<int>(snapshotData['lesson_no']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_progress')
          : FirebaseFirestore.instance.collectionGroup('user_progress');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_progress').doc(id);

  static Stream<UserProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProgressRecord.fromSnapshot(s));

  static Future<UserProgressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProgressRecord.fromSnapshot(s));

  static UserProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProgressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProgressRecordData({
  DocumentReference? userReference,
  bool? completionStatus,
  DateTime? timeStamp,
  String? documentID,
  int? sectionNo,
  int? unitNo,
  int? levelNo,
  int? lessonNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_reference': userReference,
      'completion_status': completionStatus,
      'time_stamp': timeStamp,
      'DocumentID': documentID,
      'section_no': sectionNo,
      'unit_no': unitNo,
      'level_no': levelNo,
      'lesson_no': lessonNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserProgressRecordDocumentEquality
    implements Equality<UserProgressRecord> {
  const UserProgressRecordDocumentEquality();

  @override
  bool equals(UserProgressRecord? e1, UserProgressRecord? e2) {
    return e1?.userReference == e2?.userReference &&
        e1?.completionStatus == e2?.completionStatus &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.documentID == e2?.documentID &&
        e1?.sectionNo == e2?.sectionNo &&
        e1?.unitNo == e2?.unitNo &&
        e1?.levelNo == e2?.levelNo &&
        e1?.lessonNo == e2?.lessonNo;
  }

  @override
  int hash(UserProgressRecord? e) => const ListEquality().hash([
        e?.userReference,
        e?.completionStatus,
        e?.timeStamp,
        e?.documentID,
        e?.sectionNo,
        e?.unitNo,
        e?.levelNo,
        e?.lessonNo
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProgressRecord;
}
