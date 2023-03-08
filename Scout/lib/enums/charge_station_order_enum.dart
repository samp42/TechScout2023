enum ChargeStationOrderEnum {
  none('none'),
  first('first'),
  second('second'),
  third('third');

  const ChargeStationOrderEnum(this.value);

  final String value;
}

extension ChargeStationOrderEnumExtension on ChargeStationOrderEnum {
  static ChargeStationOrderEnum fromValue(String value) {
    return ChargeStationOrderEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('Invalid ChargeStationOrderEnum value: $value'),
    );
  }
}
