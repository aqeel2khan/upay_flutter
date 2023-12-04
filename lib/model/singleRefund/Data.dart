import 'RefundPayload.dart';

class Data {
  Data({
      this.orderId, 
      this.isMultivendorRefund, 
      this.refundPayload, 
      this.receiptId, 
      this.customerFirstName, 
      this.customerEmail, 
      this.customerMobileNumber, 
      this.reference, 
      this.notifyUrl,
    this.refundOrderId,
    this.refundArn,

  });

  Data.fromJson(dynamic json) {
    orderId = json['orderId'];
    isMultivendorRefund = json['isMultivendorRefund'];
    if (json['refundPayload'] != null) {
      refundPayload = [];
      json['refundPayload'].forEach((v) {
        refundPayload?.add(RefundPayload.fromJson(v));
      });
    }
    receiptId = json['receiptId'];
    customerFirstName = json['customerFirstName'];
    customerEmail = json['customerEmail'];
    customerMobileNumber = json['customerMobileNumber'];
    reference = json['reference'];
    notifyUrl = json['notifyUrl'];
    refundOrderId = json['refundOrderId'];
    refundArn = json['refundArn'];

  }
  String? orderId;
  bool? isMultivendorRefund;
  List<RefundPayload>? refundPayload;
  String? receiptId;
  String? customerFirstName;
  String? customerEmail;
  String? customerMobileNumber;
  String? reference;
  String? notifyUrl;
  String? refundOrderId;
  String? refundArn;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['isMultivendorRefund'] = isMultivendorRefund;
    if (refundPayload != null) {
      map['refundPayload'] = refundPayload?.map((v) => v.toJson()).toList();
    }
    map['receiptId'] = receiptId;
    map['customerFirstName'] = customerFirstName;
    map['customerEmail'] = customerEmail;
    map['customerMobileNumber'] = customerMobileNumber;
    map['reference'] = reference;
    map['notifyUrl'] = notifyUrl;
    map['refundOrderId'] = refundOrderId;
    map['refundArn'] = refundArn;

    return map;
  }

}