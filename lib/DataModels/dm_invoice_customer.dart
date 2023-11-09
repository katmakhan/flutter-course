class dm_customer {
  String? cusName;
  String? cusAddress;
  String? cusMail;
  String? cusMob;

  dm_customer({this.cusName, this.cusAddress, this.cusMail, this.cusMob});

  dm_customer.fromJson(Map<dynamic, dynamic> json) {
    cusName = json['cus_name'];
    cusAddress = json['cus_address'];
    cusMail = json['cus_mail'];
    cusMob = json['cus_mob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cus_name'] = this.cusName;
    data['cus_address'] = this.cusAddress;
    data['cus_mail'] = this.cusMail;
    data['cus_mob'] = this.cusMob;
    return data;
  }
}
