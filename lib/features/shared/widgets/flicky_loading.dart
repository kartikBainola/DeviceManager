import 'package:flutter/material.dart';
import 'package:device_manager/features/shared/widgets/flicky_animated_icons.dart';
import 'package:device_manager/helpers/enums.dart';

class FlickyLoading extends StatelessWidget {
  const FlickyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 5,
              )),
          Center(
            child: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.bolt,
              isSelected: true,
              size: FlickyAnimatedIconSizes.medium,
            ),
          )
        ],
      ),
    );
  }
}
