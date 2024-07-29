import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:bmi_calculator/calculation_brain.dart';
import 'package:bmi_calculator/screens/page_result.dart';
import 'package:bmi_calculator/widgets/age_weight_card.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../containts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {


  double height = 100;
  int age = 15;
  int weight = 50;

  late AnimationController _controller;
  double turns = 0.0;
  bool isClicked = false;
  Color kCustomBlackColor = const Color.fromARGB(255, 53, 53, 53);
  Color kCustomWhiteColor = const Color.fromARGB(255, 237, 237, 237);
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  Gender selectedGender = Gender.male;
  void selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(

          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 18),
                  child:

                  NeumorphicButton(
                    pressed: true,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {
                    },
                    style: const NeumorphicStyle(
                        color: Color(0xffededed),
                        boxShape: NeumorphicBoxShape.circle()),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                Text(
                  'BMI Calculator',
                  style: TextStyle(color: kTextColor, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    selectGender(Gender.male);
                  },
                  child: reuseableGenderCard(
                      context, 'Male', selectedGender == Gender.male),
                ),
                GestureDetector(
                  onTap: () {
                    selectGender(Gender.female);
                  },
                  child: reuseableGenderCard(
                      context, 'Female', selectedGender == Gender.female),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                heightSlider(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.53,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueSelector(
                        label: 'Weight',
                        value: weight,
                        onIncrement: () {
                          setState(() {
                            if (weight < 200) {
                              weight++;
                            }
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            if (weight < 200) {
                              weight--;
                            }
                          });
                        },
                      ),
                      ValueSelector(
                        label: 'Age',
                        value: age,
                        onIncrement: () {
                          setState(() {
                            if (age < 100) {
                              age++;
                            }
                          });
                        },
                        onDecrement: () {
                          setState(() {
                            if (age > 1) {
                              age--;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            NeumorphicButton(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.35,
                  right: MediaQuery.of(context).size.width * 0.35,
                  top: 15,
                  bottom: 15),
              onPressed: () {
                CalucutationBrain calc =
                    CalucutationBrain(height: height, weight: weight);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                        bmi: calc.calucutateBMI(), result: calc.result()),
                  ),
                );
              },
              style: NeumorphicStyle(color: kActiveColor),
              child: const Text(
                'Calculate',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }

  Neumorphic heightSlider(BuildContext context) {
    return Neumorphic(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width * 0.36,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Height',
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: SfSliderTheme(
                data: SfSliderThemeData(
                    activeLabelStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    inactiveLabelStyle:
                        TextStyle(color: kTextColor, fontSize: 15)),
                child: SfSlider.vertical(
                  activeColor: kActiveColor,
                  min: 100,
                  max: 230.0,
                  value: height,
                  interval: 20,
                  enableTooltip: true,
                  tooltipPosition: SliderTooltipPosition.right,
                  showTicks: true,
                  showLabels: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    setState(() {
                      height = value;
                    });
                  },
                  thumbIcon: NeumorphicIcon(Icons.circle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Neumorphic reuseableGenderCard(
      BuildContext context, String title, bool isSelected) {
    return Neumorphic(
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          intensity: 0.9,
          depth: 3,
          shape: NeumorphicShape.flat,
          color: isSelected ? kActiveColor : null),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(18),
        child: Text(title),
      ),
    );
  }
}

enum Gender {
  male,
  female,
}
