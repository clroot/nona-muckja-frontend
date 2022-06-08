class PartySearch {
  ClientLocation? clientLocation;
  List<String>? foodCategories;
  int? radius;
  String? status;

  PartySearch(
      {this.clientLocation, this.foodCategories, this.radius, this.status});

  PartySearch.fromJson(Map<String, dynamic> json) {
    clientLocation = json['clientLocation'] != null
        ? new ClientLocation.fromJson(json['clientLocation'])
        : null;
    foodCategories = json['foodCategories'].cast<String>();
    radius = json['radius'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientLocation != null) {
      data['clientLocation'] = this.clientLocation!.toJson();
    }
    data['foodCategories'] = this.foodCategories;
    data['radius'] = this.radius;
    data['status'] = this.status;
    return data;
  }
}

class ClientLocation {
  double? latitude;
  double? longitude;

  ClientLocation({this.latitude, this.longitude});

  ClientLocation.fromJson(Map<String, dynamic> json) {
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
