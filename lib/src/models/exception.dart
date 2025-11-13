part of 'models.dart';

enum CrosspayExceptionType {
  alreadyActive,
  crossUpgradeDowngrade,
}

class CrosspayException implements Exception {
  final String message;
  final CrosspayExceptionType type;

  CrosspayException(this.message, this.type);

  CrosspayException.alreadyActive(String message)
      : this(message, CrosspayExceptionType.alreadyActive);

  CrosspayException.crossUpgradeDowngrade(String message)
      : this(message, CrosspayExceptionType.crossUpgradeDowngrade);

  @override
  String toString() {
    return 'CrosspayException(${type.name}): $message';
  }
}
