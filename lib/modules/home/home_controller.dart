import 'package:eng_gruposbf_mobile_flutter/commons/presentation/controllers/page_life_cycle_controller.dart';

import 'home_store.dart';

class HomeController extends PageLifeCycleController<HomeStore> {
  HomeController({
    required this.store,
  });

  @override
  final HomeStore store;
}
