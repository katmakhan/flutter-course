class dm_item {
  String? itemName;
  double? itemPrice;
  String? itemDescrp;
  int? itemQty;
  double? itemVat;
  int? itemTotal;

  dm_item(
      {this.itemName,
      this.itemPrice,
      this.itemDescrp,
      this.itemQty,
      this.itemVat,
      this.itemTotal});

  dm_item.fromJson(Map<dynamic, dynamic> json) {
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    itemDescrp = json['item_descrp'];
    itemQty = json['item_qty'];
    itemVat = json['item_vat'];
    itemTotal = json['item_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_name'] = this.itemName;
    data['item_price'] = this.itemPrice;
    data['item_descrp'] = this.itemDescrp;
    data['item_qty'] = this.itemQty;
    data['item_vat'] = this.itemVat;
    data['item_total'] = this.itemTotal;
    return data;
  }
}
