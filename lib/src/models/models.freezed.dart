// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionStoreProduct {
  String get id;
  String get name;
  String get description;
  double get price;
  String get formattedPrice;
  String get currencyCode;
  CrosspayStore get store;
  int? get subscriptionRecurrenceDays;
  String get accessLevel;
  EntitlementType get productType;

  /// Create a copy of SubscriptionStoreProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionStoreProductCopyWith<SubscriptionStoreProduct> get copyWith =>
      _$SubscriptionStoreProductCopyWithImpl<SubscriptionStoreProduct>(
          this as SubscriptionStoreProduct, _$identity);

  /// Serializes this SubscriptionStoreProduct to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionStoreProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.subscriptionRecurrenceDays,
                    subscriptionRecurrenceDays) ||
                other.subscriptionRecurrenceDays ==
                    subscriptionRecurrenceDays) &&
            (identical(other.accessLevel, accessLevel) ||
                other.accessLevel == accessLevel) &&
            (identical(other.productType, productType) ||
                other.productType == productType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      formattedPrice,
      currencyCode,
      store,
      subscriptionRecurrenceDays,
      accessLevel,
      productType);

  @override
  String toString() {
    return 'SubscriptionStoreProduct(id: $id, name: $name, description: $description, price: $price, formattedPrice: $formattedPrice, currencyCode: $currencyCode, store: $store, subscriptionRecurrenceDays: $subscriptionRecurrenceDays, accessLevel: $accessLevel, productType: $productType)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionStoreProductCopyWith<$Res> {
  factory $SubscriptionStoreProductCopyWith(SubscriptionStoreProduct value,
          $Res Function(SubscriptionStoreProduct) _then) =
      _$SubscriptionStoreProductCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      String formattedPrice,
      String currencyCode,
      CrosspayStore store,
      int? subscriptionRecurrenceDays,
      String accessLevel,
      EntitlementType productType});
}

/// @nodoc
class _$SubscriptionStoreProductCopyWithImpl<$Res>
    implements $SubscriptionStoreProductCopyWith<$Res> {
  _$SubscriptionStoreProductCopyWithImpl(this._self, this._then);

  final SubscriptionStoreProduct _self;
  final $Res Function(SubscriptionStoreProduct) _then;

  /// Create a copy of SubscriptionStoreProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? formattedPrice = null,
    Object? currencyCode = null,
    Object? store = null,
    Object? subscriptionRecurrenceDays = freezed,
    Object? accessLevel = null,
    Object? productType = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      formattedPrice: null == formattedPrice
          ? _self.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _self.store
          : store // ignore: cast_nullable_to_non_nullable
              as CrosspayStore,
      subscriptionRecurrenceDays: freezed == subscriptionRecurrenceDays
          ? _self.subscriptionRecurrenceDays
          : subscriptionRecurrenceDays // ignore: cast_nullable_to_non_nullable
              as int?,
      accessLevel: null == accessLevel
          ? _self.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _self.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as EntitlementType,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscriptionStoreProduct].
extension SubscriptionStoreProductPatterns on SubscriptionStoreProduct {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SubscriptionStoreProduct value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStoreProduct() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SubscriptionStoreProduct value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStoreProduct():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SubscriptionStoreProduct value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStoreProduct() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String description,
            double price,
            String formattedPrice,
            String currencyCode,
            CrosspayStore store,
            int? subscriptionRecurrenceDays,
            String accessLevel,
            EntitlementType productType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStoreProduct() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.price,
            _that.formattedPrice,
            _that.currencyCode,
            _that.store,
            _that.subscriptionRecurrenceDays,
            _that.accessLevel,
            _that.productType);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String description,
            double price,
            String formattedPrice,
            String currencyCode,
            CrosspayStore store,
            int? subscriptionRecurrenceDays,
            String accessLevel,
            EntitlementType productType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStoreProduct():
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.price,
            _that.formattedPrice,
            _that.currencyCode,
            _that.store,
            _that.subscriptionRecurrenceDays,
            _that.accessLevel,
            _that.productType);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            String description,
            double price,
            String formattedPrice,
            String currencyCode,
            CrosspayStore store,
            int? subscriptionRecurrenceDays,
            String accessLevel,
            EntitlementType productType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStoreProduct() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.price,
            _that.formattedPrice,
            _that.currencyCode,
            _that.store,
            _that.subscriptionRecurrenceDays,
            _that.accessLevel,
            _that.productType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionStoreProduct implements SubscriptionStoreProduct {
  _SubscriptionStoreProduct(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.formattedPrice,
      required this.currencyCode,
      required this.store,
      required this.subscriptionRecurrenceDays,
      required this.accessLevel,
      required this.productType});
  factory _SubscriptionStoreProduct.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStoreProductFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final String formattedPrice;
  @override
  final String currencyCode;
  @override
  final CrosspayStore store;
  @override
  final int? subscriptionRecurrenceDays;
  @override
  final String accessLevel;
  @override
  final EntitlementType productType;

  /// Create a copy of SubscriptionStoreProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionStoreProductCopyWith<_SubscriptionStoreProduct> get copyWith =>
      __$SubscriptionStoreProductCopyWithImpl<_SubscriptionStoreProduct>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionStoreProductToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionStoreProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.subscriptionRecurrenceDays,
                    subscriptionRecurrenceDays) ||
                other.subscriptionRecurrenceDays ==
                    subscriptionRecurrenceDays) &&
            (identical(other.accessLevel, accessLevel) ||
                other.accessLevel == accessLevel) &&
            (identical(other.productType, productType) ||
                other.productType == productType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      formattedPrice,
      currencyCode,
      store,
      subscriptionRecurrenceDays,
      accessLevel,
      productType);

  @override
  String toString() {
    return 'SubscriptionStoreProduct(id: $id, name: $name, description: $description, price: $price, formattedPrice: $formattedPrice, currencyCode: $currencyCode, store: $store, subscriptionRecurrenceDays: $subscriptionRecurrenceDays, accessLevel: $accessLevel, productType: $productType)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionStoreProductCopyWith<$Res>
    implements $SubscriptionStoreProductCopyWith<$Res> {
  factory _$SubscriptionStoreProductCopyWith(_SubscriptionStoreProduct value,
          $Res Function(_SubscriptionStoreProduct) _then) =
      __$SubscriptionStoreProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      String formattedPrice,
      String currencyCode,
      CrosspayStore store,
      int? subscriptionRecurrenceDays,
      String accessLevel,
      EntitlementType productType});
}

/// @nodoc
class __$SubscriptionStoreProductCopyWithImpl<$Res>
    implements _$SubscriptionStoreProductCopyWith<$Res> {
  __$SubscriptionStoreProductCopyWithImpl(this._self, this._then);

  final _SubscriptionStoreProduct _self;
  final $Res Function(_SubscriptionStoreProduct) _then;

  /// Create a copy of SubscriptionStoreProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? formattedPrice = null,
    Object? currencyCode = null,
    Object? store = null,
    Object? subscriptionRecurrenceDays = freezed,
    Object? accessLevel = null,
    Object? productType = null,
  }) {
    return _then(_SubscriptionStoreProduct(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      formattedPrice: null == formattedPrice
          ? _self.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      store: null == store
          ? _self.store
          : store // ignore: cast_nullable_to_non_nullable
              as CrosspayStore,
      subscriptionRecurrenceDays: freezed == subscriptionRecurrenceDays
          ? _self.subscriptionRecurrenceDays
          : subscriptionRecurrenceDays // ignore: cast_nullable_to_non_nullable
              as int?,
      accessLevel: null == accessLevel
          ? _self.accessLevel
          : accessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _self.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as EntitlementType,
    ));
  }
}

/// @nodoc
mixin _$CrosspayEntitlement {
  String get id;
  String get name;
  @JsonKey(
      name: "period_ms",
      fromJson: _durationFromMillis,
      toJson: _durationToMillis)
  Duration? get period;
  String? get description;
  @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
  Map<String, dynamic>? get metadata;
  CrosspayProducts get products;
  @JsonKey(name: "entitlement_type")
  EntitlementType get entitlementType;

  /// Create a copy of CrosspayEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CrosspayEntitlementCopyWith<CrosspayEntitlement> get copyWith =>
      _$CrosspayEntitlementCopyWithImpl<CrosspayEntitlement>(
          this as CrosspayEntitlement, _$identity);

  /// Serializes this CrosspayEntitlement to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CrosspayEntitlement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.entitlementType, entitlementType) ||
                other.entitlementType == entitlementType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, period, description,
      const DeepCollectionEquality().hash(metadata), products, entitlementType);

  @override
  String toString() {
    return 'CrosspayEntitlement(id: $id, name: $name, period: $period, description: $description, metadata: $metadata, products: $products, entitlementType: $entitlementType)';
  }
}

