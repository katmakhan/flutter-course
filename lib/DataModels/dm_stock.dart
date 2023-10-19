// ignore_for_file: camel_case_types

import 'package:fluttertemplate/Helpers/conversions.dart';

class dm_stock {
  String? stckname;
  int? strike;
  String? op;
  double? ltp;
  double? pltp;
  double? close;
  double? high;
  double? low;
  double? pclose;
  double? pcnt;

  dm_stock(
      {this.stckname,
      this.strike,
      this.op,
      this.ltp,
      this.pltp,
      this.close,
      this.high,
      this.low,
      this.pclose,
      this.pcnt});

  dm_stock.fromJson(Map<dynamic, dynamic> json) {
    stckname = json['stckname'];
    strike = json['strike'];
    op = json['op'];

    ltp = convertToDouble(json['ltp']);
    pltp = convertToDouble(json['pltp']);
    close = convertToDouble(json['close']);
    high = convertToDouble(json['high']);
    low = convertToDouble(json['low']);
    pclose = convertToDouble(json['pclose']);
    pcnt = convertToDouble(json['pcnt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stckname'] = stckname;
    data['strike'] = strike;
    data['op'] = op;
    data['ltp'] = ltp;
    data['pltp'] = pltp;
    data['close'] = close;
    data['high'] = high;
    data['low'] = low;
    data['pclose'] = pclose;
    data['pcnt'] = pcnt;
    return data;
  }
}
