import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/core/domain/usecases/usecase.dart';
import 'package:coco_explorer/features/explorer/domain/repository/explorer_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetImageIdsByCategoryIdsUseCase
    extends UseCase<List<int>, GetImageIdsByCategoryIdsUseCaseParams> {
  final ExplorerRepository repository;

  GetImageIdsByCategoryIdsUseCase(this.repository);

  @override
  Future<Either<Failure, List<int>>> call(
      GetImageIdsByCategoryIdsUseCaseParams params) async {
    return repository.getImageIdsByCategoryIds(categoryIds: params.categoryIds);
  }
}

class GetImageIdsByCategoryIdsUseCaseParams {
  List<int> categoryIds;

  GetImageIdsByCategoryIdsUseCaseParams({
    required this.categoryIds,
  });
}
