enum TeleopActionEnum {
  intakeCone('intakeCone'),
  intakeCube('intakeCube'),
  drop('drop'),
  placeBottom('placeBottom'),
  placeMiddle('placeMiddle'),
  placeTop('placeTop'),
  placeCommunity('placeCommunity'),
  tippedOver('tippedOver');

  const TeleopActionEnum(this.value);
  final String value;
}

extension TeleopActionEnumExtension on TeleopActionEnum {
  static TeleopActionEnum fromValue(String value) {
    return TeleopActionEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('Invalid TeleopActionEnum value: $value'),
    );
  }
}
