enum ConeOrientationEnum {
  pointingAway,
  pointingTowards,
  sideways,
  upRight,
}

extension ConeOrientationEnumExtension on ConeOrientationEnum {
  
  String get name {
    switch (this) {
      case ConeOrientationEnum.pointingAway:
        return 'Pointing Away';
      case ConeOrientationEnum.pointingTowards:
        return 'Pointing Towards';
      case ConeOrientationEnum.sideways:
        return 'Sideways';
      case ConeOrientationEnum.upRight:
        return 'Up Right';
    }
  }

  static ConeOrientationEnum fromName(String name) {
    switch (name) {
      case 'Pointing Away':
        return ConeOrientationEnum.pointingAway;
      case 'Pointing Towards':
        return ConeOrientationEnum.pointingTowards;
      case 'Sideways':
        return ConeOrientationEnum.sideways;
      case 'Up Right':
        return ConeOrientationEnum.upRight;
      default:
        throw Exception('Invalid ConeOrientationEnum name: $name');
    }
  }
  
}
