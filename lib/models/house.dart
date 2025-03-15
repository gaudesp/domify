// lib/models/house.dart
import 'package:hive/hive.dart';
import 'device.dart';

part 'house.g.dart';

@HiveType(typeId: 0)
class House extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<Device> devices;

  House({required this.name, List<Device>? devices})
      : devices = devices ?? [];
}
