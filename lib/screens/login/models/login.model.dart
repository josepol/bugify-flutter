class LoginModel {
  String username;
  String password;

  LoginModel(this.username, this.password);

  LoginModel.fromJSON(Map loginJSON)
      : username = loginJSON['username'],
        password = loginJSON['password'];

  Map<String, dynamic> toJSON() {
    return {"username": this.username, "password": this.password};
  }
}
