import 'package:flutter/material.dart';

import '../models/category.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key, required this.category, required this.item});

  final Category category;
  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      key: const Key('item-detail'),
      appBar: AppBar(title: Text(item.title)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Icon(category.selectedIcon, color: category.color),
              const SizedBox(width: 8),
              Text(category.name, style: theme.textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: 16),
          Text(item.title, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(item.summary, style: theme.textTheme.titleMedium),
          const SizedBox(height: 16),
          Text(item.detail, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
