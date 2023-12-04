class BmiState {}

class InitBmiState implements BmiState {}

class SuccesCalculateState implements BmiState {
  final double bmi;

  SuccesCalculateState(this.bmi);
}

class ErrorCalculateState implements BmiState {
  final String error;

  ErrorCalculateState(this.error);
}
