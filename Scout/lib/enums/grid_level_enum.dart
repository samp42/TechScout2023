enum GridLevelEnum {

  bottom('Bottom'),
  middle('Middle'),
  top('Top');

  const GridLevelEnum(this.value);
  final String value;

}

extension GridLevelEnumExtension on GridLevelEnum {
  
  String get value {
    return this.value;
  }

  static GridLevelEnum fromValue(String value) {
    switch (value) {
      case 'Bottom':
        return GridLevelEnum.bottom;
      case 'Middle':
        return GridLevelEnum.middle;
      case 'Top':
        return GridLevelEnum.top;
      default:
        throw Exception('Invalid GridLevelEnum value: $value');
    }
  }
  
}
