class UserData {
  int? id;
  String? name;
  String? email;
  String? token;
  String? image;

  UserData({this.id, this.name, this.email, this.token, this.image});

  @override
  String toString() {
    return 'UserData{id: $id, name: $name, email: $email, token: $token, image: $image}';
  }

  UserData.buildDefault() :
    id = 1,
    name = "Nome do Usuário",
    email = "emaildousuario@teste.com",
    token = "token",
    image = "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8";


  UserData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    token = json["token"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["token"] = token;
    data["image"] = image;
    return data;
  }
}