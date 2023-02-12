enum SpeedEnum {
  slow('slow'),
  medium('medium'),
  fast('fast');

  const SpeedEnum(this.value);
  final String value;
}

extension SpeedExtension on SpeedEnum {
  static SpeedEnum fromValue(String value) {
    switch (value) {
      case 'slow':
        return SpeedEnum.slow;
      case 'medium':
        return SpeedEnum.medium;
      case 'fast':
        return SpeedEnum.fast;
      default:
        throw Exception('Invalid RobotSpeed name: $value');
    }
  }
}
