import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../services/api_service.dart';
import '../../services/assets_service.dart';
import '../../services/local_storage_service.dart';
import '../blocs/company/company_bloc.dart';
import '../blocs/route/route_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../repositories/company_repository.dart';
import '../repositories/route_repository.dart';
import '../repositories/user_repository.dart';

final getIt = GetIt.instance;

void setupInjection() {
  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio(
        BaseOptions(
          connectTimeout: kDebugMode ? null : const Duration(seconds: 90),
          receiveTimeout: kDebugMode ? null : const Duration(seconds: 90),
          sendTimeout: kDebugMode ? null : const Duration(seconds: 90),
        ),
      ));

  // Services
  getIt.registerLazySingleton<AssetsService>(() => AssetsService(httpClient: getIt<Dio>()));
  getIt.registerLazySingleton<ApiService>(() => ApiService(
        client: getIt<Dio>(),
        assetsService: getIt<AssetsService>(),
      ));
  getIt.registerLazySingleton<LocalStorageService>(() => LocalStorageService());

  // Repositories
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(storageService: getIt<LocalStorageService>()));
  getIt.registerLazySingleton<RouteRepository>(() => RouteRepository(apiService: getIt<ApiService>()));
  getIt.registerLazySingleton<CompanyRepository>(() => CompanyRepository(apiService: getIt<ApiService>()));

  // Blocs
  getIt.registerFactory<UserBloc>(() => UserBloc(repository: getIt<UserRepository>()));
  getIt.registerFactory<RouteBloc>(() => RouteBloc(repository: getIt<RouteRepository>()));
  getIt.registerFactory<CompanyBloc>(() => CompanyBloc(repository: getIt<CompanyRepository>()));
}