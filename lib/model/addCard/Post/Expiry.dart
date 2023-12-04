class Expiry {
  Expiry({
      this.month, 
      this.year,});

  Expiry.fromJson(dynamic json) {
    month = json['month'];
    year = json['year'];
  }
  String? month;
  String? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['year'] = year;
    return map;
  }

}