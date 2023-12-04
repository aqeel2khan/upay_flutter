import 'PayButtons.dart';

class Data {
  Data({
      this.payButtons,});

  Data.fromJson(dynamic json) {
    payButtons = json['payButtons'] != null ? PayButtons.fromJson(json['payButtons']) : null;
  }
  PayButtons? payButtons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (payButtons != null) {
      map['payButtons'] = payButtons?.toJson();
    }
    return map;
  }

}