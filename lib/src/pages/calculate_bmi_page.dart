import 'package:flutter/material.dart';

import '../controller/bmi_controller.dart';
import '../controller/state/bmi_state.dart';

class CalculateBmiPage extends StatefulWidget {
  const CalculateBmiPage({super.key});

  @override
  State<CalculateBmiPage> createState() => _CalculateBmiPageState();
}

class _CalculateBmiPageState extends State<CalculateBmiPage> {
  late TextEditingController weightController;
  late TextEditingController heightController;
  late GlobalKey<FormState> _formKey;
  late BmiController bmiController;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    heightController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    bmiController = BmiController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Imc '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Peso (kg):'),
                  TextFormField(
                    controller: weightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text('Altura (cm):'),
                  TextFormField(
                    controller: heightController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                bmiController.calculateBmi(
                  weight: double.tryParse(weightController.text) ?? 0,
                  height: double.tryParse(heightController.text) ?? 0,
                );
              },
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 50),
            ValueListenableBuilder(
              valueListenable: bmiController,
              builder: (context, value, child) {
                if (value is ErrorCalculateState) {
                  return Text(value.error);
                }
                if (value is SuccesCalculateState) {
                  return Text(value.bmi.toString());
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
