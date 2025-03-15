// lib/models/device.dart
import 'package:hive/hive.dart';

part 'device.g.dart';

@HiveType(typeId: 1)
class Device extends HiveObject {
  @HiveField(0)
  String name;

  Device({required this.name});
}
