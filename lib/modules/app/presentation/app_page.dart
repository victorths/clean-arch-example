import '../../../commons/commons.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xFFE3E3E3),
        child: SafeArea(
          bottom: true,
          child: Image.asset(Assets.logoBlack),
        ),
      ),
      body: const RouterOutlet(),
    );
  }
}
