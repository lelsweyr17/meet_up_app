import 'package:meet_up_app/utils/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _tag = "preferences_service";

class PreferencesService {
  PreferencesService._create();

  static final PreferencesService _instance = PreferencesService._create();

  static PreferencesService get instance => _instance;

  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    Log.message(_tag, "init");
    _prefs = await SharedPreferences.getInstance();
  }

  static const _showStartPageKey = "SHOW_START_PAGE_KEY";
  static const _defaultShowStartPageKey = true;

  bool get isShowStartPage {
    Log.message(_tag,
        "isShowStartPage ${_prefs.getBool(_showStartPageKey) ?? _defaultShowStartPageKey}");
    return _prefs.getBool(_showStartPageKey) ?? _defaultShowStartPageKey;
  }

  void setShowStartPage(bool value) {
    Log.message(_tag, "setShowStartPage $value");
    _prefs.setBool(_showStartPageKey, value);
  }
}
