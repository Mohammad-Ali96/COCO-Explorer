class CoCoImageSegmentation {
  final int categoryId;
  final int imageId;
  final List<num> segmentation;

  CoCoImageSegmentation({
    required this.categoryId,
    required this.imageId,
    required this.segmentation,
  });
}