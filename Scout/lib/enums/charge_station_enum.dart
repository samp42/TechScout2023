enum ChargeStationEnum {
  engage('engage'),
  dock('dock'),
  none('none');

  const ChargeStationEnum(this.value);
  final String value;
}

extension ChargedStationEnumExtension on ChargeStationEnum {
  static ChargeStationEnum fromValue(String value) {
    switch (value) {
      case 'engage':
        return ChargeStationEnum.engage;
      case 'dock':
        return ChargeStationEnum.dock;
      case 'none':
        return ChargeStationEnum.none;
      default:
        throw Exception('Invalid ChargedStationEnum name: $value');
    }
  }
}