/// @nodoc
abstract mixin class $CrosspayEntitlementCopyWith<$Res> {
  factory $CrosspayEntitlementCopyWith(
          CrosspayEntitlement value, $Res Function(CrosspayEntitlement) _then) =
      _$CrosspayEntitlementCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(
          name: "period_ms",
          fromJson: _durationFromMillis,
          toJson: _durationToMillis)
      Duration? period,
      String? description,
      @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
      Map<String, dynamic>? metadata,
      CrosspayProducts products,
      @JsonKey(name: "entitlement_type") EntitlementType entitlementType});

  $CrosspayProductsCopyWith<$Res> get products;
}

/// @nodoc
class _$CrosspayEntitlementCopyWithImpl<$Res>
    implements $CrosspayEntitlementCopyWith<$Res> {
  _$CrosspayEntitlementCopyWithImpl(this._self, this._then);

  final CrosspayEntitlement _self;
  final $Res Function(CrosspayEntitlement) _then;

  /// Create a copy of CrosspayEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? period = freezed,
    Object? description = freezed,
    Object? metadata = freezed,
    Object? products = null,
    Object? entitlementType = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      period: freezed == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as Duration?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as CrosspayProducts,
      entitlementType: null == entitlementType
          ? _self.entitlementType
          : entitlementType // ignore: cast_nullable_to_non_nullable
              as EntitlementType,
    ));
  }

  /// Create a copy of CrosspayEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductsCopyWith<$Res> get products {
    return $CrosspayProductsCopyWith<$Res>(_self.products, (value) {
      return _then(_self.copyWith(products: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CrosspayEntitlement].
extension CrosspayEntitlementPatterns on CrosspayEntitlement {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CrosspayEntitlement value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CrosspayEntitlement() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CrosspayEntitlement value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayEntitlement():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CrosspayEntitlement value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayEntitlement() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            @JsonKey(
                name: "period_ms",
                fromJson: _durationFromMillis,
                toJson: _durationToMillis)
            Duration? period,
            String? description,
            @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
            Map<String, dynamic>? metadata,
            CrosspayProducts products,
            @JsonKey(name: "entitlement_type") EntitlementType entitlementType)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CrosspayEntitlement() when $default != null:
        return $default(_that.id, _that.name, _that.period, _that.description,
            _that.metadata, _that.products, _that.entitlementType);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            @JsonKey(
                name: "period_ms",
                fromJson: _durationFromMillis,
                toJson: _durationToMillis)
            Duration? period,
            String? description,
            @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
            Map<String, dynamic>? metadata,
            CrosspayProducts products,
            @JsonKey(name: "entitlement_type") EntitlementType entitlementType)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayEntitlement():
        return $default(_that.id, _that.name, _that.period, _that.description,
            _that.metadata, _that.products, _that.entitlementType);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            @JsonKey(
                name: "period_ms",
                fromJson: _durationFromMillis,
                toJson: _durationToMillis)
            Duration? period,
            String? description,
            @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
            Map<String, dynamic>? metadata,
            CrosspayProducts products,
            @JsonKey(name: "entitlement_type") EntitlementType entitlementType)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayEntitlement() when $default != null:
        return $default(_that.id, _that.name, _that.period, _that.description,
            _that.metadata, _that.products, _that.entitlementType);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CrosspayEntitlement implements CrosspayEntitlement {
  _CrosspayEntitlement(
      {required this.id,
      required this.name,
      @JsonKey(
          name: "period_ms",
          fromJson: _durationFromMillis,
          toJson: _durationToMillis)
      required this.period,
      this.description,
      @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
      final Map<String, dynamic>? metadata,
      required this.products,
      @JsonKey(name: "entitlement_type") required this.entitlementType})
      : _metadata = metadata;
  factory _CrosspayEntitlement.fromJson(Map<String, dynamic> json) =>
      _$CrosspayEntitlementFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(
      name: "period_ms",
      fromJson: _durationFromMillis,
      toJson: _durationToMillis)
  final Duration? period;
  @override
  final String? description;
  final Map<String, dynamic>? _metadata;
  @override
  @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final CrosspayProducts products;
  @override
  @JsonKey(name: "entitlement_type")
  final EntitlementType entitlementType;

  /// Create a copy of CrosspayEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CrosspayEntitlementCopyWith<_CrosspayEntitlement> get copyWith =>
      __$CrosspayEntitlementCopyWithImpl<_CrosspayEntitlement>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CrosspayEntitlementToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CrosspayEntitlement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.entitlementType, entitlementType) ||
                other.entitlementType == entitlementType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      period,
      description,
      const DeepCollectionEquality().hash(_metadata),
      products,
      entitlementType);

  @override
  String toString() {
    return 'CrosspayEntitlement(id: $id, name: $name, period: $period, description: $description, metadata: $metadata, products: $products, entitlementType: $entitlementType)';
  }
}

/// @nodoc
abstract mixin class _$CrosspayEntitlementCopyWith<$Res>
    implements $CrosspayEntitlementCopyWith<$Res> {
  factory _$CrosspayEntitlementCopyWith(_CrosspayEntitlement value,
          $Res Function(_CrosspayEntitlement) _then) =
      __$CrosspayEntitlementCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(
          name: "period_ms",
          fromJson: _durationFromMillis,
          toJson: _durationToMillis)
      Duration? period,
      String? description,
      @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
      Map<String, dynamic>? metadata,
      CrosspayProducts products,
      @JsonKey(name: "entitlement_type") EntitlementType entitlementType});

  @override
  $CrosspayProductsCopyWith<$Res> get products;
}

/// @nodoc
class __$CrosspayEntitlementCopyWithImpl<$Res>
    implements _$CrosspayEntitlementCopyWith<$Res> {
  __$CrosspayEntitlementCopyWithImpl(this._self, this._then);

  final _CrosspayEntitlement _self;
  final $Res Function(_CrosspayEntitlement) _then;

  /// Create a copy of CrosspayEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? period = freezed,
    Object? description = freezed,
    Object? metadata = freezed,
    Object? products = null,
    Object? entitlementType = null,
  }) {
    return _then(_CrosspayEntitlement(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      period: freezed == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as Duration?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as CrosspayProducts,
      entitlementType: null == entitlementType
          ? _self.entitlementType
          : entitlementType // ignore: cast_nullable_to_non_nullable
              as EntitlementType,
    ));
  }

  /// Create a copy of CrosspayEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductsCopyWith<$Res> get products {
    return $CrosspayProductsCopyWith<$Res>(_self.products, (value) {
      return _then(_self.copyWith(products: value));
    });
  }
}

/// @nodoc
mixin _$CrosspayProducts {
  @JsonKey(name: "playstore")
  CrosspayProduct? get playStore;
  @JsonKey(name: "appstore")
  CrosspayProduct? get appStore;
  CrosspayProduct? get stripe;
  CrosspayProduct? get gocardless;

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CrosspayProductsCopyWith<CrosspayProducts> get copyWith =>
      _$CrosspayProductsCopyWithImpl<CrosspayProducts>(
          this as CrosspayProducts, _$identity);

  /// Serializes this CrosspayProducts to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CrosspayProducts &&
            (identical(other.playStore, playStore) ||
                other.playStore == playStore) &&
            (identical(other.appStore, appStore) ||
                other.appStore == appStore) &&
            (identical(other.stripe, stripe) || other.stripe == stripe) &&
            (identical(other.gocardless, gocardless) ||
                other.gocardless == gocardless));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, playStore, appStore, stripe, gocardless);

  @override
  String toString() {
    return 'CrosspayProducts(playStore: $playStore, appStore: $appStore, stripe: $stripe, gocardless: $gocardless)';
  }
}

