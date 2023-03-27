import '../../../commons/commons.dart';
import 'cart_controller.dart';
import 'widgets/cart_item_list.dart';
import 'widgets/empty_cart_panel.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends ModularInjector<CartWidget, CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Meu carrinho',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Expanded(
                      child: controller.store.itemsOnCartCount > 0
                          ? CartItemList(
                              itemsOnCart: controller.store.itemsOnCart,
                              interactWithItemCount: (item, interaction) =>
                                  interaction == 0
                                      ? controller.store.itemsOnCart
                                          .remove(item)
                                      : controller.store.itemsOnCart.update(
                                          item,
                                          (value) => value + interaction,
                                        ),
                            )
                          : const EmptyCartPanel(),
                    ),
                    CustomFilledButtom(
                      size: CustomFilledButtomSize.large,
                      onPressed: () {
                        if (controller.store.itemsOnCartCount > 0) {
                          controller.checkout();
                          showToast(context, 'Compra realizada com sucesso!');
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      text: controller.store.itemsOnCartCount > 0
                          ? 'Concluir compra'
                          : 'Ver produtos',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const PageFooter(),
        ],
      ),
    );
  }
}
