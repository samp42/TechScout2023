enum CardColorEnum {
  none('none'),
  red('red'),
  yellow('yellow');

  const CardColorEnum(this.value);

  final String value;
}

extension CardColorEnumExtension on CardColorEnum {
  static CardColorEnum fromValue(String value) {
    return CardColorEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('Invalid CardColorEnum value: $value'),
    );
  }
}
