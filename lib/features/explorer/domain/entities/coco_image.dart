import 'package:coco_explorer/features/explorer/domain/entities/coco_image_seqmentation.dart';

class CoCoImage {
  final int id;
  final String imageUrl;
  List<CoCoImageSegmentation> segmentations;
  CoCoImage({
    required this.id,
    required this.imageUrl,
    required this.segmentations,
  });
}
