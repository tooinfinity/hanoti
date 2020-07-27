import 'package:flutter/material.dart';
import 'package:hanoti/localization/app_localization.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String FRANCAIS = 'fr';
const String ARABIC = 'ar';

String getTranslate(BuildContext context, String key) {
  return AppLocalization.of(context).translate(key);
}
