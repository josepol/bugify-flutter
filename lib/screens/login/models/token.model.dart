class TokenModel {
  String token;

  TokenModel(this.token);

  TokenModel.fromJSON(Map json) : token = json['token'];
}
