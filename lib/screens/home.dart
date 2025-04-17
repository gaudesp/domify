// lib/screens/home.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:domify/models/house.dart';
import 'package:domify/widgets/navigation/navbar.dart';
import 'package:domify/widgets/cards/summary.dart';
import 'package:domify/widgets/cards/welcome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var houseBox = Hive.box<House>('houses');
    int totalHouses = houseBox.length;
    int totalDevices = houseBox.values
        .map((house) => house.devices.length)
        .fold(0, (prev, count) => prev + count);

    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeCard(),
            const SizedBox(height: 20),
            Row(
              children: [
                SummaryCard(title: 'Maisons', value: '$totalHouses créées', icon: Icons.house),
                SummaryCard(title: 'Appareils', value: '$totalDevices ajoutés', icon: Icons.devices),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
