import 'package:flutter/material.dart';

import 'auth/local_auth.dart';
import 'screens/login_screen.dart';
import 'screens/shell_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.auth});

  /// When set, the app uses this session instead of creating its own.
  final LocalAuth? auth;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocalAuth _auth;
  late final bool _ownsAuth;

  @override
  void initState() {
    super.initState();
    final provided = widget.auth;
    _ownsAuth = provided == null;
    _auth = provided ?? LocalAuth();
  }

  @override
  void dispose() {
    if (_ownsAuth) {
      _auth.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Navigation',
      debugShowCheckedModeBanner: false,
      theme: _theme(Brightness.light),
      darkTheme: _theme(Brightness.dark),
      home: AuthGate(auth: _auth),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key, required this.auth});

  final LocalAuth auth;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: auth,
      builder: (context, _) {
        if (auth.isSignedIn) {
          return ShellScreen(auth: auth);
        }
        return LoginScreen(auth: auth);
      },
    );
  }
}

ThemeData _theme(Brightness brightness) {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF0F6E6B),
    brightness: brightness,
  );
  return ThemeData(
    colorScheme: scheme,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
