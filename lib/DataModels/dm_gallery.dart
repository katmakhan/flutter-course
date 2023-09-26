// ignore_for_file: camel_case_types

class Dm_Gallery {
  String? title;
  String? imgurl;
  String? date;
  String? time;
  int? timeinmill;
  String? link;
  String? key;

  Dm_Gallery(
      {this.title,
      this.imgurl,
      this.date,
      this.time,
      this.timeinmill,
      this.link});

  Dm_Gallery.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    imgurl = json['imgurl'];
    date = json['date'];
    time = json['time'];
    timeinmill = json['timeinmill'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['imgurl'] = imgurl;
    data['date'] = date;
    data['time'] = time;
    data['timeinmill'] = timeinmill;
    data['link'] = link;
    return data;
  }
}
