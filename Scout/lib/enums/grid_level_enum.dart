enum GridLevelEnum {
  bottom('bottom'),
  middle('middle'),
  top('top');

  const GridLevelEnum(this.value);
  final String value;
}

extension GridLevelEnumExtension on GridLevelEnum {
  static GridLevelEnum fromValue(String value) {
    switch (value) {
      case 'bottom':
        return GridLevelEnum.bottom;
      case 'middle':
        return GridLevelEnum.middle;
      case 'top':
        return GridLevelEnum.top;
      default:
        throw Exception('Invalid GridLevelEnum value: $value');
    }
  }
}
