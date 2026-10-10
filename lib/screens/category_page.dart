import 'package:flutter/material.dart';

import '../models/category.dart';
import 'item_detail_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.separated(
      key: Key('category-${category.id}'),
      padding: const EdgeInsets.all(16),
      itemCount: category.items.length + 1,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return _CategoryHeader(category: category, theme: theme);
        }
        final item = category.items[index - 1];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            title: Text(item.title),
            subtitle: Text(item.summary),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) =>
                      ItemDetailPage(category: category, item: item),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({required this.category, required this.theme});

  final Category category;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: category.color.withValues(alpha: 0.12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: category.color.withValues(alpha: 0.18),
              child: Icon(category.selectedIcon, color: category.color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.name, style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(category.tagline, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
