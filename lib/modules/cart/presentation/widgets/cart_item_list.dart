import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

import '../../../../commons/commons.dart';
import 'cart_item.dart';
import 'cart_resume.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
    required this.itemsOnCart,
    required this.interactWithItemCount,
  });

  final Map<PromotionEntity, int> itemsOnCart;
  final void Function(PromotionEntity, int) interactWithItemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) {
              final item = itemsOnCart.entries.toList()[index];
              return CartItem(
                item: item,
                interactWithItemCount: interactWithItemCount,
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 24,
              thickness: 1,
            ),
            itemCount: itemsOnCart.entries.length,
          ),
        ),
        CartResume(itemsOnCart: itemsOnCart)
      ],
    );
  }
}
