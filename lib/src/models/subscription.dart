part of 'models.dart';

enum SubscriptionRenewalStatus {
  @JsonValue('auto_renew')
  autoRenew,
  canceled,
}

enum EntitlementStatus {
  active,
  @JsonValue('on_hold')
  onHold,
  @JsonValue('grace_period')
  gracePeriod,
  trialing,
  expired,
  consumed,
  @JsonValue('non_consumed')
  nonConsumed
}

// int _dateToEpochSeconds(DateTime date) => date.millisecondsSinceEpoch ~/ 1000;
// DateTime _dateFromEpochSeconds(int seconds) =>
//     DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
// int? _dateToEpochSecondsNullable(DateTime? date) =>
//     date == null ? null : date.millisecondsSinceEpoch ~/ 1000;
// DateTime? _dateFromEpochSecondsNullable(int? seconds) => seconds == null
//     ? null
//     : DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
