// lib/screens/devices/list_devices.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:domify/models/house.dart';
import 'package:domify/screens/devices/add_device.dart';
import 'package:domify/widgets/navigation/navbar.dart';
import 'package:domify/widgets/tiles/device_tile.dart';
import 'package:domify/widgets/buttons/add_button.dart';

class ListDevicesScreen extends StatefulWidget {
  final House house;

  const ListDevicesScreen({super.key, required this.house});

  @override
  _ListDevicesScreenState createState() => _ListDevicesScreenState();
}

class _ListDevicesScreenState extends State<ListDevicesScreen> {
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
