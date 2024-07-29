import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import '../containts.dart';

class ValueSelector extends StatelessWidget {
  final String label;
  final int value;
  final Function()? onIncrement;
  final Function()? onDecrement;

  const ValueSelector({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              label,
              style: TextStyle(color: kTextColor, fontSize: 17),
            ),
            Text(
              value.toStringAsFixed(0),
              style: const TextStyle(fontSize: 35),
            ),
            Row(
              children: [
                NeumorphicButton(
                  onPressed: onIncrement,
                  style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  child: const Icon(Icons.add),
                ),
                NeumorphicButton(
                  onPressed: onDecrement,
                  style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
