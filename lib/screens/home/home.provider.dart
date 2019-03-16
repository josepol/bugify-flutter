import 'dart:convert';

import 'package:bugify/auth.provider.dart';
import 'package:dio/dio.dart';

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
      Map<String, dynamic> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'bearer ' + await this.authProvider.getToken().first
      };
      var url = "http://apibuggify.polsastre.com/bug/listAll";
      Options options = Options(responseType: ResponseType.json, headers: requestHeaders);
      return await dio.get(url, options: options);
    } catch (error) {
      print(error);
    }
  }
}
