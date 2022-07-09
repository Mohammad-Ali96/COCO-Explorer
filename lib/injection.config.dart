// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i11;
import 'package:logger/logger.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import 'core/data/utils/configuration.dart' as _i3;
import 'core/data/utils/network/network_info.dart' as _i14;
import 'core/domain/utils/network/network_info.dart' as _i13;
import 'core/presentation/blocs/auth/auth_bloc.dart' as _i27;
import 'features/auth/data/datasources/local/auth_local_datasource.dart'
    as _i16;
import 'features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i17;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i19;
import 'features/auth/domain/repositories/auth_repository.dart' as _i18;
import 'features/auth/domain/usecases/get_first_time_logged_use_case.dart'
    as _i21;
import 'features/auth/domain/usecases/get_signed_in_user_use_case.dart' as _i22;
import 'features/auth/domain/usecases/login_use_case.dart' as _i23;
import 'features/auth/domain/usecases/logout_use_case.dart' as _i24;
import 'features/auth/domain/usecases/set_first_time_logged_use_case.dart'
    as _i25;
import 'features/auth/domain/usecases/subscribe_to_auth_status.dart' as _i26;
import 'features/explorer/data/datasources/remote/explorer_remote_datasource.dart'
    as _i5;
import 'features/explorer/data/repositories/explorer_repository_impl.dart'
    as _i20;
import 'features/explorer/domain/repositories/explorer_repository.dart' as _i7;
import 'features/explorer/domain/usecases/get_image_ids_by_category_ids_use_case.dart'
    as _i6;
import 'features/explorer/domain/usecases/get_images_details_by_ids_use_case.dart'
    as _i8;
import 'features/explorer/presentation/blocs/image_ids/image_ids_bloc.dart'
    as _i9;
import 'features/explorer/presentation/blocs/images_details/images_details_list_bloc.dart'
    as _i10;
import 'injectable_module.dart' as _i28;

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
  gh.factory<_i9.ImageIdsBloc>(() => _i9.ImageIdsBloc(
      getImageIdsIdsUseCase: get<_i6.GetImageIdsByCategoryIdsUseCase>()));
  gh.factory<_i10.ImagesDetailsListBloc>(() => _i10.ImagesDetailsListBloc(
      getImagesDetailsByIdsUseCase: get<_i8.GetImagesDetailsByIdsUseCase>()));
  gh.lazySingleton<_i11.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i12.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i13.NetworkInfo>(
      () => _i14.NetworkInfoImpl(get<_i11.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i15.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.lazySingleton<_i16.AuthLocalDataSource>(
      () => _i16.AuthLocalDataSourceImpl(get<_i15.SharedPreferences>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i17.AuthRemoteDataSource>(() =>
      _i17.AuthRemoteDataSourceImpl(get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i18.AuthRepository>(() => _i19.AuthRepositoryImpl(
      get<_i16.AuthLocalDataSource>(),
      get<_i17.AuthRemoteDataSource>(),
      get<_i13.NetworkInfo>(),
      get<_i12.Logger>(),
      get<_i3.Configuration>()));
  gh.lazySingleton<_i20.ExplorerRepositoryImpl>(() =>
      _i20.ExplorerRepositoryImpl(get<dynamic>(), get<_i13.NetworkInfo>(),
          get<_i12.Logger>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i21.GetFirstTimeLoggedUseCase>(
      () => _i21.GetFirstTimeLoggedUseCase(get<_i18.AuthRepository>()));
  gh.lazySingleton<_i22.GetSignedInUserUseCase>(
      () => _i22.GetSignedInUserUseCase(get<_i18.AuthRepository>()));
  gh.lazySingleton<_i23.LoginUseCase>(
      () => _i23.LoginUseCase(get<_i18.AuthRepository>()));
  gh.lazySingleton<_i24.LogoutUseCase>(
      () => _i24.LogoutUseCase(repository: get<_i18.AuthRepository>()));
  gh.lazySingleton<_i25.SetFirstTimeLoggedUseCase>(
      () => _i25.SetFirstTimeLoggedUseCase(get<_i18.AuthRepository>()));
  gh.lazySingleton<_i26.SubscribeToAuthStatusUseCase>(
      () => _i26.SubscribeToAuthStatusUseCase(get<_i18.AuthRepository>()));
  gh.factory<_i27.AuthBloc>(() => _i27.AuthBloc(
      get<_i22.GetSignedInUserUseCase>(),
      get<_i24.LogoutUseCase>(),
      get<_i21.GetFirstTimeLoggedUseCase>(),
      get<_i25.SetFirstTimeLoggedUseCase>(),
      get<_i26.SubscribeToAuthStatusUseCase>()));
  return get;
}

class _$InjectableModule extends _i28.InjectableModule {}
