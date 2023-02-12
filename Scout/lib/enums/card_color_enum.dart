enum CardColorEnum {
  red('red'),
  yellow('yellow');

  const CardColorEnum(this.value);
  final String value;
}

extension CardColorExtension on CardColorEnum {
  static CardColorEnum fromValue(String value) {
    switch (value) {
      case 'red':
        return CardColorEnum.red;
      case 'yellow':
        return CardColorEnum.yellow;
      default:
        throw Exception('Invalid CardColor name: $value');
    }
  }
}
