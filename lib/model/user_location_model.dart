class UserLocationModel {
  Meta? meta;
  List<Documents>? documents;

  UserLocationModel({this.meta, this.documents});

  UserLocationModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? totalCount;

  Meta({this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Documents {
  String? regionType;
  String? addressName;
  String? region1depthName;
  String? region2depthName;
  String? region3depthName;
  String? region4depthName;
  String? code;
  double? x;
  double? y;

  Documents(
      {this.regionType,
      this.addressName,
      this.region1depthName,
      this.region2depthName,
      this.region3depthName,
      this.region4depthName,
      this.code,
      this.x,
      this.y});

  Documents.fromJson(Map<String, dynamic> json) {
    regionType = json['region_type'];
    addressName = json['address_name'];
    region1depthName = json['region_1depth_name'];
    region2depthName = json['region_2depth_name'];
    region3depthName = json['region_3depth_name'];
    region4depthName = json['region_4depth_name'];
    code = json['code'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region_type'] = this.regionType;
    data['address_name'] = this.addressName;
    data['region_1depth_name'] = this.region1depthName;
    data['region_2depth_name'] = this.region2depthName;
    data['region_3depth_name'] = this.region3depthName;
    data['region_4depth_name'] = this.region4depthName;
    data['code'] = this.code;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
