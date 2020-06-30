import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  static BuildContext context;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString('profile');
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
  }

  static saveProfile() {
    var json = profile.toJson();
    _prefs.setString('profile', jsonEncode(json));
  }
}