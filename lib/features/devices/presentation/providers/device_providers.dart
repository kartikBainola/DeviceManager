import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_manager/features/devices/data/models/device.model.dart';
import 'package:device_manager/features/devices/data/repositories/devices.repository.dart';
import 'package:device_manager/features/devices/presentation/viewmodels/device_toggle.viewmodel.dart';
import 'package:device_manager/features/devices/presentation/viewmodels/devicelist.viewmodel.dart';
import 'package:device_manager/features/shared/models/device_response.model.dart';
import 'package:device_manager/features/shared/providers/shared_providers.dart';
import 'package:device_manager/features/shared/services/device.service.dart';

final deviceRepositoryProvider = Provider((ref) {
  return DevicesRepository(ref);
});

/*final deviceListRetrievalProvider = FutureProvider<bool>((ref) async {
  try {
    if (ref.read(deviceListVMProvider).isEmpty) {
      final devices = await ref.read(deviceRepositoryProvider).getListOfDevices();
      ref.read(deviceListVMProvider.notifier).initializeState(devices);
    }

    return true;
  }
  on Exception {
    return false;
  }
});*/

final deviceListVMProvider =
    StateNotifierProvider<DeviceListViewModel, List<DeviceModel>>((ref) {
  return DeviceListViewModel([], ref);
});

final selectedDeviceProvider = StateProvider<DeviceModel?>((ref) {
  return null;
});

final deviceToggleVMProvider =
    StateNotifierProvider<DeviceToggleViewModel, bool>((ref) {
  return DeviceToggleViewModel(false, ref);
});
