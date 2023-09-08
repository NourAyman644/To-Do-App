import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/datebase/cache.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
