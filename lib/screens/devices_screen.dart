// lib/screens/devices_screen.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:domify/models/house.dart';
import 'package:domify/screens/add_device_screen.dart';
import 'package:domify/widgets/navigation/navbar.dart';
import 'package:domify/widgets/tiles/device_tile.dart';
import 'package:domify/widgets/buttons/add_button.dart';

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
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 1),
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
              return DeviceTile(device: updatedHouse.devices[index]);
            },
          );
        },
      ),
      floatingActionButton: AddButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDeviceScreen(house: widget.house)),
          );
          setState(() {});
        },
      ),
    );
  }
}
