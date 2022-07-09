import 'package:flutter/material.dart';

typedef OnIconButtonPressed = Function();

class MoreVerticalIcon extends StatelessWidget {
  final OnIconButtonPressed onIconButtonPressed;

  const MoreVerticalIcon({
    Key? key,
    required this.onIconButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.more_vert,
        size: 30,
      ),
      onPressed: onIconButtonPressed,
      splashRadius: 30,
    );
  }
}
