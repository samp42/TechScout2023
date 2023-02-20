enum AllianceEnum {
  red('red'),
  blue('blue');

  const AllianceEnum(this.value);
  final String value;
}

extension AllianceEnumExtension on AllianceEnum {
  static AllianceEnum fromValue(String value) {
    switch (value.toLowerCase()) {
      case 'red':
        return AllianceEnum.red;
      case 'blue':
        return AllianceEnum.blue;
      default:
        throw Exception('Invalid AllianceEnum value: $value');
    }
  }
}
