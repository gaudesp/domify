// lib/widgets/tiles/house_tile.dart
import 'package:flutter/material.dart';
import 'package:domify/models/house.dart';
import 'package:domify/screens/devices_screen.dart';

class HouseTile extends StatelessWidget {
  final House house;

  const HouseTile({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(house.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${house.devices.length} appareils'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DevicesScreen(house: house)),
          );
        },
      ),
    );
  }
}
