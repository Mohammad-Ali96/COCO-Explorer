import 'dart:async';

import 'package:coco_explorer/core/data/repositories/base_repository_impl.dart';
import 'package:coco_explorer/core/data/utils/configuration.dart';
import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/core/domain/utils/network/network_info.dart';
import 'package:coco_explorer/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:coco_explorer/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:coco_explorer/features/auth/domain/entities/user.dart';
import 'package:coco_explorer/features/auth/domain/repositories/auth_repository.dart';
import 'package:coco_explorer/features/auth/data/models/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource local;
  final AuthRemoteDataSource remote;
  final NetworkInfo networkInfo;
  final Logger logger;
  final Configuration configuration;

  AuthRepositoryImpl(this.local, this.remote, this.networkInfo, this.logger,
      this.configuration)
      : super(networkInfo, logger);

  @override
  Future<Either<Failure, User?>> getSignedInUser() async {
    return right(local.getSignedInUser()?.toDomain());
  }

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    return request(
      () async {
        var userResponse =
            await remote.login(email, password,);
        local.signInUser(userResponse.data!);
        local.authStatus.add(userResponse.data);
        return right(userResponse.data!.toDomain());
      },
      checkToken: false,
    );
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    local.logout();
    local.authStatus.add(null);
    return right(unit);
  }

  @override
  Future<Either<Failure, bool>> getIsFirstTimeLogged() async {
    return right(local.getIsFirstTimeLogged());
  }

  @override
  Future<Either<Failure, void>> setFirstTimeLogged(bool firstTimeLogged) async {
    return right(local.setFirstTimeLogged(firstTimeLogged));
  }

  @override
  Future<Either<Failure, Stream<User?>>> subscribeToAuthStatus() async {
    return right(local.authStatus.stream.map((event) => event?.toDomain()));
  }
}
