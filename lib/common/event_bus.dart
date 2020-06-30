class EventBus {
  static EventBus get instance => EventBus._internal();
  EventBus._internal();

  final Map<dynamic, List<Function>> _eventCallbackMap = Map();

  on(EventType type, Function callback) {
    if (type == null || callback == null) return;
    if (_eventCallbackMap.containsKey(type)) {
      _eventCallbackMap[type].add(callback);
    } else {
      _eventCallbackMap[type] = [callback];
    }
  }

  off(EventType type, Function callback) {
    if (type == null || callback == null) return;
    if (_eventCallbackMap.containsKey(type)) {
      _eventCallbackMap[type].remove(callback);
    }
  }

  emit(EventType type, [dynamic args]) {
    var _cbs = _eventCallbackMap[type];
    if (_cbs != null && _cbs.length > 0) {
      _cbs.forEach((cb) => cb(args));
    }
  }

}

enum EventType {
  AppLifecycleChanged,
  LocalesChanged,
  AccessibilityFeaturesChanged
}