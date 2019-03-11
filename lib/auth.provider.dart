import 'package:rxdart/rxdart.dart';

class AuthProvider {

  static final AuthProvider _authProvider = AuthProvider._internal();
  BehaviorSubject _tokenSubject;

  factory AuthProvider() {
    return _authProvider;
  }

  AuthProvider._internal() {
    this._tokenSubject = BehaviorSubject<String>();
  }

  setToken(token) {
    this._tokenSubject.add(token);
  }

  BehaviorSubject getToken() {
    return this._tokenSubject;
  }

  closeToken() {
    this._tokenSubject.close();
  }
  
}