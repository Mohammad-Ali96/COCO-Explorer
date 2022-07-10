// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_explorer/core/presentation/mixins/image_size_mixin.dart';
import 'package:coco_explorer/core/presentation/painters/segmentation_painter.dart';
import 'package:coco_explorer/core/presentation/widgets/custom_spin_kit_pulse.dart';
import 'package:coco_explorer/features/explorer/domain/entities/coco_image.dart';
import 'package:flutter/material.dart';

class ImageCocoCard extends StatelessWidget with ImageSizeMixin {
  final CoCoImage coCoImage;

  const ImageCocoCard({Key? key, required this.coCoImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SizedImage>(
      future: getImageSize(coCoImage.imageUrl),
      builder: (context, snapshot) {
        return Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: snapshot.data == null || !snapshot.hasData
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          child: const CustomSpinKitPulse())
                      : CustomPaint(
                          foregroundPainter: SegmentationsImagePainter(
                            segmentations: coCoImage.segmentations,
                            originalSize: snapshot.data?.size,
                          ),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 240,
                              child: Image(image: snapshot.data!.image)),
                        ),
                ),
                if (snapshot.hasError)
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    child: const Icon(Icons.error),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

//class ImageCocoCard extends StatelessWidget {
//  final CoCoImage coCoImage;
//
//  const ImageCocoCard({Key? key, required this.coCoImage}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return ClipRRect(
//      borderRadius: BorderRadius.circular(8),
//      child: CachedNetworkImage(
//        imageUrl: coCoImage.imageUrl,
//        placeholder: (context, url) =>
//        SizedBox(
//            width: MediaQuery.of(context).size.width,
//            height: 240,
//            child: const CustomSpinKitPulse()),
//        errorWidget: (context, url, error) =>
//        SizedBox(
//            width: MediaQuery.of(context).size.width,
//            height: 240,
//            child: const Icon(Icons.error)),
//        imageBuilder: (context, imageProvider) => SizedBox(
//          width: MediaQuery.of(context).size.width,
//          height: 240,
//          child: Image(
//            image: imageProvider,
//            fit: BoxFit.cover,
//          ),
//        ),
//      )
//    );
//  }
//}
