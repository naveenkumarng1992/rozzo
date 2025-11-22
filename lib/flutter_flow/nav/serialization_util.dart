import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import '/backend/backend.dart';

import '/backend/supabase/supabase.dart';

import '../../flutter_flow/lat_lng.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String dateTimeRangeToString(DateTimeRange dateTimeRange) {
  final startStr = dateTimeRange.start.millisecondsSinceEpoch.toString();
  final endStr = dateTimeRange.end.millisecondsSinceEpoch.toString();
  return '$startStr|$endStr';
}

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

const _kDocIdDelimeter = '|';
String _serializeDocumentReference(DocumentReference ref) {
  final docIds = <String>[];
  DocumentReference? currentRef = ref;
  while (currentRef != null) {
    docIds.add(currentRef.id);
    // Get the parent document (catching any errors that arise).
    currentRef = safeGet<DocumentReference?>(() => currentRef?.parent.parent);
  }
  // Reverse the list to get the correct ordering.
  return docIds.reversed.join(_kDocIdDelimeter);
}

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final serializedValues = (param as Iterable)
          .map((p) => serializeParam(p, paramType, isList: false))
          .where((p) => p != null)
          .map((p) => p!)
          .toList();
      return json.encode(serializedValues);
    }
    String? data;
    switch (paramType) {
      case ParamType.int:
        data = param.toString();
      case ParamType.double:
        data = param.toString();
      case ParamType.String:
        data = param;
      case ParamType.bool:
        data = param ? 'true' : 'false';
      case ParamType.DateTime:
        data = (param as DateTime).millisecondsSinceEpoch.toString();
      case ParamType.DateTimeRange:
        data = dateTimeRangeToString(param as DateTimeRange);
      case ParamType.LatLng:
        data = (param as LatLng).serialize();
      case ParamType.Color:
        data = (param as Color).toCssString();
      case ParamType.FFPlace:
        data = placeToString(param as FFPlace);
      case ParamType.FFUploadedFile:
        data = uploadedFileToString(param as FFUploadedFile);
      case ParamType.JSON:
        data = json.encode(param);
      case ParamType.DocumentReference:
        data = _serializeDocumentReference(param as DocumentReference);
      case ParamType.Document:
        final reference = (param as FirestoreRecord).reference;
        data = _serializeDocumentReference(reference);

      case ParamType.SupabaseRow:
        return json.encode((param as SupabaseDataRow).data);

      default:
        data = null;
    }
    return data;
  } catch (e) {
    print('Error serializing parameter: $e');
    return null;
  }
}

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
  final pieces = dateTimeRangeStr.split('|');
  if (pieces.length != 2) {
    return null;
  }
  return DateTimeRange(
    start: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.first)),
    end: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.last)),
  );
}

