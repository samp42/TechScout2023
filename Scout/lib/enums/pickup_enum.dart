enum PickupEnum {
  floor('floor'),
  tablet('tablet'),
  both('floor and tablet');

  const PickupEnum(this.value);
  final String value;
}

extension PickupEnumExtension on PickupEnum {
  static PickupEnum fromValue(String value) {
    switch (value) {
      case 'floor':
        return PickupEnum.floor;
      case 'tablet':
        return PickupEnum.tablet;
      case 'floor and tablet':
        return PickupEnum.both;
      default:
        throw Exception('Invalid PickupEnum value: $value');
    }
  }
}
