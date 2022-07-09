// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:logger/logger.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'core/data/utils/configuration.dart' as _i3;
import 'core/data/utils/network/network_info.dart' as _i11;
import 'core/domain/utils/network/network_info.dart' as _i10;
import 'core/presentation/blocs/auth/auth_bloc.dart' as _i23;
import 'features/auth/data/datasources/local/auth_local_datasource.dart'
    as _i13;
import 'features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i14;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i16;
import 'features/auth/domain/repositories/auth_repository.dart' as _i15;
import 'features/auth/domain/usecases/get_first_time_logged_use_case.dart'
    as _i17;
import 'features/auth/domain/usecases/get_signed_in_user_use_case.dart' as _i18;
import 'features/auth/domain/usecases/login_use_case.dart' as _i19;
import 'features/auth/domain/usecases/logout_use_case.dart' as _i20;
import 'features/auth/domain/usecases/set_first_time_logged_use_case.dart'
    as _i21;
import 'features/auth/domain/usecases/subscribe_to_auth_status.dart' as _i22;
import 'features/explorer/domain/repository/explorer_repository.dart' as _i6;
import 'features/explorer/domain/usecases/get_image_ids_by_category_ids_use_case.dart'
    as _i5;
import 'features/explorer/domain/usecases/get_images_details_by_ids_use_case.dart'
    as _i7;
import 'injectable_module.dart' as _i24;

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
  gh.lazySingleton<_i5.GetImageIdsByCategoryIdsUseCase>(
      () => _i5.GetImageIdsByCategoryIdsUseCase(get<_i6.ExplorerRepository>()));
  gh.lazySingleton<_i7.GetImagesDetailsByIdsUseCase>(
      () => _i7.GetImagesDetailsByIdsUseCase(get<_i6.ExplorerRepository>()));
  gh.lazySingleton<_i8.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i9.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i10.NetworkInfo>(
      () => _i11.NetworkInfoImpl(get<_i8.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i12.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i13.AuthLocalDataSource>(
      () => _i13.AuthLocalDataSourceImpl(get<_i12.SharedPreferences>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i14.AuthRemoteDataSource>(() =>
      _i14.AuthRemoteDataSourceImpl(get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i15.AuthRepository>(() => _i16.AuthRepositoryImpl(
      get<_i13.AuthLocalDataSource>(),
      get<_i14.AuthRemoteDataSource>(),
      get<_i10.NetworkInfo>(),
      get<_i9.Logger>(),
      get<_i3.Configuration>()));
  gh.lazySingleton<_i17.GetFirstTimeLoggedUseCase>(
      () => _i17.GetFirstTimeLoggedUseCase(get<_i15.AuthRepository>()));
  gh.lazySingleton<_i18.GetSignedInUserUseCase>(
      () => _i18.GetSignedInUserUseCase(get<_i15.AuthRepository>()));
  gh.lazySingleton<_i19.LoginUseCase>(
      () => _i19.LoginUseCase(get<_i15.AuthRepository>()));
  gh.lazySingleton<_i20.LogoutUseCase>(
      () => _i20.LogoutUseCase(repository: get<_i15.AuthRepository>()));
  gh.lazySingleton<_i21.SetFirstTimeLoggedUseCase>(
      () => _i21.SetFirstTimeLoggedUseCase(get<_i15.AuthRepository>()));
  gh.lazySingleton<_i22.SubscribeToAuthStatusUseCase>(
      () => _i22.SubscribeToAuthStatusUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i23.AuthBloc>(() => _i23.AuthBloc(
      get<_i18.GetSignedInUserUseCase>(),
      get<_i20.LogoutUseCase>(),
      get<_i17.GetFirstTimeLoggedUseCase>(),
      get<_i21.SetFirstTimeLoggedUseCase>(),
      get<_i22.SubscribeToAuthStatusUseCase>()));
  return get;
}

class _$InjectableModule extends _i24.InjectableModule {}
