import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSpinKitPulse extends StatelessWidget {
  const CustomSpinKitPulse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitPulse(
      size: 24,
      itemBuilder:
          (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
              color: index.isEven
                  ? Colors.grey.shade400
                  : Colors.grey.shade200,
              shape: BoxShape.circle),
        );
      },
    );
  }
}
