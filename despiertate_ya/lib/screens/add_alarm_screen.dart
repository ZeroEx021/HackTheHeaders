import 'package:flutter/material.dart';
import '../models/alarm.dart';

class AddAlarmScreen extends StatefulWidget {
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  TimeOfDay _time = TimeOfDay.now();
  String _tone = 'default';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nueva Alarma')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Hora: \${_time.format(context)}'),
              trailing: Icon(Icons.timer),
              onTap: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: _time,
                );
                if (picked != null) setState(() => _time = picked);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tono'),
              onChanged: (v) => _tone = v,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final alarm = Alarm(
                  id: DateTime.now().millisecondsSinceEpoch,
                  time: _time,
                  repeatDays: [],
                  tone: _tone,
                );
                Navigator.pop(context, alarm);
              },
              child: Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
