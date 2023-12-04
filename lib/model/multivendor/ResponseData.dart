import 'Generated.dart';

class ResponseData {
  ResponseData({
      this.generated, 
      this.dataTempered, 
      this.refundIssue, 
      this.insufficientBalance,
      this.orderId,
    this.refundOrderId,
    this.refundArn
  });

  ResponseData.fromJson(dynamic json) {
    orderId = json['orderId'];
    refundOrderId = json['refundOrderId'];
    refundArn = json['refundArn'];

    if (json['generated'] != null) {
      generated = [];
      json['generated'].forEach((v) {
        generated?.add(Generated.fromJson(v));
      });
    }
    if (json['dataTempered'] != null) {
      dataTempered = [];
      json['dataTempered'].forEach((v) {
       // dataTempered?.add(Dynamic.fromJson(v));
      });
    }
    if (json['refundIssue'] != null) {
      refundIssue = [];
      json['refundIssue'].forEach((v) {
       // refundIssue?.add(Dynamic.fromJson(v));
      });
    }
    if (json['insufficientBalance'] != null) {
      insufficientBalance = [];
      json['insufficientBalance'].forEach((v) {
       // insufficientBalance!.add(Dynamic.fromJson(v));
      });
    }
  }
  List<Generated>? generated;
  List<dynamic>? dataTempered;
  List<dynamic>? refundIssue;
  List<dynamic>? insufficientBalance;
  String? orderId;
  String? refundOrderId;
  String? refundArn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['refundOrderId'] = refundOrderId;
    map['refundArn'] = refundArn;
    if (generated != null) {
      map['generated'] = generated?.map((v) => v.toJson()).toList();
    }
    if (dataTempered != null) {
      map['dataTempered'] = dataTempered?.map((v) => v.toJson()).toList();
    }
    if (refundIssue != null) {
      map['refundIssue'] = refundIssue?.map((v) => v.toJson()).toList();
    }
    if (insufficientBalance != null) {
      map['insufficientBalance'] = insufficientBalance?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}