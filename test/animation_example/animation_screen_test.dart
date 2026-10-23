import 'package:andreaproject/animation_example/animation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('animation screen test', (tester) async {
    await tester.pumpWidget(MaterialApp(home: AnimationScreen()));
    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    var containerWidget = tester.widget<Container>(containerFinder);

    //initial
    expect(containerWidget.constraints!.minWidth, 50);
    expect(containerWidget.constraints!.minHeight, 50);
    expect((containerWidget.decoration as BoxDecoration).color, Colors.blue);
    expect(
      (containerWidget.decoration as BoxDecoration).borderRadius,
      BorderRadius.zero,
    );

    await tester.pumpAndSettle();
    containerFinder = find.byType(Container);
    containerWidget = tester.widget<Container>(containerFinder);
    expect(containerWidget.constraints!.minWidth, 200);
    expect(containerWidget.constraints!.minHeight, 200);
    expect((containerWidget.decoration as BoxDecoration).color, Colors.green);
    expect(
      (containerWidget.decoration as BoxDecoration).borderRadius,
      BorderRadius.circular(50),
    );
  });
}
