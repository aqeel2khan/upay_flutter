import 'CustomerCards.dart';

class Data {
  Data({
      this.customerCards,});

  Data.fromJson(dynamic json) {
    if (json['customerCards'] != null) {
      customerCards = [];
      json['customerCards'].forEach((v) {
        customerCards?.add(CustomerCards.fromJson(v));
      });
    }
  }
  List<CustomerCards>? customerCards;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customerCards != null) {
      map['customerCards'] = customerCards?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}