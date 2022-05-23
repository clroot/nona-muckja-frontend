class LoginModel {
  String? password;
  String? username;

  LoginModel({this.password, this.username});

  LoginModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}
