import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_manager/features/devices/presentation/providers/add_device_providers.dart';
import 'package:device_manager/features/devices/presentation/widgets/add_device_workflow/add_device_form.dart';
import 'package:device_manager/features/devices/presentation/widgets/add_device_workflow/saved_device_view.dart';
import 'package:device_manager/features/devices/presentation/widgets/add_device_workflow/saving_device_view.dart';
import 'package:device_manager/helpers/enums.dart';
import 'package:device_manager/styles/styles.dart';

class AddDeviceSheet extends ConsumerWidget {
  const AddDeviceSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AddDeviceStates formstate = ref.watch(saveAddDeviceVMProvider);

    Widget? returnWidget;

    switch (formstate) {
      case AddDeviceStates.none:
        returnWidget = AddDeviceForm(onSave: () {
          ref.read(saveAddDeviceVMProvider.notifier).saveDevice();
        });
        break;
      case AddDeviceStates.saving:
        returnWidget = const SavingDeviceView();
        break;
      case AddDeviceStates.saved:
        returnWidget = const SavedDeviceView();
        break;
      default:
        break;
    }

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(HomeAutomationStyles.mediumRadius),
            topLeft: Radius.circular(HomeAutomationStyles.mediumRadius),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SafeArea(child: returnWidget!));
  }
}
