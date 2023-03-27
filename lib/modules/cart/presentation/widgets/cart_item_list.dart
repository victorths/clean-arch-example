import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

import '../../../../commons/commons.dart';

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              'Resumo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  itemsOnCart.entries
                      .fold<double>(
                          0,
                          (previousValue, element) => previousValue +=
                              (element.key.oldPrice ?? element.key.price ?? 0) *
                                  element.value)
                      .formatNumberWithSpacing,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xFF1A1A1A),
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Desconto:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '- ${itemsOnCart.entries.fold<double>(0, (previousValue, element) => previousValue += element.key.oldPrice != null ? (element.key.oldPrice! - element.key.price!) * element.value : 0).formatNumberWithSpacing}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.scrim,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Frete:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'Grátis',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.scrim,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  itemsOnCart.entries
                      .fold<double>(
                          0,
                          (previousValue, element) => previousValue +=
                              (element.key.price ?? 0) * element.value)
                      .formatNumberWithSpacing,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xFF1A1A1A),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        )
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.item,
    required this.interactWithItemCount,
  });

  final MapEntry<PromotionEntity, int> item;
  final void Function(PromotionEntity, int) interactWithItemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
            CustomCachedNetworkImage(
              image: item.key.image,
              size: const Size.square(73),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 73,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RectangleBorderIconButtom(
                    icon: Icons.remove,
                    onPressed: item.value > 1
                        ? () => interactWithItemCount(item.key, -1)
                        : null,
                  ),
                  Text(
                    item.value.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  RectangleBorderIconButtom(
                    icon: Icons.add,
                    onPressed: () => interactWithItemCount(item.key, 1),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.key.name!,
                style: Theme.of(context).textTheme.labelLarge!,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    'Total: ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (item.key.oldPrice != null)
                    Text(
                      '${item.key.oldPrice!.formatNumber} ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color(0xFF737373),
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  Text(
                    '${item.key.price!.formatNumber} ',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (item.key.discount != null)
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Theme.of(context).colorScheme.scrim,
                          size: 20,
                        ),
                        Text(
                          '${item.key.discount.toString()}%',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Theme.of(context).colorScheme.scrim,
                                  ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              // Alguma dessas informações não tem na entidade e outras seria necessário a
              // construção de um componente para o usuário informar (tamanho e cor) mas o figma não os descrevem.
              // Preferi deixar dessa forma para simplificar o projeto
              Row(
                children: [
                  Text(
                    'Tamanho: 37',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Cor: branco',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Produto vendido e entregue por: Centauro',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color(0xFF737373),
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Entrega estimada: 5 a 6 dias úteis',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color(0xFF737373),
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Produto em estoque',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.scrim,
                    ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => interactWithItemCount(item.key, 0),
          icon: const Icon(
            Icons.delete_outline,
          ),
        )
      ],
    );
  }
}
