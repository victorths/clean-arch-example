import 'package:eng_gruposbf_mobile_flutter/modules/home/presentation/widgets/home_banner.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/presentation/widgets/promotion_skeleton_loading.dart';
import 'package:eng_gruposbf_mobile_flutter/modules/home/presentation/widgets/promotions_grid.dart';

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
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 19,
            ),
            HomeBanner(
              image: Image.asset(
                Assets.banner,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => StateObserver(
                state: controller.store.status,
                onCompleted: (context) =>
                    PromotionsGrid(promotions: controller.store.promotions),
                onLoading: (context) => const PromotionsLoading(),
                onError: (context) => ErrorWidget(controller.store.error!),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            const PageFooter(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    // O Hand-off diz q o header será o mesmo para todas as telas porém na tela de carrinho o AppBar difere muito desse e para
    // evitar colocar condicionais para exibir/omitir os componentes do AppBar preferi separa-los
    return AppBar(
      backgroundColor: Colors.white,
      title: Image.asset(Assets.logo),
      actions: [
        Obx(() => CustomCartIcon(
              itemsOnCart: controller.cartStore.itemsOnCart,
            )),
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
    );
  }
}
