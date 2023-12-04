import 'package:flutter/services.dart';

class ChannelService {
  final MethodChannel channel = const MethodChannel('bmi_calculate_channel');
  ChannelService();

  Future<double> calculateBmi({
    required double weight,
    required double height,
  }) async {
    try {
      final result = await channel.invokeMethod('bmi_calculate', {
        'weight': weight,
        'height': height,
      });

      return result;
    } on PlatformException catch (e) {
      throw e.toString();
    }
  }
}
