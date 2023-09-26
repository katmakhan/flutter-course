// ignore_for_file: unnecessary_this, camel_case_types

class Dm_Referred {
  String? rName;
  String? rPNum;
  String? rUpdatedon;
  String? rReferredby;
  String? rStatus;
  int? timeinmill;
  String? date;
  String? time;
  String? rkey;

  Dm_Referred(
      {this.rName,
      this.rPNum,
      this.rUpdatedon,
      this.rReferredby,
      this.rStatus,
      this.timeinmill,
      this.date,
      this.time});

  Dm_Referred.fromJson(Map<dynamic, dynamic> json) {
    rName = json['r_name'];
    rPNum = json['r_p_num'];
    rUpdatedon = json['r_updatedon'];
    rReferredby = json['r_referredby'];
    rStatus = json['r_status'];
    timeinmill = json['timeinmill'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['r_name'] = this.rName;
    data['r_p_num'] = this.rPNum;
    data['r_updatedon'] = this.rUpdatedon;
    data['r_referredby'] = this.rReferredby;
    data['r_status'] = this.rStatus;
    data['timeinmill'] = this.timeinmill;
    data['date'] = date;
    data['time'] = this.time;
    return data;
  }
}
