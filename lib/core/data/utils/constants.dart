import 'package:shared_preferences/shared_preferences.dart';

const String defaultJsonDateFormat = 'yyyy-MM-dd';
const String defaultJsonDateTimeFormat = 'yyyy-MM-dd HH:mm:ss Z';

///
/// [SharedPreferencesKeys] class, contains the keys for each value stored in the [SharedPreferences] package
///
class SharedPreferencesKeys {
  static const String user = 'user';
  static const String isDarkMode = 'is_dark_mode';
  static const String isFirstTimeLogged = 'is_first_time_logged';
  static const String timeStamp = 'timeStamp';
}
