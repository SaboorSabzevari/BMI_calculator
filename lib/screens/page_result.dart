import 'package:bmi_calculator/screens/info_page.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../containts.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.result,
    required this.bmi,
  }) : super(key: key);
  final String result;
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
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
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      'BMI Results',
                      style: TextStyle(color: kTextColor, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Neumorphic(
                  padding: const EdgeInsets.all(20),
                  style: const NeumorphicStyle(
                      intensity: 5,
                      depth: 2,
                      color: Color(0xffededed),
                      boxShape: NeumorphicBoxShape.circle()),
                  child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    animationDuration: 10,
                    axes: <RadialAxis>[
                      RadialAxis(
                        maximum: 30,
                        minimum: 12,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            color: Colors.blue,
                            startValue: 12,
                            endValue: 14,
                          ),
                          GaugeRange(
                            color: Colors.blue.shade300,
                            startValue: 14,
                            endValue: 17,
                          ),
                          GaugeRange(
                            color: Colors.green.shade300,
                            startValue: 17,
                            endValue: 20,
                          ),
                          GaugeRange(
                            color: Colors.green,
                            startValue: 20,
                            endValue: 25,
                          ),
                          GaugeRange(
                            color: Colors.red.shade300,
                            startValue: 25,
                            endValue: 27,
                          ),
                          GaugeRange(
                            color: Colors.red,
                            startValue: 27,
                            endValue: 30,
                          ),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            value: double.parse(bmi).toDouble(),
                            enableAnimation: true,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              NeumorphicButton(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                    top: 15,
                    bottom: 15),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        InfoPage(bmi: bmi, resultText: 'figj'),
                  ));
                },
                style: NeumorphicStyle(color: kActiveColor),
                child: const Text(
                  'Details',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
