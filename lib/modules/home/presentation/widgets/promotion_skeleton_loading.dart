import '../../../../commons/commons.dart';
import 'promotion_grid_view.dart';

class PromotionsLoading extends StatelessWidget {
  const PromotionsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return PromotionGridView(
      children: [
        for (int i = 0; i < 6; i++) const PromotionLoadingItem(),
      ],
    );
  }
}

class PromotionLoadingItem extends StatelessWidget {
  const PromotionLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: SkeletonContainer(
            height: 120,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 45),
          child: SkeletonContainer(
            height: 16,
            width: double.infinity,
          ),
        ),
        SkeletonContainer(
          height: 16,
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.only(right: 30),
          child: SkeletonContainer(
            height: 22,
            width: double.infinity,
          ),
        ),
        Expanded(child: SizedBox()),
        SkeletonContainer(
          height: 36,
          width: double.infinity,
        )
      ],
    );
  }
}
