class Tokens {
  Tokens({
      this.customerUniqueToken,});

  Tokens.fromJson(dynamic json) {
    customerUniqueToken = json['customerUniqueToken'];
  }
  int? customerUniqueToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerUniqueToken'] = customerUniqueToken;
    return map;
  }

}