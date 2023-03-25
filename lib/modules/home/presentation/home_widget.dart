import '../../../commons/commons.dart';
import 'home_controller.dart';
import 'widgets/custom_cart_icon.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ModularInjector<HomeWidget, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // O Hand-off diz q o header será o mesmo para todas as telas porém na tela de carrinho o AppBar difere muito desse e para
      // evitar colocar condicionais para exibir/omitir os componentes do AppBar preferi separa-los
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(Assets.logo),
        actions: [
          Obx(
            () => CustomCartIcon(
              itemsOnCart: controller.cartStore.itemsOnCart,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            // Altura do textfield 32 ficou bem achatado, 48 é o recomendado
            height: 48,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  'O que está procurando?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color(0xFFD6D6D6),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text('This is HOME'),
      ),
    );
  }
}
