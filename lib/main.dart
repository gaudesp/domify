// lib/main.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:domify/models/house.dart';
import 'package:domify/models/device.dart';
import 'package:domify/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HouseAdapter());
  Hive.registerAdapter(DeviceAdapter());
  await Hive.openBox<House>('houses');
  await Hive.openBox<Device>('devices');

  runApp(const DomifyApp());
}

class DomifyApp extends StatelessWidget {
  const DomifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domify',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
