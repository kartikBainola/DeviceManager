import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_manager/features/devices/data/models/outlet.model.dart';

class OutletListViewModel extends StateNotifier<List<OutletModel>> {
  final Ref ref;
  OutletListViewModel(super.state, this.ref);

  void initializeList(List<OutletModel> outletList) {
    state = outletList;
  }
}
