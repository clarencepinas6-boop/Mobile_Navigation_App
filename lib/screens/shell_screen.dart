import 'package:flutter/material.dart';

import '../auth/local_auth.dart';
import '../models/category.dart';
import 'category_page.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key, required this.auth});

  final LocalAuth auth;

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final category = appCategories[_index];

    return Scaffold(
      key: const Key('home-shell'),
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          IconButton(
            key: const Key('sign-out'),
            tooltip: 'Sign out',
            onPressed: widget.auth.signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: [
          for (final category in appCategories)
            CategoryPage(key: ValueKey(category.id), category: category),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (index) => setState(() => _index = index),
        destinations: [
          for (final category in appCategories)
            NavigationDestination(
              icon: Icon(category.icon),
              selectedIcon: Icon(category.selectedIcon),
              label: category.name,
            ),
        ],
      ),
    );
  }
}
