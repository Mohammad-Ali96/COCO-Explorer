import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/core/domain/usecases/usecase.dart';
import 'package:coco_explorer/features/auth/domain/entities/user.dart';
import 'package:coco_explorer/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSignedInUserUseCase extends UseCase<User?, NoParams> {
  final AuthRepository authRepository;

  GetSignedInUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, User?>> call(NoParams params) {
    return authRepository.getSignedInUser();
  }
}
