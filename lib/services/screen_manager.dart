class ScreenManager {
  static final ScreenManager _manager = ScreenManager._internal();
  ScreenManager._internal();

  factory ScreenManager() {
    return _manager;
  }
  String _screen="login";
  void set (String newScreen)=>_screen=newScreen;
  String get getScreen=> _screen;
}