/// @nodoc
abstract mixin class $CrosspayProductsCopyWith<$Res> {
  factory $CrosspayProductsCopyWith(
          CrosspayProducts value, $Res Function(CrosspayProducts) _then) =
      _$CrosspayProductsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "playstore") CrosspayProduct? playStore,
      @JsonKey(name: "appstore") CrosspayProduct? appStore,
      CrosspayProduct? stripe,
      CrosspayProduct? gocardless});

  $CrosspayProductCopyWith<$Res>? get playStore;
  $CrosspayProductCopyWith<$Res>? get appStore;
  $CrosspayProductCopyWith<$Res>? get stripe;
  $CrosspayProductCopyWith<$Res>? get gocardless;
}

/// @nodoc
class _$CrosspayProductsCopyWithImpl<$Res>
    implements $CrosspayProductsCopyWith<$Res> {
  _$CrosspayProductsCopyWithImpl(this._self, this._then);

  final CrosspayProducts _self;
  final $Res Function(CrosspayProducts) _then;

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playStore = freezed,
    Object? appStore = freezed,
    Object? stripe = freezed,
    Object? gocardless = freezed,
  }) {
    return _then(_self.copyWith(
      playStore: freezed == playStore
          ? _self.playStore
          : playStore // ignore: cast_nullable_to_non_nullable
              as CrosspayProduct?,
      appStore: freezed == appStore
          ? _self.appStore
          : appStore // ignore: cast_nullable_to_non_nullable
              as CrosspayProduct?,
      stripe: freezed == stripe
          ? _self.stripe
          : stripe // ignore: cast_nullable_to_non_nullable
              as CrosspayProduct?,
      gocardless: freezed == gocardless
          ? _self.gocardless
          : gocardless // ignore: cast_nullable_to_non_nullable
              as CrosspayProduct?,
    ));
  }

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<$Res>? get playStore {
    if (_self.playStore == null) {
      return null;
    }

    return $CrosspayProductCopyWith<$Res>(_self.playStore!, (value) {
      return _then(_self.copyWith(playStore: value));
    });
  }

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<$Res>? get appStore {
    if (_self.appStore == null) {
      return null;
    }

    return $CrosspayProductCopyWith<$Res>(_self.appStore!, (value) {
      return _then(_self.copyWith(appStore: value));
    });
  }

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<$Res>? get stripe {
    if (_self.stripe == null) {
      return null;
    }

    return $CrosspayProductCopyWith<$Res>(_self.stripe!, (value) {
      return _then(_self.copyWith(stripe: value));
    });
  }

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<$Res>? get gocardless {
    if (_self.gocardless == null) {
      return null;
    }

    return $CrosspayProductCopyWith<$Res>(_self.gocardless!, (value) {
      return _then(_self.copyWith(gocardless: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CrosspayProducts].
extension CrosspayProductsPatterns on CrosspayProducts {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CrosspayProducts value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CrosspayProducts() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CrosspayProducts value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayProducts():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CrosspayProducts value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayProducts() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "playstore") CrosspayProduct? playStore,
            @JsonKey(name: "appstore") CrosspayProduct? appStore,
            CrosspayProduct? stripe,
            CrosspayProduct? gocardless)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CrosspayProducts() when $default != null:
        return $default(
            _that.playStore, _that.appStore, _that.stripe, _that.gocardless);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "playstore") CrosspayProduct? playStore,
            @JsonKey(name: "appstore") CrosspayProduct? appStore,
            CrosspayProduct? stripe,
            CrosspayProduct? gocardless)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayProducts():
        return $default(
            _that.playStore, _that.appStore, _that.stripe, _that.gocardless);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: "playstore") CrosspayProduct? playStore,
            @JsonKey(name: "appstore") CrosspayProduct? appStore,
            CrosspayProduct? stripe,
            CrosspayProduct? gocardless)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayProducts() when $default != null:
        return $default(
            _that.playStore, _that.appStore, _that.stripe, _that.gocardless);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CrosspayProducts extends CrosspayProducts {
  _CrosspayProducts(
      {@JsonKey(name: "playstore") this.playStore,
      @JsonKey(name: "appstore") this.appStore,
      this.stripe,
      this.gocardless})
      : super._();
  factory _CrosspayProducts.fromJson(Map<String, dynamic> json) =>
      _$CrosspayProductsFromJson(json);

  @override
  @JsonKey(name: "playstore")
  final CrosspayProduct? playStore;
  @override
  @JsonKey(name: "appstore")
  final CrosspayProduct? appStore;
  @override
  final CrosspayProduct? stripe;
  @override
  final CrosspayProduct? gocardless;

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CrosspayProductsCopyWith<_CrosspayProducts> get copyWith =>
      __$CrosspayProductsCopyWithImpl<_CrosspayProducts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CrosspayProductsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CrosspayProducts &&
            (identical(other.playStore, playStore) ||
                other.playStore == playStore) &&
            (identical(other.appStore, appStore) ||
                other.appStore == appStore) &&
            (identical(other.stripe, stripe) || other.stripe == stripe) &&
            (identical(other.gocardless, gocardless) ||
                other.gocardless == gocardless));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, playStore, appStore, stripe, gocardless);

  @override
  String toString() {
    return 'CrosspayProducts(playStore: $playStore, appStore: $appStore, stripe: $stripe, gocardless: $gocardless)';
  }
}

/// @nodoc
abstract mixin class _$CrosspayProductsCopyWith<$Res>
    implements $CrosspayProductsCopyWith<$Res> {
  factory _$CrosspayProductsCopyWith(
          _CrosspayProducts value, $Res Function(_CrosspayProducts) _then) =
      __$CrosspayProductsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "playstore") CrosspayProduct? playStore,
      @JsonKey(name: "appstore") CrosspayProduct? appStore,
      CrosspayProduct? stripe,
      CrosspayProduct? gocardless});

  @override
  $CrosspayProductCopyWith<$Res>? get playStore;
  @override
  $CrosspayProductCopyWith<$Res>? get appStore;
  @override
  $CrosspayProductCopyWith<$Res>? get stripe;
  @override
  $CrosspayProductCopyWith<$Res>? get gocardless;
}

/// @nodoc
class __$CrosspayProductsCopyWithImpl<$Res>
    implements _$CrosspayProductsCopyWith<$Res> {
  __$CrosspayProductsCopyWithImpl(this._self, this._then);

  final _CrosspayProducts _self;
  final $Res Function(_CrosspayProducts) _then;

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playStore = freezed,
    Object? appStore = freezed,
    Object? stripe = freezed,
    Object? gocardless = freezed,
  }) {
    return _then(_CrosspayProducts(
      playStore: freezed == playStore
          ? _self.playStore
          : playStore // ignore: cast_nullable_to_non_nullable
              as CrosspayProduct?,
      appStore: freezed == appStore
          ? _self.appStore
          : appStore // ignore: cast_nullable_to_non_nullable
              as CrosspayProduct?,
      stripe: freezed == stripe
          ? _self.stripe
          : stripe // ignore: cast_nullable_to_non_nullable
              as CrosspayProduct?,
      gocardless: freezed == gocardless
          ? _self.gocardless
          : gocardless // ignore: cast_nullable_to_non_nullable
              as CrosspayProduct?,
    ));
  }

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<$Res>? get playStore {
    if (_self.playStore == null) {
      return null;
    }

    return $CrosspayProductCopyWith<$Res>(_self.playStore!, (value) {
      return _then(_self.copyWith(playStore: value));
    });
  }

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<$Res>? get appStore {
    if (_self.appStore == null) {
      return null;
    }

    return $CrosspayProductCopyWith<$Res>(_self.appStore!, (value) {
      return _then(_self.copyWith(appStore: value));
    });
  }

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<$Res>? get stripe {
    if (_self.stripe == null) {
      return null;
    }

    return $CrosspayProductCopyWith<$Res>(_self.stripe!, (value) {
      return _then(_self.copyWith(stripe: value));
    });
  }

  /// Create a copy of CrosspayProducts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<$Res>? get gocardless {
    if (_self.gocardless == null) {
      return null;
    }

    return $CrosspayProductCopyWith<$Res>(_self.gocardless!, (value) {
      return _then(_self.copyWith(gocardless: value));
    });
  }
}

