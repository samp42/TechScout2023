enum ConeOrientationEnum {
  pointingAway('pointing away'),
  pointingTowards('pointing towards'),
  sideways('sideways'),
  upRight('up right');

  const ConeOrientationEnum(this.value);
  final String value;
}

extension ConeOrientationEnumExtension on ConeOrientationEnum {
  static ConeOrientationEnum fromValue(String value) {
    switch (value) {
      case 'pointing away':
        return ConeOrientationEnum.pointingAway;
      case 'pointing towards':
        return ConeOrientationEnum.pointingTowards;
      case 'sideways':
        return ConeOrientationEnum.sideways;
      case 'up right':
        return ConeOrientationEnum.upRight;
      default:
        throw Exception('Invalid ConeOrientationEnum name: $value');
    }
  }
}
