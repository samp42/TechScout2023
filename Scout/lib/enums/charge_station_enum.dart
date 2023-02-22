enum ChargeStationEnum {
  engage('engage'),
  dock('dock'),
  park('park'), // only in endgame
  none('none');

  const ChargeStationEnum(this.value);
  final String value;
}

extension ChargeStationEnumExtension on ChargeStationEnum {
  static ChargeStationEnum fromValue(String value) {
    return ChargeStationEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('Invalid ChargeStationEnum value: $value'),
    );
  }
}
