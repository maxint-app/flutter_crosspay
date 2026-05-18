library;

import 'dart:convert';

import 'package:flutter_crosspay/src/utils/platform.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

part 'exception.dart';
part 'purchase_event.dart';
part 'product.dart';
part 'gocardless_product.dart';
part 'stripe_product.dart';
part 'subscription.dart';

Duration? _durationFromMillis(ms) => ms != null ? Duration(milliseconds: ms) : null;
int _durationToMillis(Duration? duration) => duration?.inMilliseconds ?? 0;

DateTime _dateTimeFromEpoch(int epoch) => DateTime.fromMillisecondsSinceEpoch(epoch);
int _dateTimeToEpoch(DateTime dateTime) => dateTime.millisecondsSinceEpoch;

DateTime? _dateTimeNullableFromEpoch(int? epoch) => epoch != null ? DateTime.fromMillisecondsSinceEpoch(epoch) : null;
int? _dateTimeNullableToEpoch(DateTime? dateTime) => dateTime?.millisecondsSinceEpoch;