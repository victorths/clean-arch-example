import '../../../commons/commons.dart';
import 'home_controller.dart';
import 'home_store.dart';
import 'home_widget.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => HomeController(
            store: HomeStore(),
            cartStore: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Paths.root, child: (context, args) => const HomeWidget()),
      ];
}
