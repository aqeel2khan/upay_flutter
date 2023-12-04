class PayButtons {
  PayButtons({
      this.knet, 
      this.creditCard, 
      this.samsungPay, 
      this.applePay,
      this.amex,
      this.google_pay,});

  PayButtons.fromJson(dynamic json) {
    knet = json['knet'];
    creditCard = json['credit_card'];
    samsungPay = json['samsung_pay'];
    applePay = json['apple_pay'];
    amex = json['amex'];
    google_pay = json['google_pay'];
  }
  bool? knet;
  bool? creditCard;
  bool? samsungPay;
  bool? applePay;
  bool? amex;
  bool? google_pay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['knet'] = knet;
    map['credit_card'] = creditCard;
    map['samsung_pay'] = samsungPay;
    map['apple_pay'] = applePay;
    map['amex'] = amex;
    map['google_pay'] = google_pay;
    return map;
  }

}