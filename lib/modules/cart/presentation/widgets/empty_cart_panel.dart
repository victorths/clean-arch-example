import '../../../../commons/commons.dart';

class EmptyCartPanel extends StatelessWidget {
  const EmptyCartPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.shopping_cart_outlined,
          size: 40,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          'Carrinho está vazio',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Aproveite as nossas promoções e adicione aqui os produtos que deseja comprar!',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
