import 'dart:math';

class CalucutationBrain {
  CalucutationBrain({
    required this.height,
    required this.weight,
  });
  final double height;
  final int weight;

  double bmi = 0;

  String calucutateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String result() {
    if (bmi < 18.5) {
      return 'Your BMI is below the healthy range. You may need to gain weight.';
    } else if (bmi < 25) {
      return 'Your BMI is within the healthy range. Keep up the good work!';
    } else if (bmi < 30) {
      return 'Your BMI is above the healthy range. You may need to lose weight.';
    } else {
      return 'Your BMI is in the obese range.';
    }
  }
}
