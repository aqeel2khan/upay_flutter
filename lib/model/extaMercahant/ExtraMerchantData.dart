class ExtraMerchantData {
  ExtraMerchantData({
      this.amount, 
      this.knetCharge, 
      this.knetChargeType, 
      this.ccCharge, 
      this.ccChargeType, 
      this.ibanNumber,});

  ExtraMerchantData.fromJson(dynamic json) {
    amount = json['amount'];
    knetCharge = json['knetCharge'];
    knetChargeType = json['knetChargeType'];
    ccCharge = json['ccCharge'];
    ccChargeType = json['ccChargeType'];
    ibanNumber = json['ibanNumber'];
  }
  int? amount;
  int? knetCharge;
  String? knetChargeType;
  int? ccCharge;
  String? ccChargeType;
  String? ibanNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['knetCharge'] = knetCharge;
    map['knetChargeType'] = knetChargeType;
    map['ccCharge'] = ccCharge;
    map['ccChargeType'] = ccChargeType;
    map['ibanNumber'] = ibanNumber;
    return map;
  }

}