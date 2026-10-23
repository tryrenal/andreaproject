import 'package:andreaproject/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:andreaproject/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end to end test', () {
    testWidgets('verify login screen with corrent username and password', (
      tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(0), 'username');
      await tester.enterText(find.byType(TextFormField).at(1), 'password');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('verify login screen with incorrent username and password', (
      tester,
    ) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(0), 'renal');
      await tester.enterText(find.byType(TextFormField).at(1), 'renal123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('Invalid username or password'), findsOneWidget);
    });
  });
}
