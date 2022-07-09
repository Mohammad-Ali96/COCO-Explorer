import 'package:coco_explorer/core/data/models/base_response/base_response.dart';
import 'package:coco_explorer/core/data/utils/configuration.dart';
import 'package:coco_explorer/features/auth/data/models/refresh_token_response/refresh_token_response_model.dart';
import 'package:coco_explorer/features/auth/data/models/user/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'auth_remote_datasource.g.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<UserModel>> login(
      String email, String password);

  Future<BaseResponse<RefreshTokenResponseModel>> refreshToken(
      String refreshToken);


}

@LazySingleton(as: AuthRemoteDataSource)
@RestApi(baseUrl: '')
abstract class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _AuthRemoteDataSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @override
  @POST('/')
  Future<BaseResponse<UserModel>> login(@Field() String email,
      @Field() String password,);

  @override
  @POST('/')
  Future<BaseResponse<RefreshTokenResponseModel>> refreshToken(
      @Field() String refreshToken);


}
