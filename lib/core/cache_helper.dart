import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _preferences;
  static const _deviceToken = 'DEVICE_TOKEN';
  static const _numOfNotifications = 'NUM_OF_NOTIFICATION';
  static const _userToken = 'USER_TOKEN';
  static const _userId = 'USER_ID';
  static const _cityName = 'CITY_NAME';
  static const _cityId = 'CITY_ID';
  static const _userName = 'USER_NAME';
  static const _defaultLocation = 'DEFAULT_LOCATION';
  static const _userImage = 'USER_IMAGE';
  static const _userPhone = 'USER_PHONE';
  static const _language = 'LANGUAGE';

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setDeviceToken(String token) async {
    await _preferences.setString(_deviceToken, token);
  }

  static String getDeviceToken() {
    return _preferences.getString(_deviceToken) ?? "";
  }

  static setNumOfUnReadNotifications(int number) async {
    await _preferences.setInt(_numOfNotifications, number);
  }

  static int getNumOfUnReadNotifications() {
    return _preferences.getInt(_numOfNotifications) ?? 0;
  }

  static setUserId(int id) async {
    await _preferences.setInt(_userId, id);
  }

  static int getUserId() {
    return _preferences.getInt(_userId) ?? 0;
  }

  static Future setFirstTime() async {
    await _preferences.setBool("isFirstTime", false);
  }

  static bool getIfFirstTime() {
    return _preferences.getBool("isFirstTime") ?? true;
  }

  static Future setIfIsVisitor(bool isVisitor) async {
    await _preferences.setBool("isVisitor", isVisitor);
  }

  static bool getIfIsVisitor() {
    return _preferences.getBool("isVisitor") ?? true;
  }

  static setCityName(String value) async {
    await _preferences.setString(_cityName, value);
  }

  static String getCityName() {
    return _preferences.getString(_cityName) ?? " ";
  }

  static setCityId(String value) async {
    await _preferences.setString(_cityId, value);
  }

  static String getCityId() {
    return _preferences.getString(_cityId) ?? " ";
  }

  static setUserToken(String token) async {
    await _preferences.setString(_userToken, token);
  }

  static String getUserToken() {
    return _preferences.getString(_userToken) ?? "";
  }

  static setLang(lang) async {
    await _preferences.setString(_language, lang);
  }

  static String getLang() {
    return _preferences.getString(_language) ?? "ar";
  }

  static setName(String name) async {
    await _preferences.setString(_userName, name);
  }

  static String getName() {
    return _preferences.getString(_userName) ?? "";
  }

  static setImage(String image) async {
    await _preferences.setString(_userImage, image);
  }

  static String getImage() {
    return _preferences.getString(
          _userImage,
        ) ??
        "";
  }

  static setPhone(String phone) async {
    await _preferences.setString(_userPhone, phone);
  }

  static String getPhone() {
    return _preferences.getString(
          _userPhone,
        ) ??
        "";
  }

  static remove() async {
    await _preferences.clear();
  }

  static removeId() async {
    await _preferences.remove(_userId);
  }

  static removeUserToken() async {
    await _preferences.remove(_userToken);
  }
}
