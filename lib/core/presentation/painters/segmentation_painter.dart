//import 'dart:math';
//import 'dart:developer' as dev;
//
//import 'package:coco_explorer/features/explorer/domain/entities/coco_image_seqmentation.dart';
//import 'package:flutter/material.dart';
//
//
//
//class SegmentationsPainter extends CustomPainter {
//  final List<CoCoImageSegmentation> segmentations;
//  final Size? originalSize;
//
//  SegmentationsPainter({required this.segmentations, this.originalSize});
//
//  @override
//  void paint(Canvas canvas, Size size) async {
//    if (originalSize == null) return;
//
//    final paint = Paint()..style = PaintingStyle.fill;
//
//    final tags = servLocator<SearchTagsProvider>().searchTags;
//
//    List<CoCoImageSegmentation> segmentsToBeDrawn = [];
//
//    if (tags.isNotEmpty) {
//      final tagsIds = categoryToId.entries
//          .where((element) => tags.contains(element.key))
//          .map((e) => e.value)
//          .toList();
//
//      segmentsToBeDrawn = segmentations
//          .where((element) => tagsIds.contains(element.categoryId))
//          .toList();
//    } else {
//      segmentsToBeDrawn = segmentations;
//    }
//
//    for (var j = 0; j < segmentsToBeDrawn.length; j++) {
//      var r = (Random().nextDouble() * 255).floor();
//      var g = (Random().nextDouble() * 255).floor();
//      var b = (Random().nextDouble() * 255).floor();
//
//      paint.color = Color.fromRGBO(r, g, b, 0.7);
//
//      var poly = segmentsToBeDrawn[j].points;
//
//      try {
//        Path path = Path();
//        Path linePath = Path();
//        final borderPainter = Paint()
//          ..strokeWidth = 2
//          ..color = Colors.black
//          ..style = PaintingStyle.stroke;
//
//        path.moveTo(
//          transformX(poly[0], size, originalSize!),
//          transformY(poly[1], size, originalSize!),
//        );
//        linePath.moveTo(
//          transformX(poly[0], size, originalSize!),
//          transformY(poly[1], size, originalSize!),
//        );
//
//        for (int m = 0; m < poly.length - 2; m += 2) {
//          path.lineTo(
//            transformX(poly[m + 2], size, originalSize!),
//            transformY(poly[m + 3], size, originalSize!),
//          );
//          linePath.lineTo(
//            transformX(poly[m + 2], size, originalSize!),
//            transformY(poly[m + 3], size, originalSize!),
//          );
//        }
//
//        path.moveTo(
//          transformX(poly[0], size, originalSize!),
//          transformY(poly[1], size, originalSize!),
//        );
//        linePath.moveTo(
//          transformX(poly[0], size, originalSize!),
//          transformY(poly[1], size, originalSize!),
//        );
//
//        canvas.drawPath(path, paint);
//        canvas.drawPath(linePath, borderPainter);
//      } catch (err) {
//        dev.log(err.toString());
//      }
//    }
//  }
//
//  double transformX(num x, Size newSize, Size oldSize) {
//    return x * newSize.width / oldSize.width;
//  }
//
//  double transformY(num y, Size newSize, Size oldSize) {
//    return y * newSize.height / oldSize.height;
//  }
//
//  @override
//  bool shouldRepaint(SegmentationsPainter oldPainter) {
//    return oldPainter.segmentations != segmentations;
//  }
//}
