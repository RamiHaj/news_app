import 'package:shared_preferences/shared_preferences.dart';

class Chache_Helper
{
  static late SharedPreferences sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setdata
      ({
      required String key,
      required bool value
      })async
  {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getdata(
  {
  required String key
  })
    {
      return sharedPreferences.getBool(key);
    }
}