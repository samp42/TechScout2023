enum ChargedStationEnum {
  engage('engage'),
  dock('dock'),
  none('none');

  const ChargedStationEnum(this.value);
  final String value;
}

extension ChargedStationEnumExtension on ChargedStationEnum {
  static ChargedStationEnum fromValue(String value) {
    switch (value) {
      case 'engage':
        return ChargedStationEnum.engage;
      case 'dock':
        return ChargedStationEnum.dock;
      case 'none':
        return ChargedStationEnum.none;
      default:
        throw Exception('Invalid ChargedStationEnum name: $value');
    }
  }
}
