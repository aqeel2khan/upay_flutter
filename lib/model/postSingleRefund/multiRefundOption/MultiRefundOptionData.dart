import 'RefundPayloadOption.dart';

class MultiRefundOptionData {
  MultiRefundOptionData({
      this.refundPayloadOption, 
      this.receiptId,});

  MultiRefundOptionData.fromJson(dynamic json) {
    if (json['refundPayloadOption'] != null) {
      refundPayloadOption = [];
      json['refundPayloadOption'].forEach((v) {
        refundPayloadOption?.add(RefundPayloadOption.fromJson(v));
      });
    }
    receiptId = json['receiptId'];
  }
  List<RefundPayloadOption>? refundPayloadOption;
  String? receiptId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (refundPayloadOption != null) {
      map['refundPayloadOption'] = refundPayloadOption?.map((v) => v.toJson()).toList();
    }
    map['receiptId'] = receiptId;
    return map;
  }

}