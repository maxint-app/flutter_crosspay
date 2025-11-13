part of 'models.dart';

enum PurchaseEventType {
  /// When the purchase was successful in both app and the API
  success,
  /// When user canceled in the middle of the purchase process
  canceled,
  /// When the purchase failed in the API
  /// 
  /// Fired when usually the receipt verification fails
  failed,
  /// When the purchase failed in the app
  error,
}

class PurchaseEvent {
  final PurchaseEventType type;

  PurchaseEvent(this.type);
}