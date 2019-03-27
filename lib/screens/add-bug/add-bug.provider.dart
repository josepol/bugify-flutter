import 'dart:convert';

import 'package:bugify/auth.provider.dart';
import 'package:bugify/store/bugs/bug.model.dart';
import 'package:dio/dio.dart';

class AddBugProvider {
  Dio dio;
  JsonEncoder jsonEncoder = JsonEncoder();
  AuthProvider authProvider = AuthProvider();

  AddBugProvider() {
    this.dio = Dio();
    this.jsonEncoder = JsonEncoder();
  }

  Future add(BugModel bug) async {
    try {
      Map<String, dynamic> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'bearer ' + await this.authProvider.getToken().first
      };
      var url = "http://apibuggify.polsastre.com/bug/create";
      Options options = Options(responseType: ResponseType.json, headers: requestHeaders);
      return await dio.post(url, data: bug.toJsonAdd(), options: options);
    } catch (error) {
      print(error);
    }
  }
}
