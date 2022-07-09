import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/features/explorer/domain/entities/coco_image.dart';
import 'package:dartz/dartz.dart';

abstract class ExplorerRepository {
  Future<Either<Failure, List<int>>> getImageIdsByCategoryIds(
      {required List<int> categoryIds});

  Future<Either<Failure, List<CoCoImage>>> getImagesDetailsByIds(
      {required int page});

}
