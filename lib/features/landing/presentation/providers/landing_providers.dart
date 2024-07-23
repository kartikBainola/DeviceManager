import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_manager/features/landing/data/models/home_tile_option.dart';
import 'package:device_manager/features/landing/data/repositories/energy_consumption_data.repository.dart';
import 'package:device_manager/features/landing/data/repositories/home_tile_options.repository.dart';
import 'package:device_manager/features/landing/presentation/viewmodels/home_tile_options.viewmodel.dart';

final homeTileOptionsRepositoryProvider = Provider((ref) {
  return HomeTileOptionsRepository();
});

final homeTileOptionsVMProvider =
    StateNotifierProvider<HomeTileOptionsViewmodel, List<HomeTileOption>>(
        (ref) {
  final options =
      ref.read(homeTileOptionsRepositoryProvider).getHomeTileOptions();
  return HomeTileOptionsViewmodel(options, ref);
});

final energyConsumptionRepositoryProvider = Provider((ref) {
  return EnergyConsumptionDataRepository();
});

final energyConsumptionProvider = Provider((ref) {
  return ref.read(energyConsumptionRepositoryProvider).getEnergyConsumption();
});
