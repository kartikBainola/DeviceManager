import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:device_manager/features/landing/presentation/responsiveness/landing_page_responsive.config.dart';
import 'package:device_manager/features/shared/widgets/flicky_animated_icons.dart';
import 'package:device_manager/helpers/enums.dart';
import 'package:device_manager/styles/styles.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final config = LandingPageResponsiveConfig.landingPageConfig(context);

    return Padding(
      padding: HomeAutomationStyles.mediumPadding.copyWith(
        bottom: 0,
        left: HomeAutomationStyles.mediumSize,
      ),
      child: Row(
        children: [
          Visibility(
            visible: config.showBoltOnHeader,
            child: const FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.bolt,
              isSelected: true,
              size: FlickyAnimatedIconSizes.large,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome,',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary)),
              Text('Roman',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold)),
            ]
                .animate(interval: 300.ms)
                .slideX(
                  begin: 0.5,
                  end: 0,
                  duration: 0.5.seconds,
                  curve: Curves.easeInOut,
                )
                .fadeIn(
                  duration: 0.5.seconds,
                  curve: Curves.easeInOut,
                ),
          ),
        ],
      ),
    );
  }
}
