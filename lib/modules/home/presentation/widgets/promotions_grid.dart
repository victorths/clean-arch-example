import 'package:eng_gruposbf_mobile_flutter/modules/home/domain/entities/promotion.dart';

import '../../../../commons/commons.dart';
import 'promotion_grid_view.dart';

class PromotionsGrid extends StatelessWidget {
  const PromotionsGrid({
    super.key,
    required this.promotions,
  });

  final List<PromotionEntity> promotions;

  @override
  Widget build(BuildContext context) {
    return PromotionGridView(
      children: promotions
          .map(
            (promotion) => PromotionItem(promotion: promotion),
          )
          .toList(),
    );
  }
}

class PromotionItem extends StatelessWidget {
  const PromotionItem({
    super.key,
    required this.promotion,
  });

  final PromotionEntity promotion;

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
      ],
    );
  }
}
