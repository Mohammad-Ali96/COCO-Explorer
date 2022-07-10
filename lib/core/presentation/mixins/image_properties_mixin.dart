import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SizedImage {
  final Size size;
  final ImageProvider image;

  SizedImage({required this.size, required this.image});
}

mixin ImagePropertiesMixin {
  Future<SizedImage> getImageSize(String imageUrl) {
    Completer<SizedImage> completer = Completer();
    final networkImage = CachedNetworkImageProvider(imageUrl);

    networkImage.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(
            SizedImage(image: networkImage, size: size),
          );
        },
      ),
    );

    return completer.future;
  }
}
