// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/house.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var houseBox = Hive.box<House>('houses');
    int totalHouses = houseBox.length;
    int totalDevices = houseBox.values
        .map((house) => house.devices.length)
        .fold(0, (prev, count) => prev + count);

    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Bienvenue sur Domify. Gérez vos maisons et appareils connectés.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: const Text('Maisons'),
                      subtitle: Text('$totalHouses créées'),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: const Text('Appareils'),
                      subtitle: Text('$totalDevices ajoutés'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
