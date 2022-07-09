import 'package:coco_explorer/features/explorer/domain/entities/coco_image.dart';

class SearchResult {
  final List<CoCoImage> images;
  final int total;

  const SearchResult({
    required this.total,
    required this.images,
  });
}
