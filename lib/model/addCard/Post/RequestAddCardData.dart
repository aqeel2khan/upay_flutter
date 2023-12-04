import 'CardAdd.dart';

class RequestAddCardData {
  RequestAddCardData({
      this.cardadd,
      this.customerUniqueToken,});

  RequestAddCardData.fromJson(dynamic json) {
    cardadd = json['card'] != null ? CardAdd.fromJson(json['card']) : null;
    customerUniqueToken = json['customerUniqueToken'];
  }
  CardAdd? cardadd;
  int? customerUniqueToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cardadd != null) {
      map['card'] = cardadd?.toJson();
    }
    map['customerUniqueToken'] = customerUniqueToken;
    return map;
  }

}