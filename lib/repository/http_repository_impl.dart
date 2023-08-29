import 'dart:convert';

import 'package:product_management_mobile_application/auth/models/login_request.dart';
import 'package:product_management_mobile_application/auth/models/login_response.dart';
import 'package:product_management_mobile_application/models/http_base_response.dart';
import 'package:product_management_mobile_application/repository/http_repository.dart';
import 'package:product_management_mobile_application/service/api.dart';
import 'package:http/http.dart' as httpClient;

class HttpRepositoryImpl extends Api implements HttpRepository {
  @override
  Future<HttpBaseResponse<LoginResponse>> login(LoginRequest req) async {
    try {
      var url = Uri.parse(loginUrl);
      var response = await httpClient.post(url, body: req.toJson());
      Map map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return HttpBaseResponse(
            code: 200,
            isSuccess: true,
            message: "Login Success",
            data: LoginResponse.fromJson(map));
      } else {
        return HttpBaseResponse(
            code: 400,
            isSuccess: false,
            message: map['message'],
            data: null
        );
      }
    } catch (e) {
      return HttpBaseResponse(
          code: 500,
          isSuccess: false,
          message: e.toString(),
          data: null
      );
    }
  }
}
