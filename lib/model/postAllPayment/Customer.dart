class Customer {
  Customer({
      this.uniqueId, 
      this.name, 
      this.email, 
      this.mobile,});

  Customer.fromJson(dynamic json) {
    uniqueId = json['uniqueId'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }
  String? uniqueId;
  String? name;
  String? email;
  String? mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uniqueId'] = uniqueId;
    map['name'] = name;
    map['email'] = email;
    map['mobile'] = mobile;
    return map;
  }

}