// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coco_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoCoImageModel _$CoCoImageModelFromJson(Map<String, dynamic> json) =>
    CoCoImageModel(
      id: json['id'] as int,
      imageUrl: json['coco_url'] as String,
    );

Map<String, dynamic> _$CoCoImageModelToJson(CoCoImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coco_url': instance.imageUrl,
    };
