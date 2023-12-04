import 'Expiry.dart';

class CardAdd {
  CardAdd({
      this.number, 
      this.expiry, 
      this.securityCode, 
      this.nameOnCard,});

  CardAdd.fromJson(dynamic json) {
    number = json['number'];
    expiry = json['expiry'] != null ? Expiry.fromJson(json['expiry']) : null;
    securityCode = json['securityCode'];
    nameOnCard = json['nameOnCard'];
  }
  String? number;
  Expiry? expiry;
  String? securityCode;
  String? nameOnCard;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    if (expiry != null) {
      map['expiry'] = expiry?.toJson();
    }
    map['securityCode'] = securityCode;
    map['nameOnCard'] = nameOnCard;
    return map;
  }

}