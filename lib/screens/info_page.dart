import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import '../containts.dart';
import '../widgets/info_card.dart';

class InfoPage extends StatelessWidget {
  final String bmi;
  final String resultText;

  const InfoPage({
    required this.bmi,
    required this.resultText,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: const Color(0xffECECEC),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    NeumorphicButton(
                      padding: const EdgeInsets.all(8),
                      onPressed: () => Navigator.of(context).pop(),
                      style: const NeumorphicStyle(
                          intensity: 1,
                          depth: 2,
                          color: Color(0xffededed),
                          boxShape: NeumorphicBoxShape.circle()),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.26,
                    ),
                    Text(
                      'BMI Info',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 49.0),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: foregroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: outerShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Your BMI',
                        style: TextStyle(
                            color: darkTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        bmi,
                        style: TextStyle(
                          color: darkTextColor,
                          fontSize: 32.0,
                        ),
                      ),
                      Text(
                        result1(),
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: foregroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: outerShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InfoCard(
                        lowerBMI: 'Less than 18.5',
                        bmiResult: 'Underweight',
                      ),
                      const Divider(height: 40.0),
                      InfoCard(
                        lowerBMI: '18.5',
                        upperBMI: '24.5',
                        bmiResult: 'Normal',
                      ),
                      const Divider(height: 40.0),
                      InfoCard(
                        lowerBMI: '25',
                        upperBMI: '29.5',
                        bmiResult: 'Overweight',
                      ),
                      const Divider(height: 40.0),
                      InfoCard(
                        lowerBMI: 'More than 29.5',
                        bmiResult: 'Obesity',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              NeumorphicButton(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                    top: 15,
                    bottom: 15),
                onPressed: () {},
                style: NeumorphicStyle(color: kActiveColor),
                child: const Text(
                  'Save details',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  String result1() {
    double bmiResult = double.parse(bmi).toDouble();
    if (bmiResult < 18.5) {
      return 'Under weight';
    } else if (bmiResult < 25) {
      return 'Normal';
    } else if (bmiResult < 30) {
      return 'Over weight';
    } else {
      return 'obese range';
    }
  }
}
