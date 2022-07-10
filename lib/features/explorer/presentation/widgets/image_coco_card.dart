import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_explorer/core/presentation/widgets/custom_spin_kit_pulse.dart';
import 'package:coco_explorer/features/explorer/domain/entities/coco_image.dart';
import 'package:flutter/material.dart';

class ImageCocoCard extends StatelessWidget {
  final CoCoImage coCoImage;

  const ImageCocoCard({Key? key, required this.coCoImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: coCoImage.imageUrl,
        placeholder: (context, url) =>
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: const CustomSpinKitPulse()),
        errorWidget: (context, url, error) =>
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: const Icon(Icons.error)),
        imageBuilder: (context, imageProvider) => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 240,
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }
}
