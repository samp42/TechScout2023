enum DriverExperienceEnum {

  firstYear(1),
  secondYear(2),
  thirdYear(3);

  const DriverExperienceEnum(this.value);
  final num value;

}

extension DriverExperienceEnumExtension on DriverExperienceEnum {

  num get value {
    return this.value;
  }

  static DriverExperienceEnum fromValue(num value) {
    switch (value) {
      case 1:
        return DriverExperienceEnum.firstYear;
      case 2:
        return DriverExperienceEnum.secondYear;
      case 3:
        return DriverExperienceEnum.thirdYear;
      default:
        throw Exception('Invalid DriverExperienceEnum value: $value');
    }
  }

}
