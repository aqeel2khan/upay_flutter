class Order {
  Order({
      this.id, 
      this.reference, 
      this.description, 
      this.currency, 
      this.amount,});

  Order.fromJson(dynamic json) {
    id = json['id'];
    reference = json['reference'];
    description = json['description'];
    currency = json['currency'];
    amount = json['amount'];
  }
  String? id;
  String? reference;
  String? description;
  String? currency;
  int? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['reference'] = reference;
    map['description'] = description;
    map['currency'] = currency;
    map['amount'] = amount;
    return map;
  }

}