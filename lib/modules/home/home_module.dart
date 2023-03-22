import 'package:eng_gruposbf_mobile_flutter/modules/home/home_controller.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../commons/presentation/navigation/routes.dart';
import 'home_widget.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => HomeController(
            store: HomeStore(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Paths.root, child: (context, args) => const HomeWidget()),
      ];
}
