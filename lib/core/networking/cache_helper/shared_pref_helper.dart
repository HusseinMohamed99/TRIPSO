part of '../../helpers/export_manager/export_manager.dart';

const String PREFS_KEY_THEME = "PREFS_KEY_THEME";
const String PREFS_KEY_ON_BOARDING_SCREEN_VIEWED =
    "PREFS_KEY_ON_BOARDING_SCREEN_VIEWED";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

/// Utility class for managing SharedPreferences and FlutterSecureStorage operations.
class SharedPrefHelper {
  // Private constructor to prevent instantiation.
  final SharedPreferences _sharedPreferences;
  SharedPrefHelper(this._sharedPreferences);

  // Singleton instance for SharedPreferences.
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  // Singleton instance for FlutterSecureStorage.
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Removes a value from SharedPreferences with the given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: Removing data with key: $key');
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(key);
  }

  /// Clears all keys and values in SharedPreferences.
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: Clearing all data');
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }

  /// Saves a [value] with a [key] in SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    final SharedPreferences prefs = await _prefs;
    debugPrint(
        'SharedPrefHelper: Setting data with key: $key and value: $value');

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      debugPrint(
          'SharedPrefHelper: Unsupported value type: ${value.runtimeType}');
    }
  }

  /// Gets a bool value from SharedPreferences with the given [key].
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper: Getting bool value with key: $key');
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with the given [key].
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper: Getting double value with key: $key');
    final SharedPreferences prefs = await _prefs;
    return prefs.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with the given [key].
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper: Getting int value with key: $key');
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key) ?? 0;
  }

  /// Gets a String value from SharedPreferences with the given [key].
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper: Getting String value with key: $key');
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  /// Gets a dynamic value from SharedPreferences with the given [key].
  static Future<dynamic> getData(String key) async {
    debugPrint('SharedPrefHelper: Getting dynamic value with key: $key');
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }

  /// Gets a list of String values from SharedPreferences with the given [key].
  static Future<List<String>> getListString(String key) async {
    debugPrint('SharedPrefHelper: Getting List<String> value with key: $key');
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(key) ?? [];
  }

  /// Saves a [value] with a [key] in FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    debugPrint(
        'FlutterSecureStorage: Setting secured string with key: $key and value: $value');
    await _secureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with the given [key].
  static Future<String> getSecuredString(String key) async {
    debugPrint('FlutterSecureStorage: Getting secured string with key: $key');
    return await _secureStorage.read(key: key) ?? '';
  }

  /// Clears all keys and values in FlutterSecureStorage.
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: Clearing all data');
    await _secureStorage.deleteAll();
  }

  /// Removes a specific key from FlutterSecureStorage.
  static Future<void> clearSecuredData(String key) async {
    debugPrint('FlutterSecureStorage: Removing data with key: $key');
    await _secureStorage.delete(key: key);
  }

  //OnBoarding
  // Future<void> setOnBoardingScreenViewed() async {
  //   _sharedPreferences.setBool(PREFS_KEY_ON_BOARDING_SCREEN_VIEWED, true);
  // }
  //
  // Future<bool> isOnBoardingScreenViewed() async {
  //   return _sharedPreferences.getBool(PREFS_KEY_ON_BOARDING_SCREEN_VIEWED) ?? false;
  // }

  //Login
  // Future<void> setUserLogged() async {
  //   _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  // }
  //
  // Future<bool> isUserLogged() async {
  //   return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  // }

  //register
  //
  //
  // Future<void> logout() async {
  //   _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  // }
}
