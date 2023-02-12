enum CoopertitionAttemptEnum {
  triedAndSucceeded('Tried and succeeded'),
  triedAndFailed('Tried and failed'),
  neverTried('Never tried');

  const CoopertitionAttemptEnum(this.value);
  final String value;
}

extension CoopertitionAttemptExtension on CoopertitionAttemptEnum {
  static CoopertitionAttemptEnum fromValue(String value) {
    switch (value) {
      case 'Tried and failed':
        return CoopertitionAttemptEnum.triedAndFailed;
      case 'Tried and succeeded':
        return CoopertitionAttemptEnum.triedAndSucceeded;
      case 'Never tried':
        return CoopertitionAttemptEnum.neverTried;
      default:
        throw Exception('Invalid CoppertitionAttempt name: $value');
    }
  }
}
