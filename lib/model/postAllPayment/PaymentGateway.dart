class PaymentGateway {
  PaymentGateway({
      this.src,});

  PaymentGateway.fromJson(dynamic json) {
    src = json['src'];
  }
  String? src;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['src'] = src;
    return map;
  }

}