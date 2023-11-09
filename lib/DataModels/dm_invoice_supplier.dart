class dm_supplier {
  String? suppName;
  String? suppAddress;
  String? suppMail;
  String? suppMob;

  dm_supplier({this.suppName, this.suppAddress, this.suppMail, this.suppMob});

  dm_supplier.fromJson(Map<dynamic, dynamic> json) {
    suppName = json['supp_name'];
    suppAddress = json['supp_address'];
    suppMail = json['supp_mail'];
    suppMob = json['supp_mob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supp_name'] = this.suppName;
    data['supp_address'] = this.suppAddress;
    data['supp_mail'] = this.suppMail;
    data['supp_mob'] = this.suppMob;
    return data;
  }
}
