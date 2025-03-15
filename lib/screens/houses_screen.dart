// lib/screens/houses_screen.dart

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/house.dart';
import 'add_house_screen.dart';
import 'devices_screen.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var houseBox = Hive.box<House>('houses');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maisons'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddHouseScreen()),
              );
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: houseBox.listenable(),
        builder: (context, Box<House> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('Aucune maison ajoutée.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              House house = box.getAt(index)!;
              return ListTile(
                title: Text(house.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DevicesScreen(house: house),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHouseScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
