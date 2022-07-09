import 'package:flutter/material.dart';

class DrawerLeadingIcon extends StatelessWidget {
  const DrawerLeadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return IconButton(
        icon: const Icon(Icons.menu, size: 32.0),
        splashRadius: 30.0,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    });
  }
}
