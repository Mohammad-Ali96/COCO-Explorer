// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coco_image_seqmentation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoCoImageSegmentationModel _$CoCoImageSegmentationModelFromJson(
        Map<String, dynamic> json) =>
    CoCoImageSegmentationModel(
      categoryId: json['category_id'] as int,
      imageId: json['image_id'] as int,
      segmentation: json['segmentation'] == null
          ? []
          : CoCoImageSegmentationModel.decodeSegmentation(json['segmentation']),
    );

Map<String, dynamic> _$CoCoImageSegmentationModelToJson(
        CoCoImageSegmentationModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'image_id': instance.imageId,
      'segmentation': instance.segmentation,
    };
