// Ignore for testing purposes
// ignore_for_file: prefer_const_constructors

import 'package:cuponsito_app/app/app.dart';
import 'package:cuponsito_app/app/modules/auth/ui/pages/welcome_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders WelcomePage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(WelcomePage), findsOneWidget);
    });
  });
}
