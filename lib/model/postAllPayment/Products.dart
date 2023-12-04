class Products {
  Products({
      this.name, 
      this.description, 
      this.price, 
      this.quantity,});

  Products.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
  }
  String? name;
  String? description;
  int? price;
  int? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['quantity'] = quantity;
    return map;
  }

}