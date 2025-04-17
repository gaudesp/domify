// lib/widgets/tiles/device_tile.dart
import 'package:flutter/material.dart';
import 'package:domify/models/device.dart';

class DeviceTile extends StatelessWidget {
  final Device device;

  const DeviceTile({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(device.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.settings),
        onTap: () {
          // Action à définir (ex: ouvrir les paramètres de l’appareil)
        },
      ),
    );
  }
}
