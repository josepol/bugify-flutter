import 'package:bugify/screens/login/models/login.model.dart';
import 'package:dio/dio.dart';

class LoginProvider {

  Dio dio;

  LoginProvider() {
    this.dio = Dio();
  }

  Future login(LoginModel loginModel) async {
    try {
      return await dio.post("http://apibuggify.polsastre.com/auth/login", data: loginModel.toJSON());
    } catch(error) {
      print(error);
    }
  }
}