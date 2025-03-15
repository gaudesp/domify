// lib/screens/houses_screen.dart

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:domify/models/house.dart';
import 'package:domify/screens/add_house_screen.dart';
import 'package:domify/widgets/navigation/navbar.dart';
import 'package:domify/widgets/tiles/house_tile.dart';
import 'package:domify/widgets/buttons/add_button.dart';

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
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 1),
      body: ValueListenableBuilder(
        valueListenable: houseBox.listenable(),
        builder: (context, Box<House> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('Aucune maison ajoutée.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return HouseTile(house: box.getAt(index)!);
            },
          );
        },
      ),
      floatingActionButton: AddButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHouseScreen()),
          );
        },
      ),
    );
  }
}
