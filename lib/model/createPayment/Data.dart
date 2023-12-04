class Data {
  Data({
      this.link,});

  Data.fromJson(dynamic json) {
    link = json['link'];
  }
  String? link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['link'] = link;
    return map;
  }

}