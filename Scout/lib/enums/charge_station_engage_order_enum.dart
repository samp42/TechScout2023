enum EngageOrderEnum {
  engage1st(1),
  engage2nd(2),
  engage3rd(3),
  engageNone(0);

  const EngageOrderEnum(this.value);
  final int value;
}

extension EngageOrderExtension on EngageOrderEnum {
  static EngageOrderEnum fromValue(int value) {
    switch (value) {
      case 1:
        return EngageOrderEnum.engage1st;
      case 2:
        return EngageOrderEnum.engage2nd;
      case 3:
        return EngageOrderEnum.engage3rd;
      case 0:
        return EngageOrderEnum.engageNone;
      default:
        throw Exception('Invalid EngageOrderEnum name: $value');
    }
  }
}
