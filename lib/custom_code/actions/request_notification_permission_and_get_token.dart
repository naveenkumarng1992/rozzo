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

Future<bool> requestNotificationPermissionAndGetToken() async {
  try {
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // User granted permission
      final token = await messaging.getToken();
      FFAppState().fcmToken = token ?? "No token";
      FFAppState().notificationsDenied = false;
      return true;
    } else {
      // User denied permission
      FFAppState().notificationsDenied = true;
      FFAppState().fcmToken = "No token";
      return false;
    }
  } catch (e) {
    print('❌ Error requesting permission: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
