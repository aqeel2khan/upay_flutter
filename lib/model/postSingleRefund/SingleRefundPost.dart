class SingleRefundPost {
  SingleRefundPost({
      this.orderId, 
      this.totalPrice, 
      this.customerFirstName, 
      this.customerEmail, 
      this.customerMobileNumber, 
      this.reference, 
      this.notifyUrl,});

  SingleRefundPost.fromJson(dynamic json) {
    orderId = json['orderId'];
    totalPrice = json['totalPrice'];
    customerFirstName = json['customerFirstName'];
    customerEmail = json['customerEmail'];
    customerMobileNumber = json['customerMobileNumber'];
    reference = json['reference'];
    notifyUrl = json['notifyUrl'];
  }
  String? orderId;
  int? totalPrice;
  String? customerFirstName;
  String? customerEmail;
  String? customerMobileNumber;
  String? reference;
  String? notifyUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orderId'] = orderId;
    map['totalPrice'] = totalPrice;
    map['customerFirstName'] = customerFirstName;
    map['customerEmail'] = customerEmail;
    map['customerMobileNumber'] = customerMobileNumber;
    map['reference'] = reference;
    map['notifyUrl'] = notifyUrl;
    return map;
  }

}