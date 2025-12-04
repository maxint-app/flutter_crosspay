library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

part 'exception.dart';
part 'purchase_event.dart';
part 'product.dart';
part 'stripe_product.dart';
part 'subscription.dart';

Duration _durationFromMillis(ms) => Duration(milliseconds: ms);
int _durationToMillis(Duration duration) => duration.inMilliseconds;
