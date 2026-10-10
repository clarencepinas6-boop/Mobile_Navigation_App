import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_navigation/auth/local_auth.dart';
import 'package:mobile_navigation/main.dart';
import 'package:mobile_navigation/models/category.dart';

void main() {
  testWidgets('empty sign-in asks for a username and password', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('login-submit')));
    await tester.pump();

    expect(find.text('Enter a username.'), findsOneWidget);
    expect(find.text('Enter a password.'), findsOneWidget);
    expect(find.byKey(const Key('home-shell')), findsNothing);
  });

  testWidgets('a wrong password stays on the sign-in screen', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(
      find.byKey(const Key('login-username')),
      LocalAuth.demoUsername,
    );
    await tester.enterText(find.byKey(const Key('login-password')), 'wrong');
    await tester.tap(find.byKey(const Key('login-submit')));
    await tester.pump();

    expect(find.byKey(const Key('login-error')), findsOneWidget);
    expect(find.byKey(const Key('home-shell')), findsNothing);
  });

  testWidgets('sign-in opens five categories, an item, and sign-out', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await _signIn(tester);

    expect(find.byKey(const Key('home-shell')), findsOneWidget);
    expect(find.byKey(const Key('category-food')), findsOneWidget);

    for (final category in appCategories.skip(1)) {
      await tester.tap(find.text(category.name));
      await tester.pumpAndSettle();
      expect(find.byKey(Key('category-${category.id}')), findsOneWidget);
    }

    await tester.tap(find.text('Food'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('category-food')), findsOneWidget);

    await tester.tap(find.text('Neighborhood kitchens'));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('item-detail')), findsOneWidget);
    expect(find.textContaining('Sit at the counter'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('category-food')), findsOneWidget);

    await tester.tap(find.byKey(const Key('sign-out')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('login-username')), findsOneWidget);
    expect(find.byKey(const Key('home-shell')), findsNothing);
  });
}

Future<void> _signIn(WidgetTester tester) async {
  await tester.enterText(
    find.byKey(const Key('login-username')),
    LocalAuth.demoUsername,
  );
  await tester.enterText(
    find.byKey(const Key('login-password')),
    LocalAuth.demoPassword,
  );
  await tester.tap(find.byKey(const Key('login-submit')));
  await tester.pumpAndSettle();
}
