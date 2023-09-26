class DmDocument {
  String? iurl;
  String? name;
  String? pdfurl;
  bool? selected;

  DmDocument({this.iurl, this.name, this.pdfurl, this.selected});

  DmDocument.fromJson(Map<dynamic, dynamic> json) {
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
