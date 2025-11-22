import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int calculateaccuracy(int? totalnoofcorrectanswers) {
  // if (totalnoofcorrectanswers != null) {     return (totalnoofcorrectanswers * 100) / 15;   } else {     return 0.0;   }, can you modify this code to roundoff the ouput to an integer
  if (totalnoofcorrectanswers != null) {
    return ((totalnoofcorrectanswers * 100) / 15).round();
  } else {
    return 0;
  }
}

String timetakenforlessoncompletion(
  int? lessonstarttime,
  int? lessonendtime,
) {
  // check for errors and update
  if (lessonstarttime != null && lessonendtime != null) {
    int timeTakenInSeconds = lessonendtime - lessonstarttime;
    Duration duration = Duration(seconds: timeTakenInSeconds);
    String formattedTime =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0') +
            ':' +
            duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return formattedTime;
  } else {
    return '00:00';
  }
}

int? indexvalue(
  List<String> list,
  String value,
) {
  int indexOfValue(List<String> list, String value) {
    if (list == null || value == null) return -1;

    for (int i = 0; i < list.length; i++) {
      if (list[i].trim() == value.trim()) {
        return i;
      }
    }
    return -1; // not found
  }
}

bool? multiselectoptioncheck(
  List<int>? listA,
  List<int>? listB,
) {
  bool multiselectoptioncheck(List<int>? listA, List<int>? listB) {
    if (listA == null || listB == null) return false;
    if (listA.length != listB.length) return false;

    final a = List<int>.from(listA)..sort();
    final b = List<int>.from(listB)..sort();

    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
