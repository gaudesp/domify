// lib/screens/devices_screen.dart

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/house.dart';
import 'add_device_screen.dart';

class DevicesScreen extends StatefulWidget {
  final House house;

  const DevicesScreen({Key? key, required this.house}) : super(key: key);

  @override
  _DevicesScreenState createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appareils de ${widget.house.name}'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<House>('houses').listenable(),
        builder: (context, Box<House> box, _) {
          House? updatedHouse = box.values.firstWhere(
            (h) => h.key == widget.house.key,
            orElse: () => widget.house,
          );

          if (updatedHouse == null || updatedHouse.devices.isEmpty) {
            return const Center(child: Text('Aucun appareil ajouté.'));
          }

          return ListView.builder(
            itemCount: updatedHouse.devices.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(updatedHouse.devices[index].name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDeviceScreen(house: widget.house)),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
