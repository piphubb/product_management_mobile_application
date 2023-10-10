class RefreshTokenReq {
  RefreshTokenReq({
      this.refreshToken,});

  RefreshTokenReq.fromJson(dynamic json) {
    refreshToken = json['refreshToken'];
  }
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refreshToken'] = refreshToken;
    return map;
  }

}