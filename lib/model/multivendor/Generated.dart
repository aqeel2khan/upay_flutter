class Generated {
  Generated({
      this.generatedInvoiceId, 
      this.amount, 
      this.orderId, 
      this.refundOrderId, 
      this.refundArn,});

  Generated.fromJson(dynamic json) {
    generatedInvoiceId = json['generatedInvoiceId'];
    amount = json['amount'];
    orderId = json['orderId'];
    refundOrderId = json['refundOrderId'];
    refundArn = json['refundArn'];
  }
  String? generatedInvoiceId;
  int? amount;
  String? orderId;
  String? refundOrderId;
  String? refundArn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['generatedInvoiceId'] = generatedInvoiceId;
    map['amount'] = amount;
    map['orderId'] = orderId;
    map['refundOrderId'] = refundOrderId;
    map['refundArn'] = refundArn;
    return map;
  }

}