import 'package:flutter/material.dart';

import '../service/channel_service.dart';
import 'state/bmi_state.dart';

class BmiController extends ValueNotifier<BmiState> {
  final ChannelService channelService = ChannelService();
  BmiController() : super(InitBmiState());

  void calculateBmi({
    required double weight,
    required double height,
  }) async {
    try {
      final bmi = await channelService.calculateBmi(
        weight: weight,
        height: height,
      );
      value = SuccesCalculateState(bmi);
    } catch (e) {
      value = ErrorCalculateState(e.toString());
    }
  }
}
