import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _noofhearts = prefs.getInt('ff_noofhearts') ?? _noofhearts;
    });
    _safeInit(() {
      _lastnotificationprompt =
          prefs.getInt('ff_lastnotificationprompt') ?? _lastnotificationprompt;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _currentsectionno = 1;
  int get currentsectionno => _currentsectionno;
  set currentsectionno(int value) {
    _currentsectionno = value;
  }

  int _currentunitno = 1;
  int get currentunitno => _currentunitno;
  set currentunitno(int value) {
    _currentunitno = value;
  }

  int _currentlevelno = 1;
  int get currentlevelno => _currentlevelno;
  set currentlevelno(int value) {
    _currentlevelno = value;
  }

  int _currentlessonno = 1;
  int get currentlessonno => _currentlessonno;
  set currentlessonno(int value) {
    _currentlessonno = value;
  }

  int _correctanswersinarow = 0;
  int get correctanswersinarow => _correctanswersinarow;
  set correctanswersinarow(int value) {
    _correctanswersinarow = value;
  }

  int _totalnoofcorrectanswers = 0;
  int get totalnoofcorrectanswers => _totalnoofcorrectanswers;
  set totalnoofcorrectanswers(int value) {
    _totalnoofcorrectanswers = value;
  }

  int _currentquestionno = 1;
  int get currentquestionno => _currentquestionno;
  set currentquestionno(int value) {
    _currentquestionno = value;
  }

  int _timetaken = 0;
  int get timetaken => _timetaken;
  set timetaken(int value) {
    _timetaken = value;
  }

  int _reviewlessonno = 1;
  int get reviewlessonno => _reviewlessonno;
  set reviewlessonno(int value) {
    _reviewlessonno = value;
  }

  int _noofhearts = 5;
  int get noofhearts => _noofhearts;
  set noofhearts(int value) {
    _noofhearts = value;
    prefs.setInt('ff_noofhearts', value);
  }

  int _lessonstarttime = 0;
  int get lessonstarttime => _lessonstarttime;
  set lessonstarttime(int value) {
    _lessonstarttime = value;
  }

  int _lessonendtime = 0;
  int get lessonendtime => _lessonendtime;
  set lessonendtime(int value) {
    _lessonendtime = value;
  }

  int _xpearned = 1;
  int get xpearned => _xpearned;
  set xpearned(int value) {
    _xpearned = value;
  }

  int _currentstreak = 0;
  int get currentstreak => _currentstreak;
  set currentstreak(int value) {
    _currentstreak = value;
  }

  int _timetakeninseconds = 0;
  int get timetakeninseconds => _timetakeninseconds;
  set timetakeninseconds(int value) {
    _timetakeninseconds = value;
  }

  int _progressintimetaken = 0;
  int get progressintimetaken => _progressintimetaken;
  set progressintimetaken(int value) {
    _progressintimetaken = value;
  }

  int _challenge1 = 0;
  int get challenge1 => _challenge1;
  set challenge1(int value) {
    _challenge1 = value;
  }

  int _challenge2 = 0;
  int get challenge2 => _challenge2;
  set challenge2(int value) {
    _challenge2 = value;
  }

  int _challenge3 = 0;
  int get challenge3 => _challenge3;
  set challenge3(int value) {
    _challenge3 = value;
  }

  int _lessonswithmorethan90accuracy = 0;
  int get lessonswithmorethan90accuracy => _lessonswithmorethan90accuracy;
  set lessonswithmorethan90accuracy(int value) {
    _lessonswithmorethan90accuracy = value;
  }

  int _numberoflessonscompletedtoday = 0;
  int get numberoflessonscompletedtoday => _numberoflessonscompletedtoday;
  set numberoflessonscompletedtoday(int value) {
    _numberoflessonscompletedtoday = value;
  }

  int _xpearnedtoday = 0;
  int get xpearnedtoday => _xpearnedtoday;
  set xpearnedtoday(int value) {
    _xpearnedtoday = value;
  }

  bool _challengecompleted = false;
  bool get challengecompleted => _challengecompleted;
  set challengecompleted(bool value) {
    _challengecompleted = value;
  }

  int _gemsearned = 0;
  int get gemsearned => _gemsearned;
  set gemsearned(int value) {
    _gemsearned = value;
  }

  int _xpearnedfromlesson = 0;
  int get xpearnedfromlesson => _xpearnedfromlesson;
  set xpearnedfromlesson(int value) {
    _xpearnedfromlesson = value;
  }

  bool _streakanimationboolean = false;
  bool get streakanimationboolean => _streakanimationboolean;
  set streakanimationboolean(bool value) {
    _streakanimationboolean = value;
  }

  int _gemsfromdatabase = 0;
  int get gemsfromdatabase => _gemsfromdatabase;
  set gemsfromdatabase(int value) {
    _gemsfromdatabase = value;
  }

  int _gemstodatabase = 0;
  int get gemstodatabase => _gemstodatabase;
  set gemstodatabase(int value) {
    _gemstodatabase = value;
  }

  bool _isreview = false;
  bool get isreview => _isreview;
  set isreview(bool value) {
    _isreview = value;
  }

  int _reviewnumber = 0;
  int get reviewnumber => _reviewnumber;
  set reviewnumber(int value) {
    _reviewnumber = value;
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  String _deviceID = '';
  String get deviceID => _deviceID;
  set deviceID(String value) {
    _deviceID = value;
  }

  int _leaderboardrankbeforeupdate = 0;
  int get leaderboardrankbeforeupdate => _leaderboardrankbeforeupdate;
  set leaderboardrankbeforeupdate(int value) {
    _leaderboardrankbeforeupdate = value;
  }

  int _leaderboardrankafterupdate = 0;
  int get leaderboardrankafterupdate => _leaderboardrankafterupdate;
  set leaderboardrankafterupdate(int value) {
    _leaderboardrankafterupdate = value;
  }

  bool _notificationsDenied = false;
  bool get notificationsDenied => _notificationsDenied;
  set notificationsDenied(bool value) {
    _notificationsDenied = value;
  }

  DateTime? _timelastnotificationprompt =
      DateTime.fromMillisecondsSinceEpoch(1751461920000);
  DateTime? get timelastnotificationprompt => _timelastnotificationprompt;
  set timelastnotificationprompt(DateTime? value) {
    _timelastnotificationprompt = value;
  }

  int _lastnotificationprompt = 1751300824;
  int get lastnotificationprompt => _lastnotificationprompt;
  set lastnotificationprompt(int value) {
    _lastnotificationprompt = value;
    prefs.setInt('ff_lastnotificationprompt', value);
  }

  int _now = 0;
  int get now => _now;
  set now(int value) {
    _now = value;
  }

  int _lastpromptnowdifference = 0;
  int get lastpromptnowdifference => _lastpromptnowdifference;
  set lastpromptnowdifference(int value) {
    _lastpromptnowdifference = value;
  }

  String _courseid = 'mbbs';
  String get courseid => _courseid;
  set courseid(String value) {
    _courseid = value;
  }

  String _subcourseid = 'mbbs_learn';
  String get subcourseid => _subcourseid;
  set subcourseid(String value) {
    _subcourseid = value;
  }

  bool _notificationsenabled = true;
  bool get notificationsenabled => _notificationsenabled;
  set notificationsenabled(bool value) {
    _notificationsenabled = value;
  }

  String _chatsessionid = '';
  String get chatsessionid => _chatsessionid;
  set chatsessionid(String value) {
    _chatsessionid = value;
  }

  bool _newaipage = false;
  bool get newaipage => _newaipage;
  set newaipage(bool value) {
    _newaipage = value;
  }

  int _noofgems = 0;
  int get noofgems => _noofgems;
  set noofgems(int value) {
    _noofgems = value;
  }

  List<int> _multiselectcorrectoptionids = [];
  List<int> get multiselectcorrectoptionids => _multiselectcorrectoptionids;
  set multiselectcorrectoptionids(List<int> value) {
    _multiselectcorrectoptionids = value;
  }

  void addToMultiselectcorrectoptionids(int value) {
    multiselectcorrectoptionids.add(value);
  }

  void removeFromMultiselectcorrectoptionids(int value) {
    multiselectcorrectoptionids.remove(value);
  }

  void removeAtIndexFromMultiselectcorrectoptionids(int index) {
    multiselectcorrectoptionids.removeAt(index);
  }

  void updateMultiselectcorrectoptionidsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    multiselectcorrectoptionids[index] =
        updateFn(_multiselectcorrectoptionids[index]);
  }

  void insertAtIndexInMultiselectcorrectoptionids(int index, int value) {
    multiselectcorrectoptionids.insert(index, value);
  }

  int _DifficultyLevel = 1;
  int get DifficultyLevel => _DifficultyLevel;
  set DifficultyLevel(int value) {
    _DifficultyLevel = value;
  }

  String _aichatmode = 'quick_revise';
  String get aichatmode => _aichatmode;
  set aichatmode(String value) {
    _aichatmode = value;
  }

  String _aichattopicname = '';
  String get aichattopicname => _aichattopicname;
  set aichattopicname(String value) {
    _aichattopicname = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
