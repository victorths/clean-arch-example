import '../../../../commons/commons.dart';
import '../../../home/domain/entities/promotion.dart';

class CartResume extends StatelessWidget {
  const CartResume({
    super.key,
    required this.itemsOnCart,
  });

  final Map<PromotionEntity, int> itemsOnCart;

  @override
  Widget build(BuildContext context) {
    final shippingCost = itemsOnCart.entries.fold<double>(0,
        (previousValue, element) => previousValue += element.key.shippingValue);
    return Column(
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
              shippingCost == 0
                  ? 'Grátis'
                  : shippingCost.formatNumberWithSpacing,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: shippingCost == 0
                        ? Theme.of(context).colorScheme.scrim
                        : null,
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
    );
  }
}
