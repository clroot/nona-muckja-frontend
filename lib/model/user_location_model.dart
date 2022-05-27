import 'dart:ffi';

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
  RoadAddress? roadAddress;
  Address? address;

  Documents({this.roadAddress, this.address});

  Documents.fromJson(Map<String, dynamic> json) {
    roadAddress = json['road_address'] != null
        ? new RoadAddress.fromJson(json['road_address'])
        : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roadAddress != null) {
      data['road_address'] = this.roadAddress!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class RoadAddress {
  String? addressName;
  String? region1depthName;
  String? region2depthName;
  String? region3depthName;
  String? roadName;
  String? undergroundYn;
  String? mainBuildingNo;
  String? subBuildingNo;
  String? buildingName;
  String? zoneNo;

  RoadAddress({
    this.addressName,
    this.region1depthName,
    this.region2depthName,
    this.region3depthName,
    this.roadName,
    this.undergroundYn,
    this.mainBuildingNo,
    this.subBuildingNo,
    this.buildingName,
    this.zoneNo,
  });

  RoadAddress.fromJson(Map<String, dynamic> json) {
    addressName = json['address_name'];
    region1depthName = json['region_1depth_name'];
    region2depthName = json['region_2depth_name'];
    region3depthName = json['region_3depth_name'];
    roadName = json['road_name'];
    undergroundYn = json['underground_yn'];
    mainBuildingNo = json['main_building_no'];
    subBuildingNo = json['sub_building_no'];
    buildingName = json['building_name'];
    zoneNo = json['zone_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_name'] = this.addressName;
    data['region_1depth_name'] = this.region1depthName;
    data['region_2depth_name'] = this.region2depthName;
    data['region_3depth_name'] = this.region3depthName;
    data['road_name'] = this.roadName;
    data['underground_yn'] = this.undergroundYn;
    data['main_building_no'] = this.mainBuildingNo;
    data['sub_building_no'] = this.subBuildingNo;
    data['building_name'] = this.buildingName;
    data['zone_no'] = this.zoneNo;
    return data;
  }
}

class Address {
  String? addressName;
  String? region1depthName;
  String? region2depthName;
  String? region3depthName;
  String? mountainYn;
  String? mainAddressNo;
  String? subAddressNo;

  Address(
      {this.addressName,
      this.region1depthName,
      this.region2depthName,
      this.region3depthName,
      this.mountainYn,
      this.mainAddressNo,
      this.subAddressNo});

  Address.fromJson(Map<String, dynamic> json) {
    addressName = json['address_name'];
    region1depthName = json['region_1depth_name'];
    region2depthName = json['region_2depth_name'];
    region3depthName = json['region_3depth_name'];
    mountainYn = json['mountain_yn'];
    mainAddressNo = json['main_address_no'];
    subAddressNo = json['sub_address_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_name'] = this.addressName;
    data['region_1depth_name'] = this.region1depthName;
    data['region_2depth_name'] = this.region2depthName;
    data['region_3depth_name'] = this.region3depthName;
    data['mountain_yn'] = this.mountainYn;
    data['main_address_no'] = this.mainAddressNo;
    data['sub_address_no'] = this.subAddressNo;
    return data;
  }
}
