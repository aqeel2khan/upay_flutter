import 'ResponseData.dart';

class Data {
  Data({
      this.responseData,});

  Data.fromJson(dynamic json) {
    responseData = json['responseData'] != null ? ResponseData.fromJson(json['responseData']) : null;
  }
  ResponseData? responseData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (responseData != null) {
      map['responseData'] = responseData?.toJson();
    }
    return map;
  }

}