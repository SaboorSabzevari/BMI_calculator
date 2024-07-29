import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CircularBMIincdicator extends StatelessWidget {
  const CircularBMIincdicator({
    super.key,
    required this.bmi,
  });

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        padding: const EdgeInsets.all(15),
        style: const NeumorphicStyle(
            intensity: 8,
            depth: 20,
            color: Color(0xffededed),
            boxShape: NeumorphicBoxShape.circle()),
        child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 10,
          axes: <RadialAxis>[
            RadialAxis(
              ranges: <GaugeRange>[
                GaugeRange(
                  color: Colors.yellowAccent,
                  startValue: 0,
                  endValue: 30,
                ),
                GaugeRange(
                  color: Colors.green,
                  startValue: 30,
                  endValue: 65,
                ),
                GaugeRange(
                  color: Colors.red,
                  startValue: 65,
                  endValue: 100,
                ),
              ],
              pointers: const <GaugePointer>[
                NeedlePointer(
                  value: 33,
                  enableAnimation: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
