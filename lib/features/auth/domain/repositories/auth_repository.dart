import 'dart:async';
import 'dart:io';

import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> getSignedInUser();

  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> logout();


  Future<Either<Failure, bool>> getIsFirstTimeLogged();

  Future<Either<Failure, void>> setFirstTimeLogged(bool firstTimeLogged);

  Future<Either<Failure, Stream<User?>>> subscribeToAuthStatus();
}