/// @nodoc
mixin _$CrosspayProduct {
  String get id;
  @JsonKey(name: "product_id")
  String get productId;
  String get name;
  String? get description;
  @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
  Map<String, dynamic>? get metadata;

  /// Create a copy of CrosspayProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CrosspayProductCopyWith<CrosspayProduct> get copyWith =>
      _$CrosspayProductCopyWithImpl<CrosspayProduct>(
          this as CrosspayProduct, _$identity);

  /// Serializes this CrosspayProduct to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CrosspayProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, name, description,
      const DeepCollectionEquality().hash(metadata));

  @override
  String toString() {
    return 'CrosspayProduct(id: $id, productId: $productId, name: $name, description: $description, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class $CrosspayProductCopyWith<$Res> {
  factory $CrosspayProductCopyWith(
          CrosspayProduct value, $Res Function(CrosspayProduct) _then) =
      _$CrosspayProductCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "product_id") String productId,
      String name,
      String? description,
      @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$CrosspayProductCopyWithImpl<$Res>
    implements $CrosspayProductCopyWith<$Res> {
  _$CrosspayProductCopyWithImpl(this._self, this._then);

  final CrosspayProduct _self;
  final $Res Function(CrosspayProduct) _then;

  /// Create a copy of CrosspayProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? name = null,
    Object? description = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CrosspayProduct].
extension CrosspayProductPatterns on CrosspayProduct {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CrosspayProduct value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CrosspayProduct() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CrosspayProduct value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayProduct():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CrosspayProduct value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayProduct() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: "product_id") String productId,
            String name,
            String? description,
            @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
            Map<String, dynamic>? metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CrosspayProduct() when $default != null:
        return $default(_that.id, _that.productId, _that.name,
            _that.description, _that.metadata);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: "product_id") String productId,
            String name,
            String? description,
            @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
            Map<String, dynamic>? metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayProduct():
        return $default(_that.id, _that.productId, _that.name,
            _that.description, _that.metadata);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: "product_id") String productId,
            String name,
            String? description,
            @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
            Map<String, dynamic>? metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayProduct() when $default != null:
        return $default(_that.id, _that.productId, _that.name,
            _that.description, _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CrosspayProduct implements CrosspayProduct {
  _CrosspayProduct(
      {required this.id,
      @JsonKey(name: "product_id") required this.productId,
      required this.name,
      this.description,
      @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;
  factory _CrosspayProduct.fromJson(Map<String, dynamic> json) =>
      _$CrosspayProductFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "product_id")
  final String productId;
  @override
  final String name;
  @override
  final String? description;
  final Map<String, dynamic>? _metadata;
  @override
  @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of CrosspayProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CrosspayProductCopyWith<_CrosspayProduct> get copyWith =>
      __$CrosspayProductCopyWithImpl<_CrosspayProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CrosspayProductToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CrosspayProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, productId, name, description,
      const DeepCollectionEquality().hash(_metadata));

  @override
  String toString() {
    return 'CrosspayProduct(id: $id, productId: $productId, name: $name, description: $description, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$CrosspayProductCopyWith<$Res>
    implements $CrosspayProductCopyWith<$Res> {
  factory _$CrosspayProductCopyWith(
          _CrosspayProduct value, $Res Function(_CrosspayProduct) _then) =
      __$CrosspayProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "product_id") String productId,
      String name,
      String? description,
      @JsonKey(fromJson: _fromJsonMetadata, toJson: _toJsonMetadata)
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$CrosspayProductCopyWithImpl<$Res>
    implements _$CrosspayProductCopyWith<$Res> {
  __$CrosspayProductCopyWithImpl(this._self, this._then);

  final _CrosspayProduct _self;
  final $Res Function(_CrosspayProduct) _then;

  /// Create a copy of CrosspayProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? name = null,
    Object? description = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_CrosspayProduct(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
mixin _$CrosspayStorableEntitlement {
  String get id;
  @JsonKey(name: "product_id")
  String get productId;
  @JsonKey(name: "entitlement_id")
  String get entitlementId;
  @JsonKey(
      name: "expires_at",
      fromJson: _dateTimeFromEpoch,
      toJson: _dateTimeToEpoch)
  DateTime get expiresAt;
  @JsonKey(
      name: "trial_expires_at",
      fromJson: _dateTimeNullableFromEpoch,
      toJson: _dateTimeNullableToEpoch)
  DateTime? get trialExpiresAt;
  CrosspayStore get store;
  EntitlementStatus get status;
  @JsonKey(name: "renewal_status")
  SubscriptionRenewalStatus? get renewalStatus;
  @JsonKey(name: "entitlement_type")
  EntitlementType get entitlementType;
  @JsonKey(name: "purchase_state")
  String? get purchaseState;

  /// Create a copy of CrosspayStorableEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CrosspayStorableEntitlementCopyWith<CrosspayStorableEntitlement>
      get copyWith => _$CrosspayStorableEntitlementCopyWithImpl<
              CrosspayStorableEntitlement>(
          this as CrosspayStorableEntitlement, _$identity);

  /// Serializes this CrosspayStorableEntitlement to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CrosspayStorableEntitlement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.entitlementId, entitlementId) ||
                other.entitlementId == entitlementId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.trialExpiresAt, trialExpiresAt) ||
                other.trialExpiresAt == trialExpiresAt) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.renewalStatus, renewalStatus) ||
                other.renewalStatus == renewalStatus) &&
            (identical(other.entitlementType, entitlementType) ||
                other.entitlementType == entitlementType) &&
            (identical(other.purchaseState, purchaseState) ||
                other.purchaseState == purchaseState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      entitlementId,
      expiresAt,
      trialExpiresAt,
      store,
      status,
      renewalStatus,
      entitlementType,
      purchaseState);

  @override
  String toString() {
    return 'CrosspayStorableEntitlement(id: $id, productId: $productId, entitlementId: $entitlementId, expiresAt: $expiresAt, trialExpiresAt: $trialExpiresAt, store: $store, status: $status, renewalStatus: $renewalStatus, entitlementType: $entitlementType, purchaseState: $purchaseState)';
  }
}

/// @nodoc
abstract mixin class $CrosspayStorableEntitlementCopyWith<$Res> {
  factory $CrosspayStorableEntitlementCopyWith(
          CrosspayStorableEntitlement value,
          $Res Function(CrosspayStorableEntitlement) _then) =
      _$CrosspayStorableEntitlementCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "product_id") String productId,
      @JsonKey(name: "entitlement_id") String entitlementId,
      @JsonKey(
          name: "expires_at",
          fromJson: _dateTimeFromEpoch,
          toJson: _dateTimeToEpoch)
      DateTime expiresAt,
      @JsonKey(
          name: "trial_expires_at",
          fromJson: _dateTimeNullableFromEpoch,
          toJson: _dateTimeNullableToEpoch)
      DateTime? trialExpiresAt,
      CrosspayStore store,
      EntitlementStatus status,
      @JsonKey(name: "renewal_status") SubscriptionRenewalStatus? renewalStatus,
      @JsonKey(name: "entitlement_type") EntitlementType entitlementType,
      @JsonKey(name: "purchase_state") String? purchaseState});
}

