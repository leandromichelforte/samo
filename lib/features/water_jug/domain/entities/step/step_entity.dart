base class StepEntity {
  const StepEntity({
    required this.jugOne,
    required this.jugTwo,
    required this.description,
  });
  final int jugOne;
  final int jugTwo;
  final String description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepEntity &&
          jugOne == other.jugOne &&
          jugTwo == other.jugTwo &&
          description == other.description;

  @override
  int get hashCode => jugOne.hashCode ^ jugTwo.hashCode ^ description.hashCode;
}
