import 'dart:math' as math;
import 'package:flutter/material.dart';

class IOSArrowDownIcon extends StatelessWidget {
  final Color? color;
  const IOSArrowDownIcon({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -90 * math.pi / 180,
      child: Icon(
        Icons.arrow_back_ios_new,
        size: 18.0,
        color: color ??
            Theme.of(context)
                .inputDecorationTheme
                .enabledBorder!
                .borderSide
                .color,
      ),
    );
  }
}
