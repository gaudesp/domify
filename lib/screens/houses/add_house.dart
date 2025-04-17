// lib/screens/houses/add_house.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:domify/models/house.dart';
import 'package:domify/widgets/navigation/navbar.dart';
import 'package:domify/widgets/forms/custom_text_field.dart';

class AddHouseScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une maison')),
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _controller,
              label: 'Nom de la maison',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ est requis';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  var houseBox = Hive.box<House>('houses');
                  houseBox.add(House(name: _controller.text));
                  Navigator.pop(context);
                }
              },
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
