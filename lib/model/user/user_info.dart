class UserInfo {
  int? id;
  String? username;
  String? email;
  Address? address;
  List<String>? roles;

  UserInfo({this.id, this.username, this.email, this.address, this.roles});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['roles'] = this.roles;
    return data;
  }
}

class Address {
  String? address;
  String? roadAddress;
  String? zipCode;
  Coordinate? coordinate;

  Address({this.address, this.roadAddress, this.zipCode, this.coordinate});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    roadAddress = json['roadAddress'];
    zipCode = json['zipCode'];
    coordinate = json['coordinate'] != null
        ? new Coordinate.fromJson(json['coordinate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['roadAddress'] = this.roadAddress;
    data['zipCode'] = this.zipCode;
    if (this.coordinate != null) {
      data['coordinate'] = this.coordinate!.toJson();
    }
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
