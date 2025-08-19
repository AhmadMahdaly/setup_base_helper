import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/networking/dio_factory.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt
    ..registerLazySingleton<DioFactory>(() {
      return DioFactory();
    })
    ..registerLazySingleton<Dio>(() => getIt<DioFactory>().createDio());
  // ..registerSingleton<AuthRepo>(AuthRepo(getIt<Dio>()));
}
