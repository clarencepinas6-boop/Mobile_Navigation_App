import 'package:flutter/foundation.dart';

/// A session checked inside the app. There is no account server.
class LocalAuth extends ChangeNotifier {
  static const demoUsername = 'demo';
  static const demoPassword = 'password';

  String? _username;

  String? get username => _username;

  bool get isSignedIn => _username != null;

  /// Returns true when [username] and [password] match the local account.
  bool signIn(String username, String password) {
    final name = username.trim();
    final matches =
        name.toLowerCase() == demoUsername && password == demoPassword;
    if (!matches) {
      return false;
    }
    _username = demoUsername;
    notifyListeners();
    return true;
  }

  void signOut() {
    if (_username == null) {
      return;
    }
    _username = null;
    notifyListeners();
  }
}
