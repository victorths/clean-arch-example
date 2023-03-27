import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../commons/commons.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(Routes.home);

    return MaterialApp.router(
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
          tertiary: Color(0xFF999999),
          scrim: Color(0xFF00AD1D),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            height: 1.2,
            color: Color(0xFF1A1A1A),
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            height: 1.2,
            color: Color(0xFF1A1A1A),
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.2,
            color: Color(0xFF1A1A1A),
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF1A1A1A),
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
          labelLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Color(0xFF1A1A1A),
          ),
          labelMedium: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
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
    );
  }
}
