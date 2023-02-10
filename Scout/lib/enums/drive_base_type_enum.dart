enum DriveBaseTypeEnum {
  swerve('swerve'),
  tank('tank'),
  other('other');

  const DriveBaseTypeEnum(this.value);
  final String value;
}

extension DriveBaseTypeEnumExtension on DriveBaseTypeEnum {
  static DriveBaseTypeEnum fromValue(String value) {
    switch (value) {
      case 'swerve':
        return DriveBaseTypeEnum.swerve;
      case 'tank':
        return DriveBaseTypeEnum.tank;
      case 'other':
        return DriveBaseTypeEnum.other;
      default:
        throw Exception('Invalid DriveBaseTypeEnum name: $value');
    }
  }
}
