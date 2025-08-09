// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';
import '/flutter_flow/flutter_flow_util.dart'; // Required for FFAppState

Future<void> checkNotificationPermissionStatus() async {
  // Ensure Firebase is initialized
  await Firebase.initializeApp();

  // Optional: small delay to let system update
  await Future.delayed(Duration(milliseconds: 500));

  final settings = await FirebaseMessaging.instance.getNotificationSettings();

  if (settings.authorizationStatus == AuthorizationStatus.authorized ||
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    FFAppState().notificationsenabled = true;
  } else {
    FFAppState().notificationsenabled = false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
