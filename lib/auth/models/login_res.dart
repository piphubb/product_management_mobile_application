class LoginRes {
  LoginRes({
      this.accessToken, 
      this.tokenType, 
      this.refreshToken, 
      this.expiresIn,});

  LoginRes.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
  }
  String? accessToken;
  String? tokenType;
  String? refreshToken;
  int? expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['tokenType'] = tokenType;
    map['refreshToken'] = refreshToken;
    map['expiresIn'] = expiresIn;
    return map;
  }

}