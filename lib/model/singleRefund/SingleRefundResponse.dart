import 'package:upayment_flutter_ws/model/multivendor/MultiVandorRefundResponse.dart';

import 'CommonModel.dart';
import 'Data.dart';

class SingleRefundResponse  {
  SingleRefundResponse({
      this.status, 
      this.message, 
      this.data,});

  SingleRefundResponse.fromJson(dynamic json) {
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