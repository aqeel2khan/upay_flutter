// /*
// import 'RefundPayload.dart';
//
// class Data {
//   Data({
//       this.orderId,
//       this.isMultivendorRefund,
//       this.refundPayload,
//       this.multivendorRefundEndPoint,});
//
//   Data.fromJson(dynamic json) {
//     orderId = json['orderId'];
//     isMultivendorRefund = json['isMultivendorRefund'];
//     if (json['refundPayload'] != null) {
//       refundPayload = [];
//       json['refundPayload'].forEach((v) {
//         refundPayload?.add(RefundPayload.fromJson(v));
//       });
//     }
//     multivendorRefundEndPoint = json['multivendor_refund_end_point'];
//   }
//   String? orderId;
//   bool? isMultivendorRefund;
//   List<RefundPayload>? refundPayload;
//   String? multivendorRefundEndPoint;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['orderId'] = orderId;
//     map['isMultivendorRefund'] = isMultivendorRefund;
//     if (refundPayload != null) {
//       map['refundPayload'] = refundPayload?.map((v) => v.toJson()).toList();
//     }
//     map['multivendor_refund_end_point'] = multivendorRefundEndPoint;
//     return map;
//   }
//
// }*/
