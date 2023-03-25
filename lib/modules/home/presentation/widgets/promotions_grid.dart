import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

import '../../../../commons/commons.dart';
import 'promotion_grid_view.dart';

class PromotionsGrid extends StatelessWidget {
  const PromotionsGrid({
    super.key,
    required this.promotions,
    required this.onAddItemToCart,
  });

  final List<PromotionEntity> promotions;
  final void Function(PromotionEntity) onAddItemToCart;

  @override
  Widget build(BuildContext context) {
    return PromotionGridView(
      children: promotions
          .map(
            (promotion) => PromotionItem(
              promotion: promotion,
              onAddItemToCart: onAddItemToCart,
            ),
          )
          .toList(),
    );
  }
}

class PromotionItem extends StatelessWidget {
  const PromotionItem({
    super.key,
    required this.promotion,
    required this.onAddItemToCart,
  });

  final PromotionEntity promotion;
  final void Function(PromotionEntity) onAddItemToCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: promotion.image != null
              ? CachedNetworkImage(
                  imageUrl: promotion.image!,
                  height: 120,
                  alignment: Alignment.center,
                  placeholder: (context, url) => const SkeletonContainer(
                    height: 120,
                    width: double.infinity,
                  ),
                  errorWidget: (context, url, error) => const Placeholder(),
                )
              : const Placeholder(),
        ),
        if (promotion.freeShipping)
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(4)),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            margin: const EdgeInsets.only(bottom: 4),
            child: Text(
              'Frete grátis',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
        Text(
          promotion.name ?? '',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Row(
          children: [
            StarsRate(rate: promotion.rate.toDouble()),
            if (promotion.reviews != null)
              Text(
                '(${promotion.reviews})',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
          ],
        ),
        if (promotion.oldPrice != null)
          Text(
            promotion.oldPrice!.formatNumber,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Theme.of(context).colorScheme.tertiary,
                ),
          ),
        Row(
          children: [
            Text(
              promotion.price!.formatNumber,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (promotion.discount != null)
              Row(
                children: [
                  Icon(
                    Icons.arrow_downward,
                    color: Theme.of(context).colorScheme.scrim,
                    size: 20,
                  ),
                  Text(
                    '${promotion.discount.toString()}%',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.scrim,
                        ),
                  ),
                ],
              ),
          ],
        ),
        // Aqui deveria ter a informação das parcelas, porém não existe tal informação sendo fornecida pelo backend
        // Text(
        //   promotion.installments,
        //   style: Theme.of(context).textTheme.bodySmall!.copyWith(
        //         color: Theme.of(context).colorScheme.scrim,
        //       ),
        // ),
        const Expanded(
          child: SizedBox(),
        ),
        CustomFilledButtom(
          onPressed: () {
            onAddItemToCart(promotion);
            showToast(context, 'Produto adicionado ao carrinho');
          },
          text: 'Comprar',
        )
      ],
    );
  }
}

class StarsRate extends StatelessWidget {
  const StarsRate({
    super.key,
    this.rate = 0,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [for (int i = 1; i <= 5; i++) _buildIcon(i, rate, context)],
    );
  }

  Widget _buildIcon(int i, double rate, BuildContext context) {
    return Icon(
      rate >= i
          ? Icons.star
          : rate > i - 1
              ? Icons.star_half
              : Icons.star_border,
      color: const Color(0xFFF8CD46),
    );
  }
}
