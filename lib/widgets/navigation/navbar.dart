// lib/widgets/navigation/navbar.dart
import 'package:flutter/material.dart';
import 'package:domify/screens/home.dart';
import 'package:domify/screens/houses/list_houses.dart';

class NavigationBarWidget extends StatelessWidget {
  final int selectedIndex;

  const NavigationBarWidget({Key? key, required this.selectedIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index != selectedIndex) {
      Widget nextScreen = index == 0 ? const HomeScreen() : const ListHousesScreen();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => nextScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Maisons'),
      ],
      currentIndex: selectedIndex,
      onTap: (index) => _onItemTapped(context, index),
    );
  }
}
