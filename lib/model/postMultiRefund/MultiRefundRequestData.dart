import 'RefundPayloadRequest.dart';

class MultiRefundRequestData {
  MultiRefundRequestData({
      this.orderId, 
      this.refundPayload, 
      this.receiptId, 
      this.customerFirstName, 
      this.customerEmail, 
      this.customerMobileNumber, 
      this.reference, 
      this.notifyUrl,});

  MultiRefundRequestData.fromJson(dynamic json) {
    orderId = json['orderId'];
    if (json['refundPayload'] != null) {
      refundPayload = [];
      json['refundPayload'].forEach((v) {
        refundPayload?.add(RefundPayloadRequest.fromJson(v));
      });
    }
    receiptId = json['receiptId'];
    customerFirstName = json['customerFirstName'];
    customerEmail = json['customerEmail'];
    customerMobileNumber = json['customerMobileNumber'];
    reference = json['reference'];
    notifyUrl = json['notifyUrl'];
  }
  String? orderId;
  List<RefundPayloadRequest>? refundPayload;
  String? receiptId;
  String? customerFirstName;
  String? customerEmail;
  String? customerMobileNumber;
  String? reference;
  String? notifyUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    if (refundPayload != null) {
      map['refundPayload'] = refundPayload?.map((v) => v.toJson()).toList();
    }
    map['receiptId'] = receiptId;
    map['customerFirstName'] = customerFirstName;
    map['customerEmail'] = customerEmail;
    map['customerMobileNumber'] = customerMobileNumber;
    map['reference'] = reference;
    map['notifyUrl'] = notifyUrl;
    return map;
  }

}