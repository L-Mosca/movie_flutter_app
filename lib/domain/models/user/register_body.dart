class RegisterBody {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  RegisterBody({this.name, this.email, this.password, this.confirmPassword});

  RegisterBody.buildDefault()
    : name = "",
      email = "",
      password = "",
      confirmPassword = "";

  @override
  String toString() {
    return 'RegisterBody{name: $name, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }

  RegisterBody updateData({required RegisterBody newData}) {
    return RegisterBody(
      name: newData.name ?? name,
      email: newData.email ?? email,
      password: newData.password ?? password,
      confirmPassword: newData.confirmPassword ?? confirmPassword,
    );
  }
}
