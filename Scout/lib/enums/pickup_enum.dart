enum PickupEnum {
  none('none'),
  floor('floor'),
  tablet('tablet'),
  both('floor and tablet');

  const PickupEnum(this.value);
  final String value;
}

extension PickupEnumExtension on PickupEnum {
  static PickupEnum fromValue(String value) {
    return PickupEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('Invalid PickupEnum value: $value'),
    );
  }
}
