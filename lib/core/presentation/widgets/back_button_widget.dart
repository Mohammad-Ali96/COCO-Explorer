import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final void Function()? customOnPressd;
  const BackButtonWidget({Key? key, this.customOnPressd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: const Padding(
          padding: EdgeInsets.all(6),
          child: Icon(Icons.keyboard_arrow_left),
        ),
        onTap: customOnPressd == null
            ? () {
                AutoRouter.of(context).pop();
              }
            : customOnPressd!,
      ),
    );
  }
}
