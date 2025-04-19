import 'package:flutter/material.dart';

class ActivityType {
  final String id;
  final String title;
  final IconData icon;

  ActivityType({required this.id, required this.title, required this.icon});
}

final List<ActivityType> activityTypes = [
  ActivityType(id: 'activity', title: 'Random', icon: Icons.question_mark),
  ActivityType(id: 'education', title: 'Education', icon: Icons.school),
  ActivityType(
    id: 'recreational',
    title: 'Recreational',
    icon: Icons.sports_handball,
  ),
  ActivityType(id: 'social', title: 'Social', icon: Icons.people),
  ActivityType(id: 'diy', title: 'DIY', icon: Icons.build),
  ActivityType(id: 'charity', title: 'Charity', icon: Icons.card_giftcard),
  ActivityType(id: 'cooking', title: 'Cooking', icon: Icons.restaurant),
  ActivityType(id: 'relaxation', title: 'Relaxation', icon: Icons.beach_access),
  ActivityType(id: 'music', title: 'Music', icon: Icons.music_note),
  ActivityType(id: 'busywork', title: 'Busywork', icon: Icons.work),
];
