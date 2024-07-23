import 'package:device_manager/features/devices/presentation/pages/devices.page.dart';
import 'package:device_manager/features/landing/presentation/pages/home.page.dart';
import 'package:device_manager/features/navigation/data/models/bottom_bar_nav_item.dart';
import 'package:device_manager/features/rooms/presentation/pages/rooms.page.dart';
import 'package:device_manager/features/settings/presentation/pages/settings.page.dart';
import 'package:device_manager/helpers/enums.dart';

class BottomNavBarRepository {
  List<BottomBarNavItemModel> getBottomBarNavItems() {
    return const [
      BottomBarNavItemModel(
          iconOption: FlickyAnimatedIconOptions.barhome,
          route: HomePage.route,
          isSelected: true),
      BottomBarNavItemModel(
          iconOption: FlickyAnimatedIconOptions.barrooms,
          route: RoomsPage.route),
      BottomBarNavItemModel(
          iconOption: FlickyAnimatedIconOptions.bardevices,
          route: DevicesPage.route),
      BottomBarNavItemModel(
          iconOption: FlickyAnimatedIconOptions.barsettings,
          route: SettingsPage.route)
    ];
  }
}
