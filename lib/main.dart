import 'package:flutter/material.dart';
import 'package:to_do_app/core/datebase/cache.dart';

import 'App/MyApp.dart';
import 'core/services/services_Locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await sl<CacheHelper>().init(); //take object
  runApp(const MyApp());
}
