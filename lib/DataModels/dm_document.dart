// ignore_for_file: camel_case_types

class Dm_Document {
  String? iurl;
  String? name;
  String? pdfurl;
  bool? selected;

  Dm_Document({this.iurl, this.name, this.pdfurl, this.selected});

  Dm_Document.fromJson(Map<dynamic, dynamic> json) {
    iurl = json['iurl'];
    name = json['name'];
    pdfurl = json['pdfurl'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iurl'] = iurl;
    data['name'] = name;
    data['pdfurl'] = pdfurl;
    data['selected'] = selected;
    return data;
  }
}
