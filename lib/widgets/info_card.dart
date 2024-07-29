import 'package:flutter/material.dart';

import '../containts.dart';

class InfoCard extends StatelessWidget {
  final lowerBMI;
  final upperBMI;
  final bmiResult;

  const InfoCard({super.key, this.lowerBMI, this.upperBMI, this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              lowerBMI.toString(),
              style: TextStyle(
                color: darkTextColor,
                fontSize: 16.0,
              ),
            ),
            upperBMI != null
                ? Text(
                    ' to ' + upperBMI.toString(),
                    style: TextStyle(
                      color: darkTextColor,
                      fontSize: 16.0,
                    ),
                  )
                : const Text(''),
          ],
        ),
        Text(
          bmiResult.toString(),
          style: TextStyle(
            color: darkTextColor,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
