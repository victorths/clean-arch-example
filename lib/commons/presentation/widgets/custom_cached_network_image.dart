import '../../commons.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.size,
    required this.image,
  });

  final String? image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CachedNetworkImage(
            imageUrl: image!,
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            placeholder: (context, url) => SkeletonContainer(
              height: size.height,
              width: size.width,
            ),
            errorWidget: (context, url, error) => const Placeholder(),
          )
        : const Placeholder();
  }
}