/// @nodoc
class _$CrosspayStorableEntitlementCopyWithImpl<$Res>
    implements $CrosspayStorableEntitlementCopyWith<$Res> {
  _$CrosspayStorableEntitlementCopyWithImpl(this._self, this._then);

  final CrosspayStorableEntitlement _self;
  final $Res Function(CrosspayStorableEntitlement) _then;

  /// Create a copy of CrosspayStorableEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? entitlementId = null,
    Object? expiresAt = null,
    Object? trialExpiresAt = freezed,
    Object? store = null,
    Object? status = null,
    Object? renewalStatus = freezed,
    Object? entitlementType = null,
    Object? purchaseState = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      entitlementId: null == entitlementId
          ? _self.entitlementId
          : entitlementId // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trialExpiresAt: freezed == trialExpiresAt
          ? _self.trialExpiresAt
          : trialExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      store: null == store
          ? _self.store
          : store // ignore: cast_nullable_to_non_nullable
              as CrosspayStore,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as EntitlementStatus,
      renewalStatus: freezed == renewalStatus
          ? _self.renewalStatus
          : renewalStatus // ignore: cast_nullable_to_non_nullable
              as SubscriptionRenewalStatus?,
      entitlementType: null == entitlementType
          ? _self.entitlementType
          : entitlementType // ignore: cast_nullable_to_non_nullable
              as EntitlementType,
      purchaseState: freezed == purchaseState
          ? _self.purchaseState
          : purchaseState // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CrosspayStorableEntitlement].
extension CrosspayStorableEntitlementPatterns on CrosspayStorableEntitlement {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CrosspayStorableEntitlement value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CrosspayStorableEntitlement() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CrosspayStorableEntitlement value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayStorableEntitlement():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CrosspayStorableEntitlement value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayStorableEntitlement() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: "product_id") String productId,
            @JsonKey(name: "entitlement_id") String entitlementId,
            @JsonKey(
                name: "expires_at",
                fromJson: _dateTimeFromEpoch,
                toJson: _dateTimeToEpoch)
            DateTime expiresAt,
            @JsonKey(
                name: "trial_expires_at",
                fromJson: _dateTimeNullableFromEpoch,
                toJson: _dateTimeNullableToEpoch)
            DateTime? trialExpiresAt,
            CrosspayStore store,
            EntitlementStatus status,
            @JsonKey(name: "renewal_status")
            SubscriptionRenewalStatus? renewalStatus,
            @JsonKey(name: "entitlement_type") EntitlementType entitlementType,
            @JsonKey(name: "purchase_state") String? purchaseState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CrosspayStorableEntitlement() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.entitlementId,
            _that.expiresAt,
            _that.trialExpiresAt,
            _that.store,
            _that.status,
            _that.renewalStatus,
            _that.entitlementType,
            _that.purchaseState);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: "product_id") String productId,
            @JsonKey(name: "entitlement_id") String entitlementId,
            @JsonKey(
                name: "expires_at",
                fromJson: _dateTimeFromEpoch,
                toJson: _dateTimeToEpoch)
            DateTime expiresAt,
            @JsonKey(
                name: "trial_expires_at",
                fromJson: _dateTimeNullableFromEpoch,
                toJson: _dateTimeNullableToEpoch)
            DateTime? trialExpiresAt,
            CrosspayStore store,
            EntitlementStatus status,
            @JsonKey(name: "renewal_status")
            SubscriptionRenewalStatus? renewalStatus,
            @JsonKey(name: "entitlement_type") EntitlementType entitlementType,
            @JsonKey(name: "purchase_state") String? purchaseState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayStorableEntitlement():
        return $default(
            _that.id,
            _that.productId,
            _that.entitlementId,
            _that.expiresAt,
            _that.trialExpiresAt,
            _that.store,
            _that.status,
            _that.renewalStatus,
            _that.entitlementType,
            _that.purchaseState);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: "product_id") String productId,
            @JsonKey(name: "entitlement_id") String entitlementId,
            @JsonKey(
                name: "expires_at",
                fromJson: _dateTimeFromEpoch,
                toJson: _dateTimeToEpoch)
            DateTime expiresAt,
            @JsonKey(
                name: "trial_expires_at",
                fromJson: _dateTimeNullableFromEpoch,
                toJson: _dateTimeNullableToEpoch)
            DateTime? trialExpiresAt,
            CrosspayStore store,
            EntitlementStatus status,
            @JsonKey(name: "renewal_status")
            SubscriptionRenewalStatus? renewalStatus,
            @JsonKey(name: "entitlement_type") EntitlementType entitlementType,
            @JsonKey(name: "purchase_state") String? purchaseState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CrosspayStorableEntitlement() when $default != null:
        return $default(
            _that.id,
            _that.productId,
            _that.entitlementId,
            _that.expiresAt,
            _that.trialExpiresAt,
            _that.store,
            _that.status,
            _that.renewalStatus,
            _that.entitlementType,
            _that.purchaseState);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CrosspayStorableEntitlement implements CrosspayStorableEntitlement {
  _CrosspayStorableEntitlement(
      {required this.id,
      @JsonKey(name: "product_id") required this.productId,
      @JsonKey(name: "entitlement_id") required this.entitlementId,
      @JsonKey(
          name: "expires_at",
          fromJson: _dateTimeFromEpoch,
          toJson: _dateTimeToEpoch)
      required this.expiresAt,
      @JsonKey(
          name: "trial_expires_at",
          fromJson: _dateTimeNullableFromEpoch,
          toJson: _dateTimeNullableToEpoch)
      this.trialExpiresAt,
      required this.store,
      required this.status,
      @JsonKey(name: "renewal_status") required this.renewalStatus,
      @JsonKey(name: "entitlement_type") required this.entitlementType,
      @JsonKey(name: "purchase_state") this.purchaseState});
  factory _CrosspayStorableEntitlement.fromJson(Map<String, dynamic> json) =>
      _$CrosspayStorableEntitlementFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "product_id")
  final String productId;
  @override
  @JsonKey(name: "entitlement_id")
  final String entitlementId;
  @override
  @JsonKey(
      name: "expires_at",
      fromJson: _dateTimeFromEpoch,
      toJson: _dateTimeToEpoch)
  final DateTime expiresAt;
  @override
  @JsonKey(
      name: "trial_expires_at",
      fromJson: _dateTimeNullableFromEpoch,
      toJson: _dateTimeNullableToEpoch)
  final DateTime? trialExpiresAt;
  @override
  final CrosspayStore store;
  @override
  final EntitlementStatus status;
  @override
  @JsonKey(name: "renewal_status")
  final SubscriptionRenewalStatus? renewalStatus;
  @override
  @JsonKey(name: "entitlement_type")
  final EntitlementType entitlementType;
  @override
  @JsonKey(name: "purchase_state")
  final String? purchaseState;

  /// Create a copy of CrosspayStorableEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CrosspayStorableEntitlementCopyWith<_CrosspayStorableEntitlement>
      get copyWith => __$CrosspayStorableEntitlementCopyWithImpl<
          _CrosspayStorableEntitlement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CrosspayStorableEntitlementToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CrosspayStorableEntitlement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.entitlementId, entitlementId) ||
                other.entitlementId == entitlementId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.trialExpiresAt, trialExpiresAt) ||
                other.trialExpiresAt == trialExpiresAt) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.renewalStatus, renewalStatus) ||
                other.renewalStatus == renewalStatus) &&
            (identical(other.entitlementType, entitlementType) ||
                other.entitlementType == entitlementType) &&
            (identical(other.purchaseState, purchaseState) ||
                other.purchaseState == purchaseState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productId,
      entitlementId,
      expiresAt,
      trialExpiresAt,
      store,
      status,
      renewalStatus,
      entitlementType,
      purchaseState);

  @override
  String toString() {
    return 'CrosspayStorableEntitlement(id: $id, productId: $productId, entitlementId: $entitlementId, expiresAt: $expiresAt, trialExpiresAt: $trialExpiresAt, store: $store, status: $status, renewalStatus: $renewalStatus, entitlementType: $entitlementType, purchaseState: $purchaseState)';
  }
}

/// @nodoc
abstract mixin class _$CrosspayStorableEntitlementCopyWith<$Res>
    implements $CrosspayStorableEntitlementCopyWith<$Res> {
  factory _$CrosspayStorableEntitlementCopyWith(
          _CrosspayStorableEntitlement value,
          $Res Function(_CrosspayStorableEntitlement) _then) =
      __$CrosspayStorableEntitlementCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "product_id") String productId,
      @JsonKey(name: "entitlement_id") String entitlementId,
      @JsonKey(
          name: "expires_at",
          fromJson: _dateTimeFromEpoch,
          toJson: _dateTimeToEpoch)
      DateTime expiresAt,
      @JsonKey(
          name: "trial_expires_at",
          fromJson: _dateTimeNullableFromEpoch,
          toJson: _dateTimeNullableToEpoch)
      DateTime? trialExpiresAt,
      CrosspayStore store,
      EntitlementStatus status,
      @JsonKey(name: "renewal_status") SubscriptionRenewalStatus? renewalStatus,
      @JsonKey(name: "entitlement_type") EntitlementType entitlementType,
      @JsonKey(name: "purchase_state") String? purchaseState});
}

