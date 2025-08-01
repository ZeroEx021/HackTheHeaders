import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(DespiertateYaApp());
}

class DespiertateYaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despi\u00e9rtate Ya',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
