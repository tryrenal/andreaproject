import 'package:andreaproject/users_example/home_screen.dart';
import 'package:andreaproject/users_example/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'display list of users with title as name and subtitle as email',
    (tester) async {
      final users = [
        User(id: 1, name: 'sabdo', email: 'sabdo@gmail.com'),
        User(id: 2, name: 'renal', email: 'renal@gmail.com'),
      ];

      // Future<List<User>> mockFetchUsers() async {
      //   return users;
      // }

      Future<List<User>> mockFetchUsers() async {
        return Future.delayed(Duration(seconds: 1), () => users);
      }

      await tester.pumpWidget(
        MaterialApp(home: HomeScreen(futureUsers: mockFetchUsers())),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // await tester.pump();
      //keep calling pump until delay done or waiting for result.
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);

      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
