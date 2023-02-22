enum GamePieceEnum {
  cone('cone'),
  cube('cube');

  const GamePieceEnum(this.value);
  final String value;
}

extension GamePieceEnumExtension on GamePieceEnum {
  static GamePieceEnum fromValue(String value) {
    return GamePieceEnum.values.firstWhere((e) => e.value == value,
        orElse: () => throw Exception('Invalid GamePieceEnum value: $value'));
  }
}
