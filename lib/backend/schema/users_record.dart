import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "college_name" field.
  String? _collegeName;
  String get collegeName => _collegeName ?? '';
  bool hasCollegeName() => _collegeName != null;

  // "year_of_study" field.
  String? _yearOfStudy;
  String get yearOfStudy => _yearOfStudy ?? '';
  bool hasYearOfStudy() => _yearOfStudy != null;

  // "total_xp" field.
  int? _totalXp;
  int get totalXp => _totalXp ?? 0;
  bool hasTotalXp() => _totalXp != null;

  // "total_gems" field.
  int? _totalGems;
  int get totalGems => _totalGems ?? 0;
  bool hasTotalGems() => _totalGems != null;

  // "total_hearts" field.
  int? _totalHearts;
  int get totalHearts => _totalHearts ?? 0;
  bool hasTotalHearts() => _totalHearts != null;

  // "current_streak" field.
  int? _currentStreak;
  int get currentStreak => _currentStreak ?? 0;
  bool hasCurrentStreak() => _currentStreak != null;

  // "current_section_no" field.
  int? _currentSectionNo;
  int get currentSectionNo => _currentSectionNo ?? 0;
  bool hasCurrentSectionNo() => _currentSectionNo != null;

  // "current_unit_no" field.
  int? _currentUnitNo;
  int get currentUnitNo => _currentUnitNo ?? 0;
  bool hasCurrentUnitNo() => _currentUnitNo != null;

  // "current_level_no" field.
  int? _currentLevelNo;
  int get currentLevelNo => _currentLevelNo ?? 0;
  bool hasCurrentLevelNo() => _currentLevelNo != null;

  // "current_lesson_no" field.
  int? _currentLessonNo;
  int get currentLessonNo => _currentLessonNo ?? 0;
  bool hasCurrentLessonNo() => _currentLessonNo != null;

  // "lastheartrefill" field.
  DateTime? _lastheartrefill;
  DateTime? get lastheartrefill => _lastheartrefill;
  bool hasLastheartrefill() => _lastheartrefill != null;

  // "last_active_date" field.
  DateTime? _lastActiveDate;
  DateTime? get lastActiveDate => _lastActiveDate;
  bool hasLastActiveDate() => _lastActiveDate != null;

  // "streak_freeze_available" field.
  bool? _streakFreezeAvailable;
  bool get streakFreezeAvailable => _streakFreezeAvailable ?? false;
  bool hasStreakFreezeAvailable() => _streakFreezeAvailable != null;

  // "streak_freeze_used" field.
  bool? _streakFreezeUsed;
  bool get streakFreezeUsed => _streakFreezeUsed ?? false;
  bool hasStreakFreezeUsed() => _streakFreezeUsed != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _name = snapshotData['name'] as String?;
    _country = snapshotData['country'] as String?;
    _state = snapshotData['state'] as String?;
    _collegeName = snapshotData['college_name'] as String?;
    _yearOfStudy = snapshotData['year_of_study'] as String?;
    _totalXp = castToType<int>(snapshotData['total_xp']);
    _totalGems = castToType<int>(snapshotData['total_gems']);
    _totalHearts = castToType<int>(snapshotData['total_hearts']);
    _currentStreak = castToType<int>(snapshotData['current_streak']);
    _currentSectionNo = castToType<int>(snapshotData['current_section_no']);
    _currentUnitNo = castToType<int>(snapshotData['current_unit_no']);
    _currentLevelNo = castToType<int>(snapshotData['current_level_no']);
    _currentLessonNo = castToType<int>(snapshotData['current_lesson_no']);
    _lastheartrefill = snapshotData['lastheartrefill'] as DateTime?;
    _lastActiveDate = snapshotData['last_active_date'] as DateTime?;
    _streakFreezeAvailable = snapshotData['streak_freeze_available'] as bool?;
    _streakFreezeUsed = snapshotData['streak_freeze_used'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  String? name,
  String? country,
  String? state,
  String? collegeName,
  String? yearOfStudy,
  int? totalXp,
  int? totalGems,
  int? totalHearts,
  int? currentStreak,
  int? currentSectionNo,
  int? currentUnitNo,
  int? currentLevelNo,
  int? currentLessonNo,
  DateTime? lastheartrefill,
  DateTime? lastActiveDate,
  bool? streakFreezeAvailable,
  bool? streakFreezeUsed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edited_time': editedTime,
      'bio': bio,
      'user_name': userName,
      'name': name,
      'country': country,
      'state': state,
      'college_name': collegeName,
      'year_of_study': yearOfStudy,
      'total_xp': totalXp,
      'total_gems': totalGems,
      'total_hearts': totalHearts,
      'current_streak': currentStreak,
      'current_section_no': currentSectionNo,
      'current_unit_no': currentUnitNo,
      'current_level_no': currentLevelNo,
      'current_lesson_no': currentLessonNo,
      'lastheartrefill': lastheartrefill,
      'last_active_date': lastActiveDate,
      'streak_freeze_available': streakFreezeAvailable,
      'streak_freeze_used': streakFreezeUsed,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        e1?.name == e2?.name &&
        e1?.country == e2?.country &&
        e1?.state == e2?.state &&
        e1?.collegeName == e2?.collegeName &&
        e1?.yearOfStudy == e2?.yearOfStudy &&
        e1?.totalXp == e2?.totalXp &&
        e1?.totalGems == e2?.totalGems &&
        e1?.totalHearts == e2?.totalHearts &&
        e1?.currentStreak == e2?.currentStreak &&
        e1?.currentSectionNo == e2?.currentSectionNo &&
        e1?.currentUnitNo == e2?.currentUnitNo &&
        e1?.currentLevelNo == e2?.currentLevelNo &&
        e1?.currentLessonNo == e2?.currentLessonNo &&
        e1?.lastheartrefill == e2?.lastheartrefill &&
        e1?.lastActiveDate == e2?.lastActiveDate &&
        e1?.streakFreezeAvailable == e2?.streakFreezeAvailable &&
        e1?.streakFreezeUsed == e2?.streakFreezeUsed;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.bio,
        e?.userName,
        e?.name,
        e?.country,
        e?.state,
        e?.collegeName,
        e?.yearOfStudy,
        e?.totalXp,
        e?.totalGems,
        e?.totalHearts,
        e?.currentStreak,
        e?.currentSectionNo,
        e?.currentUnitNo,
        e?.currentLevelNo,
        e?.currentLessonNo,
        e?.lastheartrefill,
        e?.lastActiveDate,
        e?.streakFreezeAvailable,
        e?.streakFreezeUsed
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
