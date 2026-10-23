import 'package:andreaproject/counter_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'given counter is zero when increment button click then counter should be one',
    (tester) async {
      //to initialization
      await tester.pumpWidget(
        const MaterialApp(home: MyHomePage(title: 'Counter App')),
      );

      final ctr = find.text('0');
      expect(ctr, findsOneWidget);

      final ctr2 = find.text('1');
      expect(ctr2, findsNothing);

      // final incrementButton = find.byType(FloatingActionButton);
      final incrementButton = find.byKey(Key('increment_counter'));
      await tester.tap(incrementButton);

      //to trigger like setState
      await tester.pump();

      final ctr3 = find.text('1');
      expect(ctr3, findsOneWidget);

      final ctr4 = find.text('0');
      expect(ctr4, findsNothing);

      expect(find.byType(AppBar), findsOneWidget);
    },
  );
}
