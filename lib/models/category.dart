import 'package:flutter/material.dart';

class CategoryItem {
  const CategoryItem({
    required this.title,
    required this.summary,
    required this.detail,
  });

  final String title;
  final String summary;
  final String detail;
}

class Category {
  const Category({
    required this.id,
    required this.name,
    required this.tagline,
    required this.icon,
    required this.selectedIcon,
    required this.color,
    required this.items,
  });

  final String id;
  final String name;
  final String tagline;
  final IconData icon;
  final IconData selectedIcon;
  final Color color;
  final List<CategoryItem> items;
}

const appCategories = <Category>[
  Category(
    id: 'food',
    name: 'Food',
    tagline: 'Kitchens, recipes, and the Saturday market.',
    icon: Icons.restaurant_outlined,
    selectedIcon: Icons.restaurant,
    color: Color(0xFFC2410C),
    items: [
      CategoryItem(
        title: 'Neighborhood kitchens',
        summary: 'Counters, short menus, and rooms that fill up early.',
        detail:
            'These are the places that stay busy without advertising. '
            'Sit at the counter if you can, and order what the kitchen '
            'is already cooking.',
      ),
      CategoryItem(
        title: 'Weeknight recipes',
        summary: 'Meals that finish before the evening disappears.',
        detail:
            'Each recipe uses one pan and ingredients you can keep on hand. '
            'Start the rice or pasta first, then build the rest while it cooks.',
      ),
      CategoryItem(
        title: 'Saturday market',
        summary: 'What is worth carrying home this week.',
        detail:
            'Go early for the fruit and bread. Buy less than you can carry, '
            'and leave room for one thing you did not plan on.',
      ),
    ],
  ),
  Category(
    id: 'travel',
    name: 'Travel',
    tagline: 'Walks, trains, and a slow road along the coast.',
    icon: Icons.flight_outlined,
    selectedIcon: Icons.flight,
    color: Color(0xFF0369A1),
    items: [
      CategoryItem(
        title: 'City walks',
        summary: 'Routes you can do without a ticket or a plan.',
        detail:
            'Start at a station and follow the water or a market street. '
            'Stop when the neighborhood changes. Two hours is enough.',
      ),
      CategoryItem(
        title: 'Overnight trains',
        summary: 'Sleep on the way and arrive somewhere else.',
        detail:
            'Book a berth, pack a small bag, and keep the morning free. '
            'Pick a route with a view at sunrise.',
      ),
      CategoryItem(
        title: 'Coast roads',
        summary: 'A day of windows, pull-offs, and one long lunch.',
        detail:
            'Leave after breakfast and take the slower road. Stop where '
            'you can see the water, and eat before you turn back.',
      ),
    ],
  ),
  Category(
    id: 'tech',
    name: 'Tech',
    tagline: 'Tools, quiet software, and working away from a desk.',
    icon: Icons.devices_outlined,
    selectedIcon: Icons.devices,
    color: Color(0xFF4338CA),
    items: [
      CategoryItem(
        title: 'Field notes',
        summary: 'Tools people still use after the first week.',
        detail:
            'The useful ones are small and easy to leave open. Try a tool '
            'on real work for a few days before you decide to keep it.',
      ),
      CategoryItem(
        title: 'Quiet software',
        summary: 'Apps that stay out of the way.',
        detail:
            'Look for software that does one job and then waits. Turn off '
            'the extra notices before you judge it.',
      ),
      CategoryItem(
        title: 'Away from the desk',
        summary: 'A small kit for working somewhere else.',
        detail:
            'A laptop, a charger, and one notebook cover most days. Pick a '
            'seat with an outlet and leave the rest of the bag closed.',
      ),
    ],
  ),
  Category(
    id: 'sports',
    name: 'Sports',
    tagline: 'Easy miles, pickup games, and match day.',
    icon: Icons.sports_soccer_outlined,
    selectedIcon: Icons.sports_soccer,
    color: Color(0xFF047857),
    items: [
      CategoryItem(
        title: 'Morning miles',
        summary: 'Easy routes for a run before the day starts.',
        detail:
            'Keep the first mile slow and pick a loop you can cut short. '
            'Finish feeling like you could do it again tomorrow.',
      ),
      CategoryItem(
        title: 'Pickup games',
        summary: 'Where a full team is optional.',
        detail:
            'Find a court or field with a regular evening game. Arrive a '
            'little early, and rotate in when the players wave you on.',
      ),
      CategoryItem(
        title: 'Match day',
        summary: 'What to sort out before you go.',
        detail:
            'Check the start time, the gate, and the weather. Arrive early '
            'enough to sit down before the line at the entrance gets long.',
      ),
    ],
  ),
  Category(
    id: 'music',
    name: 'Music',
    tagline: 'Albums, small rooms, and a short practice log.',
    icon: Icons.music_note_outlined,
    selectedIcon: Icons.music_note,
    color: Color(0xFFBE185D),
    items: [
      CategoryItem(
        title: 'Second listen',
        summary: 'Records that make more sense the second time.',
        detail:
            'Play the whole album once without skipping. The tracks that '
            'felt plain often land after you know where they are going.',
      ),
      CategoryItem(
        title: 'Small rooms',
        summary: 'Venues where you can hear the band and the room.',
        detail:
            'Stand where you can see the speakers, not just the stage. A '
            'smaller room is worth it when the sound is clear.',
      ),
      CategoryItem(
        title: 'Practice log',
        summary: 'Short sessions you can repeat.',
        detail:
            'Twenty focused minutes beats an hour of wandering. Write down '
            'the one passage you worked on so the next session starts there.',
      ),
    ],
  ),
];
