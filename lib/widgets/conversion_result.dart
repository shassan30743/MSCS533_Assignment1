import 'package:flutter/material.dart';

class ConversionResult extends StatelessWidget {
  final String value;
  final String fromUnit;
  final String toUnit;
  final String result;

  const ConversionResult({super.key, 
    required this.value,
    required this.fromUnit,
    required this.toUnit,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value $fromUnit are $result $toUnit',
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.blueAccent,
      ),
    );
  }
}
