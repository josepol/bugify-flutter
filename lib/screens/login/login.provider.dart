import 'dart:convert';
import 'package:bugify/screens/login/models/login.model.dart';
import 'package:dio/dio.dart';

class LoginProvider {

  Dio dio;
  JsonEncoder jsonEncoder;

  LoginProvider() {
    this.dio = Dio();
    this.jsonEncoder = JsonEncoder();
  }

  Future login(LoginModel loginModel) async {
    try {
      print(loginModel.toJSON());
      return await dio.post("http://apibuggify.polsastre.com/auth/login", data: loginModel.toJSON());
    } catch(error) {
      print(error);
    }
  }
}