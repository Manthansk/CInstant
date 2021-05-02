import 'package:flutter/material.dart';
import 'package:instant_messenger_app/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String PUNJABI = 'pa';
const String GUJARATI = 'gu';
const String HINDI = 'hi';
const String MARATHI = 'mr';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case PUNJABI:
      return Locale(PUNJABI, "IN");
    case GUJARATI:
      return Locale(GUJARATI, "IN");
    case HINDI:
      return Locale(HINDI, "IN");
    case MARATHI:
      return Locale(MARATHI, "IN");
    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}
