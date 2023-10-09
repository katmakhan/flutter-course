// ignore_for_file: unnecessary_this, camel_case_types
class Dm_User {
  String? name;
  String? imgurl;
  String? email;
  int? timeinmill;
  String? date;
  String? time;

  Dm_User(
      {this.name,
      this.imgurl,
      this.email,
      this.timeinmill,
      this.date,
      this.time});

  Dm_User.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    email = json['email'];
    imgurl = json['imgurl'];
    timeinmill = json['timeinmill'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['imgurl'] = this.imgurl;
    data['email'] = this.email;
    data['timeinmill'] = this.timeinmill;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
