// ignore_for_file: camel_case_types

class Dm_Category {
  String? maincat;
  String? subcat;
  String? somekey;

  Dm_Category({this.maincat, this.subcat, this.somekey});

  Dm_Category.fromJson(Map<dynamic, dynamic> json) {
    maincat = json['maincat'];
    subcat = json['subcat'];
    somekey = json['somekey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maincat'] = this.maincat;
    data['subcat'] = this.subcat;
    data['somekey'] = this.somekey;
    return data;
  }
}
