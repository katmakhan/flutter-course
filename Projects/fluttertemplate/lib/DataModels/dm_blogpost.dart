// ignore_for_file: camel_case_types, unnecessary_this

class Dm_Blogpost {
  String? iurl;
  String? name;
  String? link;
  int? timeinmill;
  String? date;
  String? time;
  String? key;

  Dm_Blogpost(
      {this.iurl, this.name, this.link, this.timeinmill, this.date, this.time});

  Dm_Blogpost.fromJson(Map<dynamic, dynamic> json) {
    iurl = json['iurl'];
    name = json['name'];
    link = json['link'];
    timeinmill = json['timeinmill'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iurl'] = this.iurl;
    data['name'] = this.name;
    data['link'] = this.link;
    data['timeinmill'] = this.timeinmill;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
