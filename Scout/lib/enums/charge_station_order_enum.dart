enum ChargeStationOrderEnum {
  none,
  first,
  second,
  third;
}

extension ChargeStationOrderEnumExtension on ChargeStationOrderEnum {
  static ChargeStationOrderEnum fromValue(int value) {
    return ChargeStationOrderEnum.values.firstWhere(
      (e) => e.index == value,
      orElse: () =>
          throw Exception('Invalid ChargeStationOrderEnum value: $value'),
    );
  }
}
