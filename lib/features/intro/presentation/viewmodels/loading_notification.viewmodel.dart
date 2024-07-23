import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_manager/features/devices/presentation/providers/add_device_providers.dart';
import 'package:device_manager/features/devices/presentation/providers/device_providers.dart';
import 'package:device_manager/features/intro/presentation/providers/loading_page_providers.dart';
import 'package:device_manager/features/shared/providers/shared_providers.dart';
import 'package:device_manager/helpers/enums.dart';

class LoadingNotificationViewModel extends StateNotifier<AppLoadingStates> {
  final Ref ref;
  LoadingNotificationViewModel(super.state, this.ref);

  Future<void> triggerLoading() async {
    state = AppLoadingStates.loading;

    ref.read(loadingMessageProvider.notifier).state = 'Initializing App...';

    final localStorageInitialized =
        await ref.read(localStorageProvider).initLocalStorage();
    await Future.delayed(1.seconds);

    ref.read(loadingMessageProvider.notifier).state = 'Loading Device list...';
    final devicesList =
        await ref.read(deviceRepositoryProvider).getListOfDevices();
    ref.read(deviceListVMProvider.notifier).initializeState(devicesList);
    await Future.delayed(1.seconds);

    ref.read(loadingMessageProvider.notifier).state =
        'Loading Outlet Config...';
    final outletListLoaded =
        await ref.read(outletListRepositoryProvider.future);
    final result = localStorageInitialized && outletListLoaded;

    await Future.delayed(1.seconds);
    ref.read(loadingMessageProvider.notifier).state =
        result ? 'Done' : 'Error Loading App';
    state = result ? AppLoadingStates.success : AppLoadingStates.error;
  }
}
