import 'dart:async';

import 'package:coco_explorer/core/data/repositories/base_repository_impl.dart';
import 'package:coco_explorer/core/data/utils/configuration.dart';
import 'package:coco_explorer/core/domain/entities/failures.dart';
import 'package:coco_explorer/core/domain/utils/network/network_info.dart';
import 'package:coco_explorer/features/explorer/data/datasources/remote/explorer_remote_datasource.dart';
import 'package:coco_explorer/features/explorer/data/models/coco_image_segmentation/coco_image_seqmentation_model.dart';
import 'package:coco_explorer/features/explorer/domain/entities/coco_image.dart';
import 'package:coco_explorer/features/explorer/domain/repositories/explorer_repository.dart';
import 'package:coco_explorer/features/explorer/data/models/coco_image/coco_image_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

enum ExplorerQueryType {
  getImages,
  getImagesByCats,
  getInstances,
  getCaptions,
}

@LazySingleton(as: ExplorerRepository)
class ExplorerRepositoryImpl extends BaseRepositoryImpl
    implements ExplorerRepository {
  final ExplorerRemoteDataSource remote;
  final NetworkInfo networkInfo;
  final Logger logger;
  final Configuration configuration;

  ExplorerRepositoryImpl(
      this.remote, this.networkInfo, this.logger, this.configuration)
      : super(networkInfo, logger);

  final List<int> imagesIds = [];

  @override
  Future<Either<Failure, List<int>>> getImageIdsByCategoryIds(
      {required List<int> categoryIds}) {
    return request(() async {
      List<int> ids = await remote.getImageIdsByCategoryIds(
        categoryIds: categoryIds,
        querytype: ExplorerQueryType.getImagesByCats.name,
      );
      imagesIds.clear();
      imagesIds.addAll(ids);
      return right(imagesIds);
    });
  }

  @override
  Future<Either<Failure, List<CoCoImage>>> getImagesDetailsByIds(
      {required int page}) {
    return request(() async {
      List<int> imagesToBeFetched = [];

      if (page == 1) {
        if (imagesIds.length >= 8) {
          imagesToBeFetched = imagesIds.sublist(0, 8);
        } else {
          imagesToBeFetched = imagesIds;
        }
      } else {
        if (imagesIds.length >= page * 8) {
          imagesToBeFetched = imagesIds.sublist((page - 1) * 8, page * 8);
        } else if ((page - 1) * 8 < imagesIds.length) {
          imagesToBeFetched = imagesIds.sublist(
            (page - 1) * 8,
            imagesIds.length,
          );
        } else {
          return right([]);
        }
      }
      final List<CoCoImageModel> imagesModel =
          await remote.getImagesDetailsByIds(
        imageIds: imagesToBeFetched,
        querytype: ExplorerQueryType.getImages.name,
      );

      final List<CoCoImage> images =
          imagesModel.map((e) => e.toDomain()).toList();

      final List<CoCoImageSegmentationModel> segmenations =
          await remote.getImagesSegmentationsByIds(
        imageIds: imagesToBeFetched,
        querytype: ExplorerQueryType.getInstances.name,
      );

      for (int i = 0; i < images.length; i++) {
        final segmentationsForOneImage = segmenations
            .where((element) => element.imageId == images.elementAt(i).id)
            .map((e) => e.toDomain())
            .toList();

        images.elementAt(i).segmentations = segmentationsForOneImage;
      }

      return right(images);
    });
  }
}
