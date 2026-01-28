// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionStoreProduct _$SubscriptionStoreProductFromJson(
        Map<String, dynamic> json) =>
    _SubscriptionStoreProduct(
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

Map<String, dynamic> _$SubscriptionStoreProductToJson(
        _SubscriptionStoreProduct instance) =>
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
  SubscriptionStore.appStore: 'appstore',
  SubscriptionStore.playStore: 'playstore',
  SubscriptionStore.stripe: 'stripe',
  SubscriptionStore.gocardless: 'gocardless',
};

_CrosspayEntitlement _$CrosspayEntitlementFromJson(Map<String, dynamic> json) =>
    _CrosspayEntitlement(
      id: json['id'] as String,
      name: json['name'] as String,
      period: _durationFromMillis(json['period_ms']),
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      products:
          CrosspayProducts.fromJson(json['products'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CrosspayEntitlementToJson(
        _CrosspayEntitlement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'period_ms': _durationToMillis(instance.period),
      'description': instance.description,
      'metadata': instance.metadata,
      'products': instance.products,
    };

_CrosspayProducts _$CrosspayProductsFromJson(Map<String, dynamic> json) =>
    _CrosspayProducts(
      playStore: json['playstore'] == null
          ? null
          : CrosspayProduct.fromJson(json['playstore'] as Map<String, dynamic>),
      appStore: json['appstore'] == null
          ? null
          : CrosspayProduct.fromJson(json['appstore'] as Map<String, dynamic>),
      stripe: json['stripe'] == null
          ? null
          : CrosspayProduct.fromJson(json['stripe'] as Map<String, dynamic>),
      gocardless: json['gocardless'] == null
          ? null
          : CrosspayProduct.fromJson(
              json['gocardless'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CrosspayProductsToJson(_CrosspayProducts instance) =>
    <String, dynamic>{
      'playstore': instance.playStore,
      'appstore': instance.appStore,
      'stripe': instance.stripe,
      'gocardless': instance.gocardless,
    };

_CrosspayProduct _$CrosspayProductFromJson(Map<String, dynamic> json) =>
    _CrosspayProduct(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CrosspayProductToJson(_CrosspayProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'name': instance.name,
      'description': instance.description,
      'metadata': instance.metadata,
    };

_SubscriptionGocardlessProduct _$SubscriptionGocardlessProductFromJson(
        Map<String, dynamic> json) =>
    _SubscriptionGocardlessProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      formattedPrice: json['formatted_price'] as String,
      price: (json['price'] as num).toInt(),
      currency: json['currency'] as String,
      checkoutUrl: json['checkout_url'] as String,
    );

Map<String, dynamic> _$SubscriptionGocardlessProductToJson(
        _SubscriptionGocardlessProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'formatted_price': instance.formattedPrice,
      'price': instance.price,
      'currency': instance.currency,
      'checkout_url': instance.checkoutUrl,
    };

_SubscriptionStripeProduct _$SubscriptionStripeProductFromJson(
        Map<String, dynamic> json) =>
    _SubscriptionStripeProduct(
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

Map<String, dynamic> _$SubscriptionStripeProductToJson(
        _SubscriptionStripeProduct instance) =>
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

_SubscriptionStripePrice _$SubscriptionStripePriceFromJson(
        Map<String, dynamic> json) =>
    _SubscriptionStripePrice(
      id: json['id'] as String,
      price: (json['price'] as num).toInt(),
      currency: json['currency'] as String,
      formattedPrice: json['formattedPrice'] as String,
      unitLabel: json['unitLabel'] as String,
    );

Map<String, dynamic> _$SubscriptionStripePriceToJson(
        _SubscriptionStripePrice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'currency': instance.currency,
      'formattedPrice': instance.formattedPrice,
      'unitLabel': instance.unitLabel,
    };

_StorableSubscription _$StorableSubscriptionFromJson(
        Map<String, dynamic> json) =>
    _StorableSubscription(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      expiresAt: _dateFromEpochSeconds((json['expires_at'] as num).toInt()),
      store: $enumDecode(_$SubscriptionStoreEnumMap, json['store']),
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
      renewalStatus: $enumDecode(
          _$SubscriptionRenewalStatusEnumMap, json['renewal_status']),
    );

Map<String, dynamic> _$StorableSubscriptionToJson(
        _StorableSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'expires_at': _dateToEpochSeconds(instance.expiresAt),
      'store': _$SubscriptionStoreEnumMap[instance.store]!,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'renewal_status':
          _$SubscriptionRenewalStatusEnumMap[instance.renewalStatus]!,
    };

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.onHold: 'on_hold',
  SubscriptionStatus.gracePeriod: 'grace_period',
  SubscriptionStatus.trialing: 'trialing',
  SubscriptionStatus.expired: 'expired',
};

const _$SubscriptionRenewalStatusEnumMap = {
  SubscriptionRenewalStatus.autoRenew: 'auto_renew',
  SubscriptionRenewalStatus.canceled: 'canceled',
};
