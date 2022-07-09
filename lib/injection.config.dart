// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:logger/logger.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import 'core/data/utils/configuration.dart' as _i3;
import 'core/data/utils/network/network_info.dart' as _i12;
import 'core/domain/utils/network/network_info.dart' as _i11;
import 'core/presentation/blocs/auth/auth_bloc.dart' as _i24;
import 'features/auth/data/datasources/local/auth_local_datasource.dart'
    as _i14;
import 'features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i15;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i17;
import 'features/auth/domain/repositories/auth_repository.dart' as _i16;
import 'features/auth/domain/usecases/get_first_time_logged_use_case.dart'
    as _i18;
import 'features/auth/domain/usecases/get_signed_in_user_use_case.dart' as _i19;
import 'features/auth/domain/usecases/login_use_case.dart' as _i20;
import 'features/auth/domain/usecases/logout_use_case.dart' as _i21;
import 'features/auth/domain/usecases/set_first_time_logged_use_case.dart'
    as _i22;
import 'features/auth/domain/usecases/subscribe_to_auth_status.dart' as _i23;
import 'features/explorer/data/datasources/remote/explorer_remote_datasource.dart'
    as _i5;
import 'features/explorer/domain/repository/explorer_repository.dart' as _i7;
import 'features/explorer/domain/usecases/get_image_ids_by_category_ids_use_case.dart'
    as _i6;
import 'features/explorer/domain/usecases/get_images_details_by_ids_use_case.dart'
    as _i8;
import 'injectable_module.dart' as _i25;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Configuration>(() => _i3.DevConfiguration(),
      registerFor: {_dev});
  gh.lazySingleton<_i3.Configuration>(() => _i3.StagingConfiguration(),
      registerFor: {_staging});
  gh.lazySingleton<_i3.Configuration>(() => _i3.ProductionConfiguration(),
      registerFor: {_prod});
  gh.lazySingleton<_i3.Configuration>(() => injectableModule.configuration);
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i5.ExplorerRemoteDataSource>(() =>
      _i5.ExplorerRemoteDataSourceImpl(
          get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i6.GetImageIdsByCategoryIdsUseCase>(
      () => _i6.GetImageIdsByCategoryIdsUseCase(get<_i7.ExplorerRepository>()));
  gh.lazySingleton<_i8.GetImagesDetailsByIdsUseCase>(
      () => _i8.GetImagesDetailsByIdsUseCase(get<_i7.ExplorerRepository>()));
  gh.lazySingleton<_i9.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i10.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i11.NetworkInfo>(
      () => _i12.NetworkInfoImpl(get<_i9.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i13.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i14.AuthLocalDataSource>(
      () => _i14.AuthLocalDataSourceImpl(get<_i13.SharedPreferences>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i15.AuthRemoteDataSource>(() =>
      _i15.AuthRemoteDataSourceImpl(get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i16.AuthRepository>(() => _i17.AuthRepositoryImpl(
      get<_i14.AuthLocalDataSource>(),
      get<_i15.AuthRemoteDataSource>(),
      get<_i11.NetworkInfo>(),
      get<_i10.Logger>(),
      get<_i3.Configuration>()));
  gh.lazySingleton<_i18.GetFirstTimeLoggedUseCase>(
      () => _i18.GetFirstTimeLoggedUseCase(get<_i16.AuthRepository>()));
  gh.lazySingleton<_i19.GetSignedInUserUseCase>(
      () => _i19.GetSignedInUserUseCase(get<_i16.AuthRepository>()));
  gh.lazySingleton<_i20.LoginUseCase>(
      () => _i20.LoginUseCase(get<_i16.AuthRepository>()));
  gh.lazySingleton<_i21.LogoutUseCase>(
      () => _i21.LogoutUseCase(repository: get<_i16.AuthRepository>()));
  gh.lazySingleton<_i22.SetFirstTimeLoggedUseCase>(
      () => _i22.SetFirstTimeLoggedUseCase(get<_i16.AuthRepository>()));
  gh.lazySingleton<_i23.SubscribeToAuthStatusUseCase>(
      () => _i23.SubscribeToAuthStatusUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i24.AuthBloc>(() => _i24.AuthBloc(
      get<_i19.GetSignedInUserUseCase>(),
      get<_i21.LogoutUseCase>(),
      get<_i18.GetFirstTimeLoggedUseCase>(),
      get<_i22.SetFirstTimeLoggedUseCase>(),
      get<_i23.SubscribeToAuthStatusUseCase>()));
  return get;
}

class _$InjectableModule extends _i25.InjectableModule {}
