class User {
  int? id;
  String? username;
  String? password;
  String? email;
  List<String>? roles;
  String? token;

  User(
      {this.id,
      this.username,
      this.password,
      this.email,
      this.roles,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['token'] = this.token;
    return data;
  }
}
