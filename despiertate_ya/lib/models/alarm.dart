import 'package:flutter/material.dart';

class Alarm {
  final int id;
  final TimeOfDay time;
  final List<int> repeatDays; // 0 = domingo, 1 = lunes, etc.
  final String tone;

  Alarm({required this.id, required this.time, required this.repeatDays, required this.tone});
}
