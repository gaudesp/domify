// lib/screens/add_device_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:domify/models/house.dart';
import 'package:domify/models/device.dart';
import 'package:domify/widgets/navigation/navbar.dart';
import 'package:domify/widgets/indicators/loading.dart';

class AddDeviceScreen extends StatefulWidget {
  final House house;

  const AddDeviceScreen({Key? key, required this.house}) : super(key: key);

  @override
  _AddDeviceScreenState createState() => _AddDeviceScreenState();
}

class _AddDeviceScreenState extends State<AddDeviceScreen> {
  final List<Device> availableDevices = [
    Device(name: 'Lampe Philips Hue'),
    Device(name: 'Thermostat Nest'),
    Device(name: 'Caméra Ring'),
    Device(name: 'Aspirateur Roomba'),
    Device(name: 'Enceinte Alexa'),
  ];

  final List<Device> selectedDevices = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter des appareils')),
      bottomNavigationBar: const NavigationBarWidget(selectedIndex: 1),
      body: isLoading
          ? const LoadingIndicator()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: availableDevices.length,
                    itemBuilder: (context, index) {
                      final device = availableDevices[index];
                      final isSelected = selectedDevices.contains(device);

                      return ListTile(
                        title: Text(device.name),
                        trailing: Checkbox(
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedDevices.add(device);
                              } else {
                                selectedDevices.remove(device);
                              }
                            });
                          },
                        ),
                        onTap: () {
                          setState(() {
                            if (selectedDevices.contains(device)) {
                              selectedDevices.remove(device);
                            } else {
                              selectedDevices.add(device);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: selectedDevices.isEmpty
                        ? null
                        : () {
                            setState(() {
                              widget.house.devices.addAll(selectedDevices);
                              widget.house.save();
                            });
                            Navigator.pop(context);
                          },
                    child: const Text('Valider'),
                  ),
                ),
              ],
            ),
    );
  }
}
