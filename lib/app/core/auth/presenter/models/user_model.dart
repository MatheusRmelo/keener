class UserModel {
  int id;
  String email;
  String name;

  UserModel({required this.id, required this.email, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(id: json['id'], email: json['email'], name: json['name']);
}
