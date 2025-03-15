// 📂 lib/widgets/summary_card.dart
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: ListTile(
          leading: Icon(icon, size: 40),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(value),
        ),
      ),
    );
  }
}
