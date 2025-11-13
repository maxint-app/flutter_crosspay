library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

part 'exception.dart';
part 'purchase_event.dart';
part 'product.dart';
part 'stripe_product.dart';
part 'subscription.dart';

Duration _durationFromDays(days) => Duration(days: days);
int _durationToDays(Duration duration) => duration.inDays;
