import 'package:coco_explorer/core/data/utils/configuration.dart';
import 'package:coco_explorer/features/explorer/data/models/coco_image/coco_image_model.dart';
import 'package:coco_explorer/features/explorer/data/models/coco_image_segmentation/coco_image_seqmentation_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';


part 'explorer_remote_datasource.g.dart';

abstract class ExplorerRemoteDataSource {
  Future<List<int>> getImageIdsByCategoryIds(
      {required List<int> categoryIds, required String querytype});

  Future<List<CoCoImageModel>> getImagesDetailsByIds(
      {required List<int> imageIds, required String querytype});


  Future<List<CoCoImageSegmentationModel>> getImagesSegmentationsByIds(
      {required List<int> imageIds, required String querytype});

}

@LazySingleton(as: ExplorerRemoteDataSource)
@RestApi(baseUrl: '')
abstract class ExplorerRemoteDataSourceImpl
    implements ExplorerRemoteDataSource {
  @factoryMethod
  factory ExplorerRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _ExplorerRemoteDataSourceImpl(dio,
        baseUrl: configuration.getBaseUrl);
  }

  @override
  @POST('/coco-dataset-bigquery')
  Future<List<int>> getImageIdsByCategoryIds({
    @Field('category_ids') required List<int> categoryIds,
    @Field('querytype') required String querytype,
  });

  @override
  @POST('/coco-dataset-bigquery')
  Future<List<CoCoImageModel>> getImagesDetailsByIds({
    @Field('image_ids') required List<int> imageIds,
    @Field('querytype') required String querytype,
  });


  @override
  @POST('/coco-dataset-bigquery')
  Future<List<CoCoImageSegmentationModel>> getImagesSegmentationsByIds({
    @Field('image_ids') required List<int> imageIds,
    @Field('querytype') required String querytype,
  });

}
