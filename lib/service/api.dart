import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:product_management_mobile_application/auth/models/login_req.dart';
import 'package:http/http.dart' as httpClient;
import 'package:product_management_mobile_application/auth/models/login_res.dart';
import 'package:product_management_mobile_application/models/Refresh_token_req.dart';

class Api {

  Map<String, String> headers = {"Content-Type": "application/json"};
  Encoding? encodeUft8 = Encoding.getByName("uft-8");

  static String baseUrl = "http://194.233.79.158:8080/StockServerApi";
  String loginUrl = "$baseUrl/api/oauth/token";
  String getProductUrl = "$baseUrl/products";
  String getProductUrlByIdUrl = "$baseUrl/products/";
  final String refreshTokenUrl = "$baseUrl/api/oauth/refresh";
  final String getAllUnitTypesUrl = "$baseUrl/api/app/unitType/list";

  Map<String, String> headersWithToken (String token) => {
    "Content-Type": "application/json",
    "Authorization": "Bearer "+ token
  };

  Future<bool> getRefreshToken() async {
    final LocalStorage storage = LocalStorage('user_login_key');
    var url = Uri.parse(refreshTokenUrl);
    RefreshTokenReq req = RefreshTokenReq();
    req.refreshToken = await getRefreshTokenString();
    var response = await httpClient
        .post(url,
            headers: headers,
            body: jsonEncode(req.toJson()),
            encoding: encodeUft8)
        .timeout(
          const Duration(seconds: 5),
        );
    Map map = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var res = LoginRes.fromJson(map);
      storage.setItem("accessToken", res.accessToken);
      storage.setItem("refreshToken", res.refreshToken);
      return true;
    }
    storage.clear();
    return false;
  }

  Future<String> getToken() async {
    final LocalStorage storage = LocalStorage('user_login_key');
    return await storage.getItem("accessToken").toString();
  }

  Future<String> getRefreshTokenString() async {
    final LocalStorage storage = LocalStorage('user_login_key');
    return await storage.getItem("refreshToken").toString();
  }
}
