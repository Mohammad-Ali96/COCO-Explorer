import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/core/domain/usecases/usecase.dart';
import 'package:coco_explorer/features/auth/domain/entities/user.dart';
import 'package:coco_explorer/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase extends UseCase<User, LoginUseCaseParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(LoginUseCaseParams params) async {
    return authRepository.login(email: params.email, password: params.password);
  }
}

class LoginUseCaseParams {
  final String email;
  final String password;

  LoginUseCaseParams(this.email, this.password);
}