/// @nodoc
class __$CrosspayStorableEntitlementCopyWithImpl<$Res>
    implements _$CrosspayStorableEntitlementCopyWith<$Res> {
  __$CrosspayStorableEntitlementCopyWithImpl(this._self, this._then);

  final _CrosspayStorableEntitlement _self;
  final $Res Function(_CrosspayStorableEntitlement) _then;

  /// Create a copy of CrosspayStorableEntitlement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? entitlementId = null,
    Object? expiresAt = null,
    Object? trialExpiresAt = freezed,
    Object? store = null,
    Object? status = null,
    Object? renewalStatus = freezed,
    Object? entitlementType = null,
    Object? purchaseState = freezed,
  }) {
    return _then(_CrosspayStorableEntitlement(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      entitlementId: null == entitlementId
          ? _self.entitlementId
          : entitlementId // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      trialExpiresAt: freezed == trialExpiresAt
          ? _self.trialExpiresAt
          : trialExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      store: null == store
          ? _self.store
          : store // ignore: cast_nullable_to_non_nullable
              as CrosspayStore,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as EntitlementStatus,
      renewalStatus: freezed == renewalStatus
          ? _self.renewalStatus
          : renewalStatus // ignore: cast_nullable_to_non_nullable
              as SubscriptionRenewalStatus?,
      entitlementType: null == entitlementType
          ? _self.entitlementType
          : entitlementType // ignore: cast_nullable_to_non_nullable
              as EntitlementType,
      purchaseState: freezed == purchaseState
          ? _self.purchaseState
          : purchaseState // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SubscriptionGocardlessProduct {
  String get id;
  String get name;
  String? get description;
  @JsonKey(name: "formatted_price")
  String get formattedPrice;
  int get price;
  String get currency;

  /// Create a copy of SubscriptionGocardlessProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionGocardlessProductCopyWith<SubscriptionGocardlessProduct>
      get copyWith => _$SubscriptionGocardlessProductCopyWithImpl<
              SubscriptionGocardlessProduct>(
          this as SubscriptionGocardlessProduct, _$identity);

  /// Serializes this SubscriptionGocardlessProduct to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionGocardlessProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, formattedPrice, price, currency);

  @override
  String toString() {
    return 'SubscriptionGocardlessProduct(id: $id, name: $name, description: $description, formattedPrice: $formattedPrice, price: $price, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionGocardlessProductCopyWith<$Res> {
  factory $SubscriptionGocardlessProductCopyWith(
          SubscriptionGocardlessProduct value,
          $Res Function(SubscriptionGocardlessProduct) _then) =
      _$SubscriptionGocardlessProductCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      @JsonKey(name: "formatted_price") String formattedPrice,
      int price,
      String currency});
}

/// @nodoc
class _$SubscriptionGocardlessProductCopyWithImpl<$Res>
    implements $SubscriptionGocardlessProductCopyWith<$Res> {
  _$SubscriptionGocardlessProductCopyWithImpl(this._self, this._then);

  final SubscriptionGocardlessProduct _self;
  final $Res Function(SubscriptionGocardlessProduct) _then;

  /// Create a copy of SubscriptionGocardlessProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? formattedPrice = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedPrice: null == formattedPrice
          ? _self.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscriptionGocardlessProduct].
extension SubscriptionGocardlessProductPatterns
    on SubscriptionGocardlessProduct {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SubscriptionGocardlessProduct value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGocardlessProduct() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SubscriptionGocardlessProduct value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGocardlessProduct():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SubscriptionGocardlessProduct value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGocardlessProduct() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(name: "formatted_price") String formattedPrice,
            int price,
            String currency)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGocardlessProduct() when $default != null:
        return $default(_that.id, _that.name, _that.description,
            _that.formattedPrice, _that.price, _that.currency);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            String name,
            String? description,
            @JsonKey(name: "formatted_price") String formattedPrice,
            int price,
            String currency)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGocardlessProduct():
        return $default(_that.id, _that.name, _that.description,
            _that.formattedPrice, _that.price, _that.currency);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            String name,
            String? description,
            @JsonKey(name: "formatted_price") String formattedPrice,
            int price,
            String currency)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionGocardlessProduct() when $default != null:
        return $default(_that.id, _that.name, _that.description,
            _that.formattedPrice, _that.price, _that.currency);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionGocardlessProduct implements SubscriptionGocardlessProduct {
  _SubscriptionGocardlessProduct(
      {required this.id,
      required this.name,
      this.description,
      @JsonKey(name: "formatted_price") required this.formattedPrice,
      required this.price,
      required this.currency});
  factory _SubscriptionGocardlessProduct.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGocardlessProductFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: "formatted_price")
  final String formattedPrice;
  @override
  final int price;
  @override
  final String currency;

  /// Create a copy of SubscriptionGocardlessProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionGocardlessProductCopyWith<_SubscriptionGocardlessProduct>
      get copyWith => __$SubscriptionGocardlessProductCopyWithImpl<
          _SubscriptionGocardlessProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionGocardlessProductToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionGocardlessProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, formattedPrice, price, currency);

  @override
  String toString() {
    return 'SubscriptionGocardlessProduct(id: $id, name: $name, description: $description, formattedPrice: $formattedPrice, price: $price, currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionGocardlessProductCopyWith<$Res>
    implements $SubscriptionGocardlessProductCopyWith<$Res> {
  factory _$SubscriptionGocardlessProductCopyWith(
          _SubscriptionGocardlessProduct value,
          $Res Function(_SubscriptionGocardlessProduct) _then) =
      __$SubscriptionGocardlessProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      @JsonKey(name: "formatted_price") String formattedPrice,
      int price,
      String currency});
}

/// @nodoc
class __$SubscriptionGocardlessProductCopyWithImpl<$Res>
    implements _$SubscriptionGocardlessProductCopyWith<$Res> {
  __$SubscriptionGocardlessProductCopyWithImpl(this._self, this._then);

  final _SubscriptionGocardlessProduct _self;
  final $Res Function(_SubscriptionGocardlessProduct) _then;

  /// Create a copy of SubscriptionGocardlessProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? formattedPrice = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_SubscriptionGocardlessProduct(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      formattedPrice: null == formattedPrice
          ? _self.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SubscriptionStripeProduct {
  /// Unique identifier for the object.
  String get id;

  /// String representing the object's type. Objects of the same type share the same value.
  @JsonKey(name: 'object')
  String get objectType;

  /// Whether the product is currently available for purchase.
  bool get active;

  /// Time at which the object was created. Measured in seconds since the Unix epoch.
  int get created;

  /// The ID of the Price object that is the default price for this product.
  SubscriptionStripePrice get price;

  /// Always true for a deleted object
  bool? get deleted;

  /// The product's description, meant to be displayable to the customer.
  String? get description;

  /// A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
  List<String> get images;

  /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
  bool get livemode;

  /// Set of key-value pairs that you can attach to an object.
  Map<String, dynamic> get metadata;

  /// The product's name, meant to be displayable to the customer.
  String get name;

  /// Whether this product is shipped (i.e., physical goods).
  bool? get shippable;

  /// Extra information about a product which will appear on your customer's credit card statement.
  @JsonKey(name: 'statement_descriptor')
  String? get statementDescriptor;

  /// The type of the product. The product is either of type 'good' or 'service'.
  String get type;

  /// A label that represents units of this product.
  @JsonKey(name: 'unit_label')
  String? get unitLabel;

  /// Time at which the object was last updated. Measured in seconds since the Unix epoch.
  int get updated;

  /// A URL of a publicly-accessible webpage for this product.
  String? get url;

  /// Create a copy of SubscriptionStripeProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionStripeProductCopyWith<SubscriptionStripeProduct> get copyWith =>
      _$SubscriptionStripeProductCopyWithImpl<SubscriptionStripeProduct>(
          this as SubscriptionStripeProduct, _$identity);

  /// Serializes this SubscriptionStripeProduct to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionStripeProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.livemode, livemode) ||
                other.livemode == livemode) &&
            const DeepCollectionEquality().equals(other.metadata, metadata) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shippable, shippable) ||
                other.shippable == shippable) &&
            (identical(other.statementDescriptor, statementDescriptor) ||
                other.statementDescriptor == statementDescriptor) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unitLabel, unitLabel) ||
                other.unitLabel == unitLabel) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      objectType,
      active,
      created,
      price,
      deleted,
      description,
      const DeepCollectionEquality().hash(images),
      livemode,
      const DeepCollectionEquality().hash(metadata),
      name,
      shippable,
      statementDescriptor,
      type,
      unitLabel,
      updated,
      url);

  @override
  String toString() {
    return 'SubscriptionStripeProduct(id: $id, objectType: $objectType, active: $active, created: $created, price: $price, deleted: $deleted, description: $description, images: $images, livemode: $livemode, metadata: $metadata, name: $name, shippable: $shippable, statementDescriptor: $statementDescriptor, type: $type, unitLabel: $unitLabel, updated: $updated, url: $url)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionStripeProductCopyWith<$Res> {
  factory $SubscriptionStripeProductCopyWith(SubscriptionStripeProduct value,
          $Res Function(SubscriptionStripeProduct) _then) =
      _$SubscriptionStripeProductCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'object') String objectType,
      bool active,
      int created,
      SubscriptionStripePrice price,
      bool? deleted,
      String? description,
      List<String> images,
      bool livemode,
      Map<String, dynamic> metadata,
      String name,
      bool? shippable,
      @JsonKey(name: 'statement_descriptor') String? statementDescriptor,
      String type,
      @JsonKey(name: 'unit_label') String? unitLabel,
      int updated,
      String? url});

  $SubscriptionStripePriceCopyWith<$Res> get price;
}

