// 📂 lib/widgets/add_button.dart
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const AddButton({Key? key, required this.onPressed, this.icon = Icons.add}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
