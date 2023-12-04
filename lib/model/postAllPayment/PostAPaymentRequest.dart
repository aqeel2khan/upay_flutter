import 'Products.dart';
import 'Order.dart';
import 'PaymentGateway.dart';
import 'Tokens.dart';
import 'Reference.dart';
import 'Customer.dart';
import 'ExtraMerchantData.dart';

class PostAPaymentRequest {
  PostAPaymentRequest({
      this.products, 
      this.order, 
      this.paymentGateway, 
      this.language, 
      this.tokens, 
      this.reference, 
      this.customer, 
      this.returnUrl, 
      this.cancelUrl, 
      this.notificationUrl, 
      this.extraMerchantData,});

  PostAPaymentRequest.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    paymentGateway = json['paymentGateway'] != null ? PaymentGateway.fromJson(json['paymentGateway']) : null;
    language = json['language'];
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
    reference = json['reference'] != null ? Reference.fromJson(json['reference']) : null;
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    returnUrl = json['returnUrl'];
    cancelUrl = json['cancelUrl'];
    notificationUrl = json['notificationUrl'];
    if (json['extraMerchantData'] != null) {
      extraMerchantData = [];
      json['extraMerchantData'].forEach((v) {
        extraMerchantData?.add(ExtraMerchantData.fromJson(v));
      });
    }
  }
  List<Products>? products;
  Order? order;
  PaymentGateway? paymentGateway;
  String? language;
  Tokens? tokens;
  Reference? reference;
  Customer? customer;
  String? returnUrl;
  String? cancelUrl;
  String? notificationUrl;
  List<ExtraMerchantData>? extraMerchantData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    if (order != null) {
      map['order'] = order?.toJson();
    }
    if (paymentGateway != null) {
      map['paymentGateway'] = paymentGateway?.toJson();
    }
    map['language'] = language;
    if (tokens != null) {
      map['tokens'] = tokens?.toJson();
    }
    if (reference != null) {
      map['reference'] = reference?.toJson();
    }
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    map['returnUrl'] = returnUrl;
    map['cancelUrl'] = cancelUrl;
    map['notificationUrl'] = notificationUrl;
    if (extraMerchantData != null) {
      map['extraMerchantData'] = extraMerchantData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}