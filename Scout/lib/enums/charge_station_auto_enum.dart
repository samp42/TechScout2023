enum ChargeStationAutoEnum {
  none('none'),
  dock('dock'),
  engage('engage');

  const ChargeStationAutoEnum(this.value);
  final String value;
}

extension ChargeStationAutoEnumExtension on ChargeStationAutoEnum {
  static ChargeStationAutoEnum fromValue(String value) {
    return ChargeStationAutoEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('Invalid ChargeStationAutoEnum value: $value'),
    );
  }
}
