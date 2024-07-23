import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_manager/features/devices/presentation/providers/add_device_providers.dart';
import 'package:device_manager/features/devices/presentation/widgets/add_device_sheet.dart';
import 'package:device_manager/features/landing/data/models/home_tile_option.dart';
import 'package:device_manager/helpers/enums.dart';
import 'package:device_manager/helpers/utils.dart';

class HomeTileOptionsViewmodel extends StateNotifier<List<HomeTileOption>> {
  final Ref ref;
  HomeTileOptionsViewmodel(super.state, this.ref);

  void onTileSelected(HomeTileOption option) {
    switch (option.option) {
      case HomeTileOptions.addDevice:
        Utils.showUIModal(Utils.mainNav.currentContext!, const AddDeviceSheet(),
            onDismissed: () {
          Future.delayed(0.25.seconds, () {
            ref.read(saveAddDeviceVMProvider.notifier).resetAllValues();
          });
        });
        break;
      case HomeTileOptions.manageDevices:
        break;
      case HomeTileOptions.testConnection:
        break;
    }
  }
}
