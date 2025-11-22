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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart'; // ✅ For defaultTargetPlatform
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future initializeMessaging() async {
  // Step 1: Initialize Firebase
  await Firebase.initializeApp();

  // Step 2: Get Device ID
  final deviceInfo = DeviceInfoPlugin();
  String deviceId = 'UnknownDevice';

  if (defaultTargetPlatform == TargetPlatform.android) {
    final androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id ?? 'UnknownAndroid';
  } else {
    final iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor ?? 'UnknowniOS';
  }

  // Save to App State
  FFAppState().deviceID = deviceId;

  // Step 3: Request permission for push notifications
  FirebaseMessaging.instance.requestPermission().then((settings) {
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.instance.getToken().then((token) {
        FFAppState().fcmToken = token ?? "No token";
      });
    } else {
      FFAppState().fcmToken = "No token";
    }
  });

  // Step 4: Initialize local notifications
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'alerts',
        channelName: 'Alerts',
        channelDescription: 'Notification tests as alerts',
        playSound: true,
        onlyAlertOnce: true,
        groupAlertBehavior: GroupAlertBehavior.Children,
        importance: NotificationImportance.High,
        defaultPrivacy: NotificationPrivacy.Private,
        defaultColor: Colors.deepPurple,
        ledColor: Colors.deepPurple,
      )
    ],
    debug: true,
  );

  // Step 5: Listen for foreground push notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print("received message 1: ${message.notification?.title}");

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'alerts',
        title: message.notification?.title ?? "No title",
        body: message.notification?.body ?? "No body",
        payload: {'notificationId': '1234567890'},
      ),
      actionButtons: [
        NotificationActionButton(
          key: "DISMISS",
          label: "Dismiss",
          actionType: ActionType.DismissAction,
          isDangerousOption: true,
        )
      ],
    );
  });
}
