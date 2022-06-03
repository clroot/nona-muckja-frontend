class PartyDetailModel {
  Address? address;
  int? currentMemberCount;
  String? description;
  String? foodCategory;
  int? id;
  int? limitMemberCount;
  List<Members>? members;
  String? partyTime;
  String? status;
  String? title;

  PartyDetailModel(
      {this.address,
      this.currentMemberCount,
      this.description,
      this.foodCategory,
      this.id,
      this.limitMemberCount,
      this.members,
      this.partyTime,
      this.status,
      this.title});

  PartyDetailModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    currentMemberCount = json['currentMemberCount'];
    description = json['description'];
    foodCategory = json['foodCategory'];
    id = json['id'];
    limitMemberCount = json['limitMemberCount'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
    partyTime = json['partyTime'];
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['currentMemberCount'] = this.currentMemberCount;
    data['description'] = this.description;
    data['foodCategory'] = this.foodCategory;
    data['id'] = this.id;
    data['limitMemberCount'] = this.limitMemberCount;
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    data['partyTime'] = this.partyTime;
    data['status'] = this.status;
    data['title'] = this.title;
    return data;
  }
}

class Address {
  String? address;
  Coordinate? coordinate;
  String? roadAddress;
  String? zipCode;

  Address({this.address, this.coordinate, this.roadAddress, this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    coordinate = json['coordinate'] != null
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
    roadAddress = json['roadAddress'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
    }
    data['roadAddress'] = this.roadAddress;
    data['zipCode'] = this.zipCode;
    return data;
  }
}

class Coordinate {
  double? latitude;
  double? longitude;

  Coordinate({this.latitude, this.longitude});

  Coordinate.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Members {
  int? id;
  String? username;

  Members({this.id, this.username});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    return data;
  }
}
