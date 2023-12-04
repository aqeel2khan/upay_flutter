class ResponsePaymentData {
  ResponsePaymentData({
      this.payMentId, 
      this.result, 
      this.postDate, 
      this.tranID, 
      this.ref, 
      this.trackID, 
      this.orderID, 
      this.custRef,
      this.receiptID,
  });

  ResponsePaymentData.fromJson(dynamic json) {
    payMentId = json['payMentId'];
    result = json['Result'];
    postDate = json['PostDate'];
    tranID = json['TranID'];
    ref = json['Ref'];
    trackID = json['TrackID'];
    orderID = json['OrderID'];
    custRef = json['refund_order_id'];
    receiptID = json['receipt_id'];
  }
  String? payMentId;
  String? result;
  String? postDate;
  String? tranID;
  String? ref;
  String? trackID;
  String? orderID;
  //RefundOrder ID
  String? custRef;
  String? receiptID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payMentId'] = payMentId;
    map['Result'] = result;
    map['PostDate'] = postDate;
    map['TranID'] = tranID;
    map['Ref'] = ref;
    map['TrackID'] = trackID;
    map['OrderID'] = orderID;
    map['refund_order_id'] = custRef;
    map['receipt_id'] = receiptID;

    return map;
  }

}