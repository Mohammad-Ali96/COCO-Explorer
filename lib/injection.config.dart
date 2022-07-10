// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import 'core/data/utils/configuration.dart' as _i3;
import 'core/data/utils/network/network_info.dart' as _i9;
import 'core/domain/utils/network/network_info.dart' as _i8;
import 'core/presentation/blocs/auth/auth_bloc.dart' as _i28;
import 'features/auth/data/datasources/local/auth_local_datasource.dart'
    as _i12;
import 'features/auth/data/datasources/remote/auth_remote_datasource.dart'
    as _i13;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i15;
import 'features/auth/domain/repositories/auth_repository.dart' as _i14;
import 'features/auth/domain/usecases/get_first_time_logged_use_case.dart'
    as _i18;
import 'features/auth/domain/usecases/get_signed_in_user_use_case.dart' as _i21;
import 'features/auth/domain/usecases/login_use_case.dart' as _i24;
import 'features/auth/domain/usecases/logout_use_case.dart' as _i25;
import 'features/auth/domain/usecases/set_first_time_logged_use_case.dart'
    as _i26;
import 'features/auth/domain/usecases/subscribe_to_auth_status.dart' as _i27;
import 'features/explorer/data/datasources/remote/explorer_remote_datasource.dart'
    as _i5;
import 'features/explorer/data/repositories/explorer_repository_impl.dart'
    as _i17;
import 'features/explorer/domain/repositories/explorer_repository.dart' as _i16;
import 'features/explorer/domain/usecases/get_image_ids_by_category_ids_use_case.dart'
    as _i19;
import 'features/explorer/domain/usecases/get_images_details_by_ids_use_case.dart'
    as _i20;
import 'features/explorer/presentation/blocs/image_ids/image_ids_bloc.dart'
    as _i22;
import 'features/explorer/presentation/blocs/images_details/images_details_list_bloc.dart'
    as _i23;
import 'features/explorer/presentation/providers/tags_selected_provider.dart'
    as _i11;
import 'injectable_module.dart' as _i29;

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
  gh.lazySingleton<_i4.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i5.ExplorerRemoteDataSource>(() =>
      _i5.ExplorerRemoteDataSourceImpl(
          get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i6.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.lazySingleton<_i7.Logger>(() => injectableModule.logger);
  gh.lazySingleton<_i8.NetworkInfo>(
      () => _i9.NetworkInfoImpl(get<_i6.InternetConnectionChecker>()));
  await gh.lazySingletonAsync<_i10.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true);
  gh.factory<_i11.TagsSelectedProvider>(() => _i11.TagsSelectedProvider());
  gh.lazySingleton<_i12.AuthLocalDataSource>(
      () => _i12.AuthLocalDataSourceImpl(get<_i10.SharedPreferences>()),
      dispose: (i) => i.dispose());
  gh.lazySingleton<_i13.AuthRemoteDataSource>(() =>
      _i13.AuthRemoteDataSourceImpl(get<_i4.Dio>(), get<_i3.Configuration>()));
  gh.lazySingleton<_i14.AuthRepository>(() => _i15.AuthRepositoryImpl(
      get<_i12.AuthLocalDataSource>(),
      get<_i13.AuthRemoteDataSource>(),
      get<_i8.NetworkInfo>(),
      get<_i7.Logger>(),
      get<_i3.Configuration>()));
  gh.lazySingleton<_i16.ExplorerRepository>(() => _i17.ExplorerRepositoryImpl(
      get<_i5.ExplorerRemoteDataSource>(),
      get<_i8.NetworkInfo>(),
      get<_i7.Logger>(),
      get<_i3.Configuration>()));
  gh.lazySingleton<_i18.GetFirstTimeLoggedUseCase>(
      () => _i18.GetFirstTimeLoggedUseCase(get<_i14.AuthRepository>()));
  gh.lazySingleton<_i19.GetImageIdsByCategoryIdsUseCase>(() =>
      _i19.GetImageIdsByCategoryIdsUseCase(get<_i16.ExplorerRepository>()));
  gh.lazySingleton<_i20.GetImagesDetailsByIdsUseCase>(
      () => _i20.GetImagesDetailsByIdsUseCase(get<_i16.ExplorerRepository>()));
  gh.lazySingleton<_i21.GetSignedInUserUseCase>(
      () => _i21.GetSignedInUserUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i22.ImageIdsBloc>(() => _i22.ImageIdsBloc(
      getImageIdsIdsUseCase: get<_i19.GetImageIdsByCategoryIdsUseCase>()));
  gh.factory<_i23.ImagesDetailsListBloc>(() => _i23.ImagesDetailsListBloc(
      getImagesDetailsByIdsUseCase: get<_i20.GetImagesDetailsByIdsUseCase>()));
  gh.lazySingleton<_i24.LoginUseCase>(
      () => _i24.LoginUseCase(get<_i14.AuthRepository>()));
  gh.lazySingleton<_i25.LogoutUseCase>(
      () => _i25.LogoutUseCase(repository: get<_i14.AuthRepository>()));
  gh.lazySingleton<_i26.SetFirstTimeLoggedUseCase>(
      () => _i26.SetFirstTimeLoggedUseCase(get<_i14.AuthRepository>()));
  gh.lazySingleton<_i27.SubscribeToAuthStatusUseCase>(
      () => _i27.SubscribeToAuthStatusUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i28.AuthBloc>(() => _i28.AuthBloc(
      get<_i21.GetSignedInUserUseCase>(),
      get<_i25.LogoutUseCase>(),
      get<_i18.GetFirstTimeLoggedUseCase>(),
      get<_i26.SetFirstTimeLoggedUseCase>(),
      get<_i27.SubscribeToAuthStatusUseCase>()));
  return get;
}

class _$InjectableModule extends _i29.InjectableModule {}
