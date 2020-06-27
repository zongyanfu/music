import 'package:flutter/material.dart';

class Setting {
  Locale locale;
  ThemeMode theme;

  Setting({ this.locale, this.theme });

  Setting.fromJson(Map<String, dynamic> json) {
    locale = Locale(json['locale']);
    switch (json['theme']) {
      case 'dark':
        theme = ThemeMode.dark;
        break;
      case 'light':
        theme = ThemeMode.light;
        break;
      default:
        theme = ThemeMode.system;
    }
  }
}