LatLng? latLngFromString(String? latLngStr) {
  final pieces = latLngStr?.split(',');
  if (pieces == null || pieces.length != 2) {
    return null;
  }
  return LatLng(
    double.parse(pieces.first.trim()),
    double.parse(pieces.last.trim()),
  );
}

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  final data = {
    'latLng': serializedData.containsKey('latLng')
        ? latLngFromString(serializedData['latLng'] as String)
        : const LatLng(0.0, 0.0),
    'name': serializedData['name'] ?? '',
    'address': serializedData['address'] ?? '',
    'city': serializedData['city'] ?? '',
    'state': serializedData['state'] ?? '',
    'country': serializedData['country'] ?? '',
    'zipCode': serializedData['zipCode'] ?? '',
  };
  return FFPlace(
    latLng: data['latLng'] as LatLng,
    name: data['name'] as String,
    address: data['address'] as String,
    city: data['city'] as String,
    state: data['state'] as String,
    country: data['country'] as String,
    zipCode: data['zipCode'] as String,
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

DocumentReference _deserializeDocumentReference(
  String refStr,
  List<String> collectionNamePath,
) {
  var path = '';
  final docIds = refStr.split(_kDocIdDelimeter);
  for (int i = 0; i < docIds.length && i < collectionNamePath.length; i++) {
    path += '/${collectionNamePath[i]}/${docIds[i]}';
  }
  return FirebaseFirestore.instance.doc(path);
}

enum ParamType {
  int,
  double,
  String,
  bool,
  DateTime,
  DateTimeRange,
  LatLng,
  Color,
  FFPlace,
  FFUploadedFile,
  JSON,

  Document,
  DocumentReference,
  SupabaseRow,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  List<String>? collectionNamePath,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final paramValues = json.decode(param);
      if (paramValues is! Iterable || paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p is String)
          .map((p) => p as String)
          .map((p) => deserializeParam<T>(p, paramType, false,
              collectionNamePath: collectionNamePath))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }
    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        final milliseconds = int.tryParse(param);
        return milliseconds != null
            ? DateTime.fromMillisecondsSinceEpoch(milliseconds)
            : null;
      case ParamType.DateTimeRange:
        return dateTimeRangeFromString(param);
      case ParamType.LatLng:
        return latLngFromString(param);
      case ParamType.Color:
        return fromCssColor(param);
      case ParamType.FFPlace:
        return placeFromString(param);
      case ParamType.FFUploadedFile:
        return uploadedFileFromString(param);
      case ParamType.JSON:
        return json.decode(param);
      case ParamType.DocumentReference:
        return _deserializeDocumentReference(param, collectionNamePath ?? []);

      case ParamType.SupabaseRow:
        final data = json.decode(param) as Map<String, dynamic>;
        switch (T) {
          case UserProgressNeetpgPyqRow:
            return UserProgressNeetpgPyqRow(data);
          case AnatomyQuestionsTopicsRow:
            return AnatomyQuestionsTopicsRow(data);
          case StateListRow:
            return StateListRow(data);
          case UserSettingsRow:
            return UserSettingsRow(data);
          case AnatomyLevelDetailRow:
            return AnatomyLevelDetailRow(data);
          case NeetpgSubscoursesRow:
            return NeetpgSubscoursesRow(data);
          case SectionDetailRow:
            return SectionDetailRow(data);
          case ContactDetailsRow:
            return ContactDetailsRow(data);
          case AnatomyQuestionsTestRow:
            return AnatomyQuestionsTestRow(data);
          case ChooseSubcourseRow:
            return ChooseSubcourseRow(data);
          case AiChatLearningSessionSummaryRow:
            return AiChatLearningSessionSummaryRow(data);
          case CartoonCharacterDetailsRow:
            return CartoonCharacterDetailsRow(data);
          case ChatMessagesRow:
            return ChatMessagesRow(data);
          case PushNotificationFcmTokensRow:
            return PushNotificationFcmTokensRow(data);
          case PushNotificationUserNotificationsRow:
            return PushNotificationUserNotificationsRow(data);
          case PushNotificationUserNotificationsDemotionAlertRow:
            return PushNotificationUserNotificationsDemotionAlertRow(data);
          case PushNotificationTemplateRow:
            return PushNotificationTemplateRow(data);
          case ChallengeUserDailyChallengeStatushaveToTestRow:
            return ChallengeUserDailyChallengeStatushaveToTestRow(data);
          case ProfilesRow:
            return ProfilesRow(data);
          case CollegeListRow:
            return CollegeListRow(data);
          case FlashcardDecksRow:
            return FlashcardDecksRow(data);
          case FeedbackUserFeedbackRow:
            return FeedbackUserFeedbackRow(data);
          case AnatomyLessonDetails1Row:
            return AnatomyLessonDetails1Row(data);
          case QuestionsTestRow:
            return QuestionsTestRow(data);
          case AnatomyQuestionDetails2Row:
            return AnatomyQuestionDetails2Row(data);
          case PushNotificationUserNotificationsTotalHeartsRow:
            return PushNotificationUserNotificationsTotalHeartsRow(data);
          case AnatomyQuestionDetailsRow:
            return AnatomyQuestionDetailsRow(data);
          case AnatomyQuestionDetails3Row:
            return AnatomyQuestionDetails3Row(data);
          case SessionLogRow:
            return SessionLogRow(data);
          case MonthlyChallengesRow:
            return MonthlyChallengesRow(data);
          case NeetpgPyqRow:
            return NeetpgPyqRow(data);
          case AnatomyQuestionDetails1Row:
            return AnatomyQuestionDetails1Row(data);
          case UserRewardRow:
            return UserRewardRow(data);
          case AiChatLearningUserAttemptsRow:
            return AiChatLearningUserAttemptsRow(data);
          case AnatomyUnitDetailRow:
            return AnatomyUnitDetailRow(data);
          case ChallengeUserChallengeRow:
            return ChallengeUserChallengeRow(data);
          case AiChatModesRow:
            return AiChatModesRow(data);
          case FeedbackRow:
            return FeedbackRow(data);
          case ProfilePictureGirlsRow:
            return ProfilePictureGirlsRow(data);
          case StreakUserStreakRow:
            return StreakUserStreakRow(data);
          case LeaderboardUserWeeklyXpLeagueHistoryhaveToTestRow:
            return LeaderboardUserWeeklyXpLeagueHistoryhaveToTestRow(data);
          case LeaderboardCollegeWeeklyRankRow:
            return LeaderboardCollegeWeeklyRankRow(data);
          case PractiseSessionTableRow:
            return PractiseSessionTableRow(data);
          case UserDetailsRow:
            return UserDetailsRow(data);
          case PushNotificationUserNotificationUserLeaderboardRow:
            return PushNotificationUserNotificationUserLeaderboardRow(data);
          case ChatSessionsRow:
            return ChatSessionsRow(data);
          case ProfilePictureBoysRow:
            return ProfilePictureBoysRow(data);
          case LeaderboardUserRankInTheGroupRow:
            return LeaderboardUserRankInTheGroupRow(data);
          case LeaderboardLeagueTableRow:
            return LeaderboardLeagueTableRow(data);
          case UserProgressRow:
            return UserProgressRow(data);
          case ChooseCourseRow:
            return ChooseCourseRow(data);
          case AnatomyLessonDetailsRow:
            return AnatomyLessonDetailsRow(data);
          case UserDetails1Row:
            return UserDetails1Row(data);
          case ChallengeDailyChallengeRow:
            return ChallengeDailyChallengeRow(data);
          case LeaderboardChampionshipTableRow:
            return LeaderboardChampionshipTableRow(data);
          case AiChatLearningQuestionsRow:
            return AiChatLearningQuestionsRow(data);
          case FlashcardCardsRow:
            return FlashcardCardsRow(data);
          case UserAchievementRow:
            return UserAchievementRow(data);
          case CountryListRow:
            return CountryListRow(data);
          case PushNotificationUserNotificationCollegeLeaderboardRow:
            return PushNotificationUserNotificationCollegeLeaderboardRow(data);
          case AnatomyLevelDetail1Row:
            return AnatomyLevelDetail1Row(data);
          case NotificationsRow:
            return NotificationsRow(data);
          case LoginLogRow:
            return LoginLogRow(data);
          default:
            return null;
        }

      default:
        return null;
    }
  } catch (e) {
    print('Error deserializing parameter: $e');
    return null;
  }
}

Future<dynamic> Function(String) getDoc(
  List<String> collectionNamePath,
  RecordBuilder recordBuilder,
) {
  return (String ids) => _deserializeDocumentReference(ids, collectionNamePath)
      .get()
      .then((s) => recordBuilder(s));
}

Future<List<T>> Function(String) getDocList<T>(
  List<String> collectionNamePath,
  RecordBuilder<T> recordBuilder,
) {
  return (String idsList) {
    List<String> docIds = [];
    try {
      final ids = json.decode(idsList) as Iterable;
      docIds = ids.where((d) => d is String).map((d) => d as String).toList();
    } catch (_) {}
    return Future.wait(
      docIds.map(
        (ids) => _deserializeDocumentReference(ids, collectionNamePath)
            .get()
            .then((s) => recordBuilder(s)),
      ),
    ).then((docs) => docs.where((d) => d != null).map((d) => d!).toList());
  };
}
