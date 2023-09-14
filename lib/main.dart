import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/bloc/bloc_observer.dart';
import 'package:to_do_app/core/datebase/cache.dart';
import 'package:to_do_app/core/datebase/sqflite/sqflite.dart';
import 'package:to_do_app/features/auth/presention/cubit/task_cubit.dart';
import 'App/MyApp.dart';
import 'core/services/services_Locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setup();
  await sl<CacheHelper>().init(); //take object
  sl<SqfliteHelper>().initDb();
  runApp(BlocProvider(
    create: (context) => TaskCubit()..getTasks(),
    child: const MyApp(),
  ));
}
