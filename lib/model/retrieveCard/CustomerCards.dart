class CustomerCards {
  CustomerCards({
      this.brand, 
      this.number, 
      this.scheme, 
      this.token,});

  CustomerCards.fromJson(dynamic json) {
    brand = json['brand'];
    number = json['number'];
    scheme = json['scheme'];
    token = json['token'];
  }
  String? brand;
  String? number;
  String? scheme;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand'] = brand;
    map['number'] = number;
    map['scheme'] = scheme;
    map['token'] = token;
    return map;
  }

}