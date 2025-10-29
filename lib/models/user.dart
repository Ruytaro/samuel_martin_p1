class User {
  String username;
  String password;
  String avatar;
  int age;
  String pronoum;
  String province;
  bool admin;

  User(
    this.username,
    this.password, {
    this.avatar = "images/avatar.png",
    this.age = 33,
    this.pronoum = "Any",
    this.province = "Huesca",
    this.admin=false,
  });

  bool checkLogin(String name, String pass) {
    if (username == name) {
      return _isPasswordRight(pass);
    }
    return false;
  }

  bool _isPasswordRight(String pass) {
    return pass == password;
  }
}
