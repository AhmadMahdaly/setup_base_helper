import 'package:flutter/material.dart';

import './cache_helper/cache_helper.dart';

int mainLayoutIntitalScreenIndex = 0;
String? userToken;
final navigatorKey = GlobalKey<NavigatorState>();
const kPrimaryEnFont = 'app_font';
const kPrimaryArFont = 'app_font';
final bool latinLang = (CacheHelper.getLanguage() == 'en');
