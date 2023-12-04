class Data {
  Data({
      this.orderId, 
      this.refundOrderId,});

  Data.fromJson(dynamic json) {
    orderId = json['order_id'];
    refundOrderId = json['refund_order_id'];
  }
  String? orderId;
  String? refundOrderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['refund_order_id'] = refundOrderId;
    return map;
  }

}