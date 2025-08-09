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

import 'dart:io'; // ✅ Added
import 'package:device_info_plus/device_info_plus.dart';

Future getDeviceIDAndSave() async {
  try {
    final deviceInfo = DeviceInfoPlugin();
    String deviceId = 'UnknownDevice';

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id ?? 'UnknownAndroid';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? 'UnknowniOS';
    }

    FFAppState().deviceID = deviceId;
    print('✅ Device ID saved to AppState: $deviceId');
  } catch (e) {
    print('❌ Error fetching device ID: $e');
    FFAppState().deviceID = 'ErrorGettingDeviceID';
  }
}
