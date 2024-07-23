import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_manager/features/intro/presentation/viewmodels/loading_notification.viewmodel.dart';
import 'package:device_manager/helpers/enums.dart';

final loadingMessageProvider = StateProvider<String>((ref) => '');

final loadingNotificationVMProvider =
    StateNotifierProvider<LoadingNotificationViewModel, AppLoadingStates>(
        (ref) {
  return LoadingNotificationViewModel(AppLoadingStates.none, ref);
});
