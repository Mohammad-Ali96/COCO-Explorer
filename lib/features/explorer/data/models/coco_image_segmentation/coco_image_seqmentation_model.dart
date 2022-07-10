import 'dart:convert';

import 'package:coco_explorer/features/explorer/domain/entities/coco_image_seqmentation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coco_image_seqmentation_model.g.dart';

@JsonSerializable()
class CoCoImageSegmentationModel {
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'image_id')
  final int imageId;
  @JsonKey(name: 'segmentation', defaultValue: [], fromJson: decodeSegmentation)
  final List<num> segmentation;

  CoCoImageSegmentationModel({
    required this.categoryId,
    required this.imageId,
    required this.segmentation,
  });

  factory CoCoImageSegmentationModel.fromJson(Map<String, dynamic> json) =>
      _$CoCoImageSegmentationModelFromJson(json);

  static List<num> decodeSegmentation(data) {
    return json.decode(data ?? "[[]]") is List
        ? List<num>.from(
            (json.decode(data ?? "[[]]") as List<dynamic>)
                .first)
        : List<num>.from(
            json.decode(data ?? "{counts: []}")['counts']);
  }
}

extension MapCoCoImageSegmentationModelToDomain on CoCoImageSegmentationModel {
  CoCoImageSegmentation toDomain() => CoCoImageSegmentation(
      categoryId: categoryId, imageId: imageId, segmentation: segmentation);
}
