class PartyCreate {
  Address? address;
  int? limitMemberCount;
  String? partyTime;

  PartyCreate({this.address, this.limitMemberCount, this.partyTime});

  PartyCreate.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    limitMemberCount = json['limitMemberCount'];
    partyTime = json['partyTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['limitMemberCount'] = this.limitMemberCount;
    data['partyTime'] = this.partyTime;
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
  int? latitude;
  int? longitude;

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
