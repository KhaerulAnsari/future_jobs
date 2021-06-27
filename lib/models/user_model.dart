class UserModel {
  late String id;
  late String email;
  late String password;
  late String name;
  late String goal;

  UserModel({
    this.id = '',
    this.email = '',
    this.password = '',
    this.name = '',
    this.goal = '',
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    goal = json['goal'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'goal': goal,
    };
  }
}
