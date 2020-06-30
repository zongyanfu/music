import 'package:flutter/material.dart';
import 'package:music/common/event_bus.dart';

class Music extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Music();
}

class _Music extends State<Music> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAccessibilityFeatures() {
    EventBus.instance.emit(EventType.AccessibilityFeaturesChanged);
    super.didChangeAccessibilityFeatures();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    EventBus.instance.emit(EventType.AppLifecycleChanged, state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeLocales(List<Locale> locale) {
    EventBus.instance.emit(EventType.LocalesChanged, locale);
    super.didChangeLocales(locale);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
