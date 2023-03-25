import '../../commons.dart';

class PageFooter extends StatelessWidget {
  const PageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFE3E3E3),
      child: SafeArea(
        bottom: true,
        child: Image.asset(Assets.logoBlack),
      ),
    );
  }
}
