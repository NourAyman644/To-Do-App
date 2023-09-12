import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/datebase/cache.dart';
import 'package:to_do_app/core/datebase/sqflite/sqflite.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  sl.registerLazySingleton<SqfliteHelper>(() => SqfliteHelper());
}
