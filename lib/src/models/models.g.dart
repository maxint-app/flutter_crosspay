// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionStoreProductImpl _$$SubscriptionStoreProductImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionStoreProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      formattedPrice: json['formattedPrice'] as String,
      currencyCode: json['currencyCode'] as String,
      store: $enumDecode(_$SubscriptionStoreEnumMap, json['store']),
      subscriptionRecurrenceDays:
          (json['subscriptionRecurrenceDays'] as num).toInt(),
      accessLevel: json['accessLevel'] as String,
    );

Map<String, dynamic> _$$SubscriptionStoreProductImplToJson(
        _$SubscriptionStoreProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'formattedPrice': instance.formattedPrice,
      'currencyCode': instance.currencyCode,
      'store': _$SubscriptionStoreEnumMap[instance.store]!,
      'subscriptionRecurrenceDays': instance.subscriptionRecurrenceDays,
      'accessLevel': instance.accessLevel,
    };

const _$SubscriptionStoreEnumMap = {
  SubscriptionStore.appStore: 'appStore',
  SubscriptionStore.playStore: 'playStore',
  SubscriptionStore.stripe: 'stripe',
};

_$CrosspayEntitlementImpl _$$CrosspayEntitlementImplFromJson(
        Map<String, dynamic> json) =>
    _$CrosspayEntitlementImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      products:
          CrosspayProducts.fromJson(json['products'] as Map<String, dynamic>),
      tier: (json['tier'] as num).toInt(),
    );

Map<String, dynamic> _$$CrosspayEntitlementImplToJson(
        _$CrosspayEntitlementImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'products': instance.products,
      'tier': instance.tier,
    };

_$CrosspayProductsImpl _$$CrosspayProductsImplFromJson(
        Map<String, dynamic> json) =>
    _$CrosspayProductsImpl(
      playStore: (json['playStore'] as List<dynamic>)
          .map((e) => CrosspayProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      appStore: (json['appStore'] as List<dynamic>)
          .map((e) => CrosspayProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      stripe: (json['stripe'] as List<dynamic>)
          .map((e) => CrosspayProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CrosspayProductsImplToJson(
        _$CrosspayProductsImpl instance) =>
    <String, dynamic>{
      'playStore': instance.playStore,
      'appStore': instance.appStore,
      'stripe': instance.stripe,
    };

_$CrosspayProductImpl _$$CrosspayProductImplFromJson(
        Map<String, dynamic> json) =>
    _$CrosspayProductImpl(
      id: json['id'] as String,
      recurringPeriod: _durationFromDays(json['recurringPeriodDays']),
    );

Map<String, dynamic> _$$CrosspayProductImplToJson(
        _$CrosspayProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recurringPeriodDays': _durationToDays(instance.recurringPeriod),
    };

_$SubscriptionStripeProductImpl _$$SubscriptionStripeProductImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionStripeProductImpl(
      id: json['id'] as String,
      objectType: json['object'] as String,
      active: json['active'] as bool,
      created: (json['created'] as num).toInt(),
      price: SubscriptionStripePrice.fromJson(
          json['price'] as Map<String, dynamic>),
      deleted: json['deleted'] as bool?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      livemode: json['livemode'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>,
      name: json['name'] as String,
      shippable: json['shippable'] as bool?,
      statementDescriptor: json['statement_descriptor'] as String?,
      type: json['type'] as String,
      unitLabel: json['unit_label'] as String?,
      updated: (json['updated'] as num).toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$SubscriptionStripeProductImplToJson(
        _$SubscriptionStripeProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.objectType,
      'active': instance.active,
      'created': instance.created,
      'price': instance.price,
      'deleted': instance.deleted,
      'description': instance.description,
      'images': instance.images,
      'livemode': instance.livemode,
      'metadata': instance.metadata,
      'name': instance.name,
      'shippable': instance.shippable,
      'statement_descriptor': instance.statementDescriptor,
      'type': instance.type,
      'unit_label': instance.unitLabel,
      'updated': instance.updated,
      'url': instance.url,
    };

_$SubscriptionStripePriceImpl _$$SubscriptionStripePriceImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionStripePriceImpl(
      id: json['id'] as String,
      price: (json['price'] as num).toInt(),
      currency: json['currency'] as String,
      formattedPrice: json['formattedPrice'] as String,
      unitLabel: json['unitLabel'] as String,
    );

Map<String, dynamic> _$$SubscriptionStripePriceImplToJson(
        _$SubscriptionStripePriceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'currency': instance.currency,
      'formattedPrice': instance.formattedPrice,
      'unitLabel': instance.unitLabel,
    };

_$StorableSubscriptionImpl _$$StorableSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$StorableSubscriptionImpl(
      id: json['id'] as String,
      transactionId: json['transactionId'] as String,
      productId: json['productId'] as String,
      source: $enumDecode(_$SubscriptionStoreEnumMap, json['source']),
      appUserId: json['appUserId'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      renewalStatus: $enumDecode(
          _$SubscriptionRenewalStatusEnumMap, json['renewalStatus']),
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$StorableSubscriptionImplToJson(
        _$StorableSubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionId': instance.transactionId,
      'productId': instance.productId,
      'source': _$SubscriptionStoreEnumMap[instance.source]!,
      'appUserId': instance.appUserId,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'renewalStatus':
          _$SubscriptionRenewalStatusEnumMap[instance.renewalStatus]!,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
    };

const _$SubscriptionRenewalStatusEnumMap = {
  SubscriptionRenewalStatus.autoRenew: 'auto-renew',
  SubscriptionRenewalStatus.canceled: 'canceled',
};

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.expired: 'expired',
  SubscriptionStatus.pending: 'pending',
};
