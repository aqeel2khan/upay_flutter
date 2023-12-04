// import 'Data.dart';
//
// class SingleRefundResponseData {
//   SingleRefundResponseData({
//       this.status,
//       this.message,
//       this.data,});
//
//   SingleRefundResponseData.fromJson(dynamic json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   bool? status;
//   String? message;
//   Data? data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     map['message'] = message;
//     if (data != null) {
//       map['data'] = data?.toJson();
//     }
//     return map;
//   }
//
// }