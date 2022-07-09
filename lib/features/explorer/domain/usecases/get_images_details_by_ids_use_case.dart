import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/core/domain/usecases/usecase.dart';
import 'package:coco_explorer/features/explorer/domain/entities/coco_image.dart';
import 'package:coco_explorer/features/explorer/domain/repository/explorer_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetImagesDetailsByIdsUseCase
    extends UseCase<List<CoCoImage>, GetImagesDetailsByIdsUseCaseParams> {
  final ExplorerRepository repository;

  GetImagesDetailsByIdsUseCase(this.repository);

  @override
  Future<Either<Failure, List<CoCoImage>>> call(
      GetImagesDetailsByIdsUseCaseParams params) async {
    return repository.getImagesDetailsByIds(page: params.page);
  }
}

class GetImagesDetailsByIdsUseCaseParams {
  final int page;

  GetImagesDetailsByIdsUseCaseParams({
    required this.page,
  });
}
