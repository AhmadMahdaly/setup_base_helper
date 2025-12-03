import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/networking/dio_factory.dart';
import '../features/intro/onboarding/cubit/onboarding_cubit.dart';
import '../features/main_layout/presentation/controllers/cubit/main_layout_cubit.dart';
import '../features/my_app/controller/localization_cubit/localization_cubit.dart';
import '../features/my_app/maintenance/cubit/maintenance_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt
    ..registerLazySingleton<DioFactory>(() {
      return DioFactory();
    })
    ..registerLazySingleton<Dio>(() => getIt<DioFactory>().createDio())
    ..registerFactory<MaintenanceCubit>(() => MaintenanceCubit(getIt()))
    ..registerLazySingleton<LocalizationCubit>(LocalizationCubit.new)
    ..registerLazySingleton<OnboardingCubit>(OnboardingCubit.new)
    ..registerLazySingleton<MainLayoutCubit>(MainLayoutCubit.new);
}
