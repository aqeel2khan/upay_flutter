import '../singleRefund/CommonModel.dart';
import 'Data.dart';

class MultiVandorRefundResponse {
  MultiVandorRefundResponse({
      this.status, 
      this.message, 
      this.data,});

  MultiVandorRefundResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}