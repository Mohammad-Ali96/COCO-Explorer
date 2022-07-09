import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderDots extends StatelessWidget {
  final Color? color;
  const LoaderDots({Key? key, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? Theme.of(context).colorScheme.secondary,
      size: 17.0,
    );
  }
}