/// @nodoc
class _$SubscriptionStripeProductCopyWithImpl<$Res>
    implements $SubscriptionStripeProductCopyWith<$Res> {
  _$SubscriptionStripeProductCopyWithImpl(this._self, this._then);

  final SubscriptionStripeProduct _self;
  final $Res Function(SubscriptionStripeProduct) _then;

  /// Create a copy of SubscriptionStripeProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? objectType = null,
    Object? active = null,
    Object? created = null,
    Object? price = null,
    Object? deleted = freezed,
    Object? description = freezed,
    Object? images = null,
    Object? livemode = null,
    Object? metadata = null,
    Object? name = null,
    Object? shippable = freezed,
    Object? statementDescriptor = freezed,
    Object? type = null,
    Object? unitLabel = freezed,
    Object? updated = null,
    Object? url = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      objectType: null == objectType
          ? _self.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as SubscriptionStripePrice,
      deleted: freezed == deleted
          ? _self.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      livemode: null == livemode
          ? _self.livemode
          : livemode // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shippable: freezed == shippable
          ? _self.shippable
          : shippable // ignore: cast_nullable_to_non_nullable
              as bool?,
      statementDescriptor: freezed == statementDescriptor
          ? _self.statementDescriptor
          : statementDescriptor // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      unitLabel: freezed == unitLabel
          ? _self.unitLabel
          : unitLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: null == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of SubscriptionStripeProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionStripePriceCopyWith<$Res> get price {
    return $SubscriptionStripePriceCopyWith<$Res>(_self.price, (value) {
      return _then(_self.copyWith(price: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SubscriptionStripeProduct].
extension SubscriptionStripeProductPatterns on SubscriptionStripeProduct {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SubscriptionStripeProduct value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripeProduct() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SubscriptionStripeProduct value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripeProduct():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SubscriptionStripeProduct value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripeProduct() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'object') String objectType,
            bool active,
            int created,
            SubscriptionStripePrice price,
            bool? deleted,
            String? description,
            List<String> images,
            bool livemode,
            Map<String, dynamic> metadata,
            String name,
            bool? shippable,
            @JsonKey(name: 'statement_descriptor') String? statementDescriptor,
            String type,
            @JsonKey(name: 'unit_label') String? unitLabel,
            int updated,
            String? url)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripeProduct() when $default != null:
        return $default(
            _that.id,
            _that.objectType,
            _that.active,
            _that.created,
            _that.price,
            _that.deleted,
            _that.description,
            _that.images,
            _that.livemode,
            _that.metadata,
            _that.name,
            _that.shippable,
            _that.statementDescriptor,
            _that.type,
            _that.unitLabel,
            _that.updated,
            _that.url);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'object') String objectType,
            bool active,
            int created,
            SubscriptionStripePrice price,
            bool? deleted,
            String? description,
            List<String> images,
            bool livemode,
            Map<String, dynamic> metadata,
            String name,
            bool? shippable,
            @JsonKey(name: 'statement_descriptor') String? statementDescriptor,
            String type,
            @JsonKey(name: 'unit_label') String? unitLabel,
            int updated,
            String? url)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripeProduct():
        return $default(
            _that.id,
            _that.objectType,
            _that.active,
            _that.created,
            _that.price,
            _that.deleted,
            _that.description,
            _that.images,
            _that.livemode,
            _that.metadata,
            _that.name,
            _that.shippable,
            _that.statementDescriptor,
            _that.type,
            _that.unitLabel,
            _that.updated,
            _that.url);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: 'object') String objectType,
            bool active,
            int created,
            SubscriptionStripePrice price,
            bool? deleted,
            String? description,
            List<String> images,
            bool livemode,
            Map<String, dynamic> metadata,
            String name,
            bool? shippable,
            @JsonKey(name: 'statement_descriptor') String? statementDescriptor,
            String type,
            @JsonKey(name: 'unit_label') String? unitLabel,
            int updated,
            String? url)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripeProduct() when $default != null:
        return $default(
            _that.id,
            _that.objectType,
            _that.active,
            _that.created,
            _that.price,
            _that.deleted,
            _that.description,
            _that.images,
            _that.livemode,
            _that.metadata,
            _that.name,
            _that.shippable,
            _that.statementDescriptor,
            _that.type,
            _that.unitLabel,
            _that.updated,
            _that.url);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionStripeProduct implements SubscriptionStripeProduct {
  const _SubscriptionStripeProduct(
      {required this.id,
      @JsonKey(name: 'object') required this.objectType,
      required this.active,
      required this.created,
      required this.price,
      this.deleted,
      this.description,
      required final List<String> images,
      required this.livemode,
      required final Map<String, dynamic> metadata,
      required this.name,
      this.shippable,
      @JsonKey(name: 'statement_descriptor') this.statementDescriptor,
      required this.type,
      @JsonKey(name: 'unit_label') this.unitLabel,
      required this.updated,
      this.url})
      : _images = images,
        _metadata = metadata;
  factory _SubscriptionStripeProduct.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStripeProductFromJson(json);

  /// Unique identifier for the object.
  @override
  final String id;

  /// String representing the object's type. Objects of the same type share the same value.
  @override
  @JsonKey(name: 'object')
  final String objectType;

  /// Whether the product is currently available for purchase.
  @override
  final bool active;

  /// Time at which the object was created. Measured in seconds since the Unix epoch.
  @override
  final int created;

  /// The ID of the Price object that is the default price for this product.
  @override
  final SubscriptionStripePrice price;

  /// Always true for a deleted object
  @override
  final bool? deleted;

  /// The product's description, meant to be displayable to the customer.
  @override
  final String? description;

  /// A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
  final List<String> _images;

  /// A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
  @override
  final bool livemode;

  /// Set of key-value pairs that you can attach to an object.
  final Map<String, dynamic> _metadata;

  /// Set of key-value pairs that you can attach to an object.
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  /// The product's name, meant to be displayable to the customer.
  @override
  final String name;

  /// Whether this product is shipped (i.e., physical goods).
  @override
  final bool? shippable;

  /// Extra information about a product which will appear on your customer's credit card statement.
  @override
  @JsonKey(name: 'statement_descriptor')
  final String? statementDescriptor;

  /// The type of the product. The product is either of type 'good' or 'service'.
  @override
  final String type;

  /// A label that represents units of this product.
  @override
  @JsonKey(name: 'unit_label')
  final String? unitLabel;

  /// Time at which the object was last updated. Measured in seconds since the Unix epoch.
  @override
  final int updated;

  /// A URL of a publicly-accessible webpage for this product.
  @override
  final String? url;

  /// Create a copy of SubscriptionStripeProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionStripeProductCopyWith<_SubscriptionStripeProduct>
      get copyWith =>
          __$SubscriptionStripeProductCopyWithImpl<_SubscriptionStripeProduct>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionStripeProductToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionStripeProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.objectType, objectType) ||
                other.objectType == objectType) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.livemode, livemode) ||
                other.livemode == livemode) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shippable, shippable) ||
                other.shippable == shippable) &&
            (identical(other.statementDescriptor, statementDescriptor) ||
                other.statementDescriptor == statementDescriptor) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unitLabel, unitLabel) ||
                other.unitLabel == unitLabel) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      objectType,
      active,
      created,
      price,
      deleted,
      description,
      const DeepCollectionEquality().hash(_images),
      livemode,
      const DeepCollectionEquality().hash(_metadata),
      name,
      shippable,
      statementDescriptor,
      type,
      unitLabel,
      updated,
      url);

  @override
  String toString() {
    return 'SubscriptionStripeProduct(id: $id, objectType: $objectType, active: $active, created: $created, price: $price, deleted: $deleted, description: $description, images: $images, livemode: $livemode, metadata: $metadata, name: $name, shippable: $shippable, statementDescriptor: $statementDescriptor, type: $type, unitLabel: $unitLabel, updated: $updated, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionStripeProductCopyWith<$Res>
    implements $SubscriptionStripeProductCopyWith<$Res> {
  factory _$SubscriptionStripeProductCopyWith(_SubscriptionStripeProduct value,
          $Res Function(_SubscriptionStripeProduct) _then) =
      __$SubscriptionStripeProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'object') String objectType,
      bool active,
      int created,
      SubscriptionStripePrice price,
      bool? deleted,
      String? description,
      List<String> images,
      bool livemode,
      Map<String, dynamic> metadata,
      String name,
      bool? shippable,
      @JsonKey(name: 'statement_descriptor') String? statementDescriptor,
      String type,
      @JsonKey(name: 'unit_label') String? unitLabel,
      int updated,
      String? url});

  @override
  $SubscriptionStripePriceCopyWith<$Res> get price;
}

