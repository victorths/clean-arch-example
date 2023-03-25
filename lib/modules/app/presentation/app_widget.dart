import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';

import '../../../commons/commons.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(Routes.home);

    return OKToast(
      position: ToastPosition.top,
      duration: 3.seconds,
      textPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: MaterialApp.router(
        title: 'Centauro',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFE30000),
            onPrimary: Colors.white,
            secondary: Color(0xFF465A64),
            onSecondary: Colors.white,
            error: Color(0xFF465A64),
            onError: Colors.white,
            background: Colors.white,
            onBackground: Color(0xFFD6D6D6),
            surface: Colors.white,
            onSurface: Color(0xFFE30000),
          ),
          textTheme: const TextTheme(
            labelMedium: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF999999),
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFF1A1A1A),
              height: 1.5,
            ),
            labelSmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 9,
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFFE30000),
          ),
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
      ),
    );
  }
}
