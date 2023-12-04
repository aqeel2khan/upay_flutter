class RefundPayloadOption {
  RefundPayloadOption({
      this.ibanNumber, 
      this.amountToRefund,});

  RefundPayloadOption.fromJson(dynamic json) {
    ibanNumber = json['ibanNumber'];
    amountToRefund = json['amountToRefund'];
  }
  String? ibanNumber;
  int? amountToRefund;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ibanNumber'] = ibanNumber;
    map['amountToRefund'] = amountToRefund;
    return map;
  }

}