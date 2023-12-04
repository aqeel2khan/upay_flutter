import 'ExtraMerchantData.dart';

 class ExtraMerchant {
  ExtraMerchant({
      this.extraMerchantData,});

  ExtraMerchant.fromJson(dynamic json) {
    if (json['extraMerchantData'] != null) {
      extraMerchantData = [];
      json['extraMerchantData'].forEach((v) {
        extraMerchantData?.add(ExtraMerchantData.fromJson(v));
      });
    }
  }
  List<ExtraMerchantData>? extraMerchantData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (extraMerchantData != null) {
      map['extraMerchantData'] = extraMerchantData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}