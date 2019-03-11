import 'dart:convert';

import 'package:bugify/auth.provider.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class HomeProvider {
  Dio dio;
  JsonEncoder jsonEncoder = JsonEncoder();
  AuthProvider authProvider = AuthProvider();

  HomeProvider() {
    this.dio = Dio();
    this.jsonEncoder = JsonEncoder();
  }

  Future getBugs() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': await this.authProvider.getToken().first
      };
      var url = "http://apibuggify.polsastre.com/bug/listAll";
      return await http.get(url, headers: requestHeaders);
    } catch (error) {
      print(error);
    }
  }
}
