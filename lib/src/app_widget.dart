import 'package:flutter/material.dart';
import 'package:poc_method_channel/src/pages/calculate_bmi_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculateBmiPage(),
    );
  }
}
