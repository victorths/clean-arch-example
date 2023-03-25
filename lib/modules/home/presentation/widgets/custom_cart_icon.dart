import '../../../../commons/commons.dart';

class CustomCartIcon extends StatelessWidget {
  const CustomCartIcon({
    super.key,
    required this.itemsOnCart,
  });

  final int itemsOnCart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Modular.to.pushNamed(Routes.cart),
          icon: const Icon(
            Icons.shopping_cart_outlined,
            size: 20,
          ),
        ),
        Positioned(
          top: 6,
          right: 10,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                itemsOnCart.toString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        )
      ],
    );
  }
}
