class RegisterModel {
  Address? address;
  String? email;
  String? password;
  String? username;

  RegisterModel({this.address, this.email, this.password, this.username});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    email = json['email'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}

class Address {
  String? address;
  String? roadAddress;
  int? x;
  int? y;
  String? zipCode;

  Address({this.address, this.roadAddress, this.x, this.y, this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    roadAddress = json['roadAddress'];
    x = json['x'];
    y = json['y'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['roadAddress'] = this.roadAddress;
    data['x'] = this.x;
    data['y'] = this.y;
    data['zipCode'] = this.zipCode;
    return data;
  }
}
