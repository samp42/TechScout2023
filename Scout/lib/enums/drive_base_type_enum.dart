enum DriveBaseTypeEnum {
  swerve,
  tank,
  other,
}

extension DriveBaseTypeEnumExtension on DriveBaseTypeEnum {
  
  String get name {
    switch (this) {
      case DriveBaseTypeEnum.swerve:
        return 'Swerve';
      case DriveBaseTypeEnum.tank:
        return 'Tank';
      case DriveBaseTypeEnum.other:
        return 'Other';
    }
  }

  static DriveBaseTypeEnum fromName(String name) {
    switch (name) {
      case 'Swerve':
        return DriveBaseTypeEnum.swerve;
      case 'Tank':
        return DriveBaseTypeEnum.tank;
      case 'Other':
        return DriveBaseTypeEnum.other;
      default:
        throw Exception('Invalid DriveBaseTypeEnum name: $name');
    }
  }

}
