import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BackLeadingIcon extends StatelessWidget {
  final Function? onClick;

  const BackLeadingIcon({Key? key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      splashRadius: 30.0,
      onPressed: () {
        if (onClick != null) {
          onClick!();
        } else {
          AutoRouter.of(context).pop();
        }
      },
    );
  }
}
