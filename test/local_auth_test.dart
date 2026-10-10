import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_navigation/auth/local_auth.dart';

void main() {
  test('accepts the local account, ignoring case and surrounding spaces', () {
    final auth = LocalAuth();

    expect(auth.signIn(' Demo ', LocalAuth.demoPassword), isTrue);

    expect(auth.isSignedIn, isTrue);
    expect(auth.username, LocalAuth.demoUsername);
  });

  test('rejects a different password', () {
    final auth = LocalAuth();

    expect(auth.signIn(LocalAuth.demoUsername, 'wrong'), isFalse);

    expect(auth.isSignedIn, isFalse);
    expect(auth.username, isNull);
  });

  test('signOut clears the session and is safe to call twice', () {
    final auth = LocalAuth()
      ..signIn(LocalAuth.demoUsername, LocalAuth.demoPassword);

    auth.signOut();
    auth.signOut();

    expect(auth.isSignedIn, isFalse);
    expect(auth.username, isNull);
  });
}
