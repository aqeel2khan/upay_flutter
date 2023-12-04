class RefundPayloadRequest {
  RefundPayloadRequest({
      this.refundRequestId, 
      this.ibanNumber, 
      this.totalPaid, 
      this.refundedAmount, 
      this.remainingLimit, 
      this.amountToRefund, 
      this.merchantType,});

  RefundPayloadRequest.fromJson(dynamic json) {
    refundRequestId = json['refundRequestId'];
    ibanNumber = json['ibanNumber'];
    totalPaid = json['totalPaid'];
    refundedAmount = json['refundedAmount'];
    remainingLimit = json['remainingLimit'];
    amountToRefund = json['amountToRefund'];
    merchantType = json['merchantType'];
  }
  String? refundRequestId;
  String? ibanNumber;
  String? totalPaid;
  int? refundedAmount;
  int? remainingLimit;
  int? amountToRefund;
  String? merchantType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refundRequestId'] = refundRequestId;
    map['ibanNumber'] = ibanNumber;
    map['totalPaid'] = totalPaid;
    map['refundedAmount'] = refundedAmount;
    map['remainingLimit'] = remainingLimit;
    map['amountToRefund'] = amountToRefund;
    map['merchantType'] = merchantType;
    return map;
  }

}