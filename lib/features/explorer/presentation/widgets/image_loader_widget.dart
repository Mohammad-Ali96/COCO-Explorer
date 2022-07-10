import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoaderWidget extends StatelessWidget {
  const ImageLoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return const ImageItemLoadingWidget();
      },
    );
  }
}

class ImageItemLoadingWidget extends StatelessWidget {
  const ImageItemLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Container(
        height: 240,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
