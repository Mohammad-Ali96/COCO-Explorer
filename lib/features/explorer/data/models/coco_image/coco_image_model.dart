import 'package:coco_explorer/features/explorer/domain/entities/coco_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coco_image_model.g.dart';

@JsonSerializable()
class CoCoImageModel {
  final int id;
  @JsonKey(name: 'coco_url')
  final String imageUrl;

  CoCoImageModel({
    required this.id,
    required this.imageUrl,
  });

  factory CoCoImageModel.fromJson(Map<String, dynamic> json) =>
      _$CoCoImageModelFromJson(json);
}

extension MapCoCoImageModelToDomain on CoCoImageModel {
  CoCoImage toDomain() => CoCoImage(id: id, imageUrl: imageUrl);
}
