import 'package:flutter/material.dart';
import '../models/alarm.dart';
import 'add_alarm_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Alarm> _alarms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alarmas')),
      body: ListView.builder(
        itemCount: _alarms.length,
        itemBuilder: (context, index) {
          final alarm = _alarms[index];
          return ListTile(
            title: Text(alarm.time.format(context)),
            subtitle: Text('Tono: \${alarm.tone}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newAlarm = await Navigator.push<Alarm>(
            context,
            MaterialPageRoute(builder: (_) => AddAlarmScreen()),
          );
          if (newAlarm != null) {
            setState(() => _alarms.add(newAlarm));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
