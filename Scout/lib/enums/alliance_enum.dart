enum AllianceEnum {
  red('red'),
  blue('blue');

  const AllianceEnum(this.value);
  final String value;

  String get capitalisedValue =>
      value[0].toUpperCase() + value.substring(1).toLowerCase();
}

extension AllianceEnumExtension on AllianceEnum {
  static AllianceEnum fromValue(String value) {
    return AllianceEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('Invalid AllianceEnum value: $value'),
    );
  }
}
