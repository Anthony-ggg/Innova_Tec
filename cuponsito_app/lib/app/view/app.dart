import 'package:cuponsito_app/app/modules/common/ui/pages/home_page.dart';
import 'package:cuponsito_app/app/modules/auth/ui/pages/sign_in_page.dart';
import 'package:cuponsito_app/app/modules/auth/ui/pages/sign_up_page.dart';
import 'package:cuponsito_app/app/modules/auth/ui/pages/welcome_page.dart';
import 'package:cuponsito_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const WelcomePage(),
      routes: {
        '/login': (context) => const SignInPage(),
        '/register': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
