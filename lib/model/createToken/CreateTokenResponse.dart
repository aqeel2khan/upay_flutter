import 'Data.dart';

class CreateTokenResponse {
  CreateTokenResponse({
      this.status, 
      this.message, 
      this.data,});

  CreateTokenResponse.fromJson(dynamic json) {
    if (json != null && json.containsKey('status')) {
      status = json['status'];
    } else {
      // Handle the case where 'status' is not present or json is null
      // You might want to assign a default value or take some other action.
    }
    if (json != null && json.containsKey('message')) {
      message = json['message'];
    } else {
      // Handle the case where 'status' is not present or json is null
      // You might want to assign a default value or take some other action.
    }
    if (json != null && json.containsKey('data')) {
      data = json['data'] != null ? Data.fromJson(json['data']) : null;

    } else {
      // Handle the case where 'status' is not present or json is null
      // You might want to assign a default value or take some other action.
    }
    // status = json['status'];
    // message = json['message'];
    // data = json['data'] != null ? Data.fromJson(json['data']) : null;

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