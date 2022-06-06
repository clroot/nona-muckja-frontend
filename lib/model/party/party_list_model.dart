class PartyListModel {
  List<Content>? content;
  int? totalElements;
  int? totalPages;
  bool? last;
  int? size;
  int? number;
  int? numberOfElements;
  bool? first;
  bool? empty;

  PartyListModel(
      {this.content,
      this.totalElements,
      this.totalPages,
      this.last,
      this.size,
      this.number,
      this.numberOfElements,
      this.first,
      this.empty});

  PartyListModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    data['last'] = this.last;
    data['size'] = this.size;
    data['number'] = this.number;
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['empty'] = this.empty;
    return data;
  }
}

class Content {
  int? id;
  Host? host;
  Address? address;
  int? limitMemberCount;
  int? currentMemberCount;
  String? status;
  List<Members>? members;
  String? partyTime;
  String? title;
  String? description;
  String? foodCategory;

  Content(
      {this.id,
      this.host,
      this.address,
      this.limitMemberCount,
      this.currentMemberCount,
      this.status,
      this.members,
      this.partyTime,
      this.title,
      this.description,
      this.foodCategory});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    host = json['host'] != null ? new Host.fromJson(json['host']) : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    limitMemberCount = json['limitMemberCount'];
    currentMemberCount = json['currentMemberCount'];
    status = json['status'];
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
    partyTime = json['partyTime'];
    title = json['title'];
    description = json['description'];
    foodCategory = json['foodCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.host != null) {
      data['host'] = this.host!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['limitMemberCount'] = this.limitMemberCount;
    data['currentMemberCount'] = this.currentMemberCount;
    data['status'] = this.status;
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    data['partyTime'] = this.partyTime;
    data['title'] = this.title;
    data['description'] = this.description;
    data['foodCategory'] = this.foodCategory;
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

class Host {
  int? id;
  String? username;
  String? email;
  Address? address;
  List<String>? roles;

  Host({this.id, this.username, this.email, this.address, this.roles});

  Host.fromJson(Map<String, dynamic> json) {
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
