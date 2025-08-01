import 'dart:math';

class MathGenerator {
  static String generateProblem(int difficulty) {
    final rand = Random();
    int a = rand.nextInt(difficulty * 10);
    int b = rand.nextInt(difficulty * 10);
    return '$a + $b';
  }

  static int solve(String problem) {
    var parts = problem.split('+');
    return int.parse(parts[0]) + int.parse(parts[1]);
  }
}
