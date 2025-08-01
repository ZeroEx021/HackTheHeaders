import 'package:flutter/material.dart';
import '../utils/math_generator.dart';

class ChallengeScreen extends StatefulWidget {
  final VoidCallback onSuccess;
  const ChallengeScreen({required this.onSuccess});

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  late String _problem;
  final _controller = TextEditingController();
  int _difficulty = 1;

  @override
  void initState() {
    super.initState();
    _problem = MathGenerator.generateProblem(_difficulty);
  }

  void _checkAnswer() {
    final answer = int.tryParse(_controller.text);
    if (answer == MathGenerator.solve(_problem)) {
      widget.onSuccess();
    } else {
      setState(() {
        _difficulty++;
        _problem = MathGenerator.generateProblem(_difficulty);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Desaf\u00edo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Resuelve: \n\n$_problem', style: TextStyle(fontSize: 24)),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _checkAnswer(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: Text('Responder'),
            )
          ],
        ),
      ),
    );
  }
}
