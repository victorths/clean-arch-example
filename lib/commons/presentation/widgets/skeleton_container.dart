import 'package:skeleton_text/skeleton_text.dart';

import '../../commons.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({
    this.height = 20,
    this.width,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      child: Container(
        margin: const EdgeInsets.all(4),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