/// @nodoc
class __$SubscriptionStripeProductCopyWithImpl<$Res>
    implements _$SubscriptionStripeProductCopyWith<$Res> {
  __$SubscriptionStripeProductCopyWithImpl(this._self, this._then);

  final _SubscriptionStripeProduct _self;
  final $Res Function(_SubscriptionStripeProduct) _then;

  /// Create a copy of SubscriptionStripeProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? objectType = null,
    Object? active = null,
    Object? created = null,
    Object? price = null,
    Object? deleted = freezed,
    Object? description = freezed,
    Object? images = null,
    Object? livemode = null,
    Object? metadata = null,
    Object? name = null,
    Object? shippable = freezed,
    Object? statementDescriptor = freezed,
    Object? type = null,
    Object? unitLabel = freezed,
    Object? updated = null,
    Object? url = freezed,
  }) {
    return _then(_SubscriptionStripeProduct(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      objectType: null == objectType
          ? _self.objectType
          : objectType // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as SubscriptionStripePrice,
      deleted: freezed == deleted
          ? _self.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      livemode: null == livemode
          ? _self.livemode
          : livemode // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shippable: freezed == shippable
          ? _self.shippable
          : shippable // ignore: cast_nullable_to_non_nullable
              as bool?,
      statementDescriptor: freezed == statementDescriptor
          ? _self.statementDescriptor
          : statementDescriptor // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      unitLabel: freezed == unitLabel
          ? _self.unitLabel
          : unitLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      updated: null == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of SubscriptionStripeProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionStripePriceCopyWith<$Res> get price {
    return $SubscriptionStripePriceCopyWith<$Res>(_self.price, (value) {
      return _then(_self.copyWith(price: value));
    });
  }
}

/// @nodoc
mixin _$SubscriptionStripePrice {
  String get id;
  int get price;
  String get currency;
  String get formattedPrice;
  String get unitLabel;

  /// Create a copy of SubscriptionStripePrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionStripePriceCopyWith<SubscriptionStripePrice> get copyWith =>
      _$SubscriptionStripePriceCopyWithImpl<SubscriptionStripePrice>(
          this as SubscriptionStripePrice, _$identity);

  /// Serializes this SubscriptionStripePrice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionStripePrice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.unitLabel, unitLabel) ||
                other.unitLabel == unitLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, price, currency, formattedPrice, unitLabel);

  @override
  String toString() {
    return 'SubscriptionStripePrice(id: $id, price: $price, currency: $currency, formattedPrice: $formattedPrice, unitLabel: $unitLabel)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionStripePriceCopyWith<$Res> {
  factory $SubscriptionStripePriceCopyWith(SubscriptionStripePrice value,
          $Res Function(SubscriptionStripePrice) _then) =
      _$SubscriptionStripePriceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int price,
      String currency,
      String formattedPrice,
      String unitLabel});
}

/// @nodoc
class _$SubscriptionStripePriceCopyWithImpl<$Res>
    implements $SubscriptionStripePriceCopyWith<$Res> {
  _$SubscriptionStripePriceCopyWithImpl(this._self, this._then);

  final SubscriptionStripePrice _self;
  final $Res Function(SubscriptionStripePrice) _then;

  /// Create a copy of SubscriptionStripePrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? currency = null,
    Object? formattedPrice = null,
    Object? unitLabel = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPrice: null == formattedPrice
          ? _self.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      unitLabel: null == unitLabel
          ? _self.unitLabel
          : unitLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubscriptionStripePrice].
extension SubscriptionStripePricePatterns on SubscriptionStripePrice {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SubscriptionStripePrice value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripePrice() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SubscriptionStripePrice value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripePrice():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SubscriptionStripePrice value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripePrice() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, int price, String currency,
            String formattedPrice, String unitLabel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripePrice() when $default != null:
        return $default(_that.id, _that.price, _that.currency,
            _that.formattedPrice, _that.unitLabel);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, int price, String currency,
            String formattedPrice, String unitLabel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripePrice():
        return $default(_that.id, _that.price, _that.currency,
            _that.formattedPrice, _that.unitLabel);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, int price, String currency,
            String formattedPrice, String unitLabel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubscriptionStripePrice() when $default != null:
        return $default(_that.id, _that.price, _that.currency,
            _that.formattedPrice, _that.unitLabel);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionStripePrice implements SubscriptionStripePrice {
  _SubscriptionStripePrice(
      {required this.id,
      required this.price,
      required this.currency,
      required this.formattedPrice,
      required this.unitLabel});
  factory _SubscriptionStripePrice.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStripePriceFromJson(json);

  @override
  final String id;
  @override
  final int price;
  @override
  final String currency;
  @override
  final String formattedPrice;
  @override
  final String unitLabel;

  /// Create a copy of SubscriptionStripePrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionStripePriceCopyWith<_SubscriptionStripePrice> get copyWith =>
      __$SubscriptionStripePriceCopyWithImpl<_SubscriptionStripePrice>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionStripePriceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionStripePrice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.unitLabel, unitLabel) ||
                other.unitLabel == unitLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, price, currency, formattedPrice, unitLabel);

  @override
  String toString() {
    return 'SubscriptionStripePrice(id: $id, price: $price, currency: $currency, formattedPrice: $formattedPrice, unitLabel: $unitLabel)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionStripePriceCopyWith<$Res>
    implements $SubscriptionStripePriceCopyWith<$Res> {
  factory _$SubscriptionStripePriceCopyWith(_SubscriptionStripePrice value,
          $Res Function(_SubscriptionStripePrice) _then) =
      __$SubscriptionStripePriceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int price,
      String currency,
      String formattedPrice,
      String unitLabel});
}

/// @nodoc
class __$SubscriptionStripePriceCopyWithImpl<$Res>
    implements _$SubscriptionStripePriceCopyWith<$Res> {
  __$SubscriptionStripePriceCopyWithImpl(this._self, this._then);

  final _SubscriptionStripePrice _self;
  final $Res Function(_SubscriptionStripePrice) _then;

  /// Create a copy of SubscriptionStripePrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? currency = null,
    Object? formattedPrice = null,
    Object? unitLabel = null,
  }) {
    return _then(_SubscriptionStripePrice(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPrice: null == formattedPrice
          ? _self.formattedPrice
          : formattedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      unitLabel: null == unitLabel
          ? _self.unitLabel
          : unitLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
