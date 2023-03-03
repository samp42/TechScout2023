enum SpeedEnum {
  slow('slow'),
  medium('medium'),
  fast('fast');

  const SpeedEnum(this.value);
  final String value;
}

extension SpeedEnumExtension on SpeedEnum {
  static SpeedEnum fromValue(String value) {
    return SpeedEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('Invalid SpeedEnum value: $value'),
    );
  }
